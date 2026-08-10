#!/usr/bin/env bash
# Import mock data into a scratch org. Requires SF_TARGET_ORG (cci task run import --org <name>).

set -euo pipefail

: "${SF_TARGET_ORG:?SF_TARGET_ORG is required. Run: cci task run import --org dev}"

DIR="$(cd "$(dirname "$0")" && pwd)"
PLAN_FILE="$DIR/import-plan.json"
TEMP_DIR="$(mktemp -d "$DIR/.tmp.XXXXXX")"

cleanup() { rm -rf "$TEMP_DIR"; }
trap cleanup EXIT

command -v jq >/dev/null || { echo "ERROR: jq is required" >&2; exit 1; }
command -v sf >/dev/null || { echo "ERROR: sf CLI is required" >&2; exit 1; }

if [ ! -f "$PLAN_FILE" ]; then
  echo "ERROR: Import plan not found: $PLAN_FILE" >&2
  exit 1
fi

mapfile -t PLAN_FILES < <(jq -r '.[].files[]' "$PLAN_FILE")

if [ "${#PLAN_FILES[@]}" -eq 0 ]; then
  echo "ERROR: No files found in import plan: $PLAN_FILE" >&2
  exit 1
fi

declare -A FILE_SOBJECTS=()
declare -A FILE_RT_NAMES=()
declare -A REQUIRED_SOBJECTS=()

echo "Scanning import plan ..."

for relative_path in "${PLAN_FILES[@]}"; do
  source_file="$DIR/$relative_path"
  file_name="$(basename "$relative_path")"

  if [ ! -f "$source_file" ]; then
    echo "ERROR: Schema file not found: $source_file" >&2
    exit 1
  fi

  sobject_type="$(jq -r '.records[0].attributes.type // empty' "$source_file")"
  if [ -z "$sobject_type" ]; then
    echo "ERROR: Could not determine sObject type from: $source_file" >&2
    exit 1
  fi

  FILE_SOBJECTS["$file_name"]="$sobject_type"

  mapfile -t record_type_names < <(
    jq -r '.records[] | .RecordType.DeveloperName? // empty' "$source_file" | sort -u
  )

  if [ "${#record_type_names[@]}" -gt 0 ] && [ -n "${record_type_names[0]}" ]; then
    FILE_RT_NAMES["$file_name"]="$(printf '%s\n' "${record_type_names[@]}")"
    REQUIRED_SOBJECTS["$sobject_type"]=1
  fi
done

RT_QUERY_JSON='{"result":{"records":[]}}'

if [ "${#REQUIRED_SOBJECTS[@]}" -gt 0 ]; then
  sobject_in_clause=""
  for sobject in "${!REQUIRED_SOBJECTS[@]}"; do
    if [ -n "$sobject_in_clause" ]; then
      sobject_in_clause+=","
    fi
    sobject_in_clause+="'$sobject'"
  done

  echo "Querying RecordType IDs from org: $SF_TARGET_ORG ..."
  RT_QUERY_JSON="$(sf data query \
    --query "SELECT Id, DeveloperName, SobjectType FROM RecordType WHERE SobjectType IN (${sobject_in_clause})" \
    --json --target-org "$SF_TARGET_ORG")"
fi

get_rt_id() {
  local sobject="$1"
  local developer_name="$2"

  echo "$RT_QUERY_JSON" | jq -r \
    --arg sobject "$sobject" \
    --arg developer_name "$developer_name" \
    '.result.records[]
      | select(.SobjectType == $sobject and .DeveloperName == $developer_name)
      | .Id' \
    | head -n 1
}

patch_record_types() {
  local source_file="$1"
  local destination_file="$2"
  local sobject="$3"
  local file_name
  local rt_map_json='{}'

  file_name="$(basename "$source_file")"

  while IFS= read -r developer_name; do
    [ -z "$developer_name" ] && continue

    rt_id="$(get_rt_id "$sobject" "$developer_name")"
    if [ -z "$rt_id" ]; then
      echo "ERROR: Could not resolve RecordType '$developer_name' for $sobject" >&2
      exit 1
    fi

    rt_map_json="$(
      jq -cn \
        --argjson current "$rt_map_json" \
        --arg key "$developer_name" \
        --arg value "$rt_id" \
        '$current + {($key): $value}'
    )"
  done <<< "${FILE_RT_NAMES["$file_name"]}"

  jq --argjson rt_ids "$rt_map_json" '
    .records |= map(
      if (.RecordType.DeveloperName? // empty) != "" then
        . + {
          RecordTypeId: (
            $rt_ids[.RecordType.DeveloperName]
            // error("Missing RecordTypeId for " + .RecordType.DeveloperName)
          )
        }
        | del(.RecordType)
      else
        .
      end
    )' "$source_file" > "$destination_file"
}

echo "Preparing schema files in $TEMP_DIR ..."

for relative_path in "${PLAN_FILES[@]}"; do
  source_file="$DIR/$relative_path"
  file_name="$(basename "$relative_path")"
  destination_file="$TEMP_DIR/$file_name"
  sobject="${FILE_SOBJECTS["$file_name"]}"

  if [ -n "${FILE_RT_NAMES["$file_name"]:-}" ]; then
    echo "  Patching RecordTypes for $file_name ($sobject)"
    patch_record_types "$source_file" "$destination_file" "$sobject"
  else
    cp "$source_file" "$destination_file"
  fi
done

echo "Preparing temp import plan ..."
jq '[.[] | .files = [.files[] | split("/")[-1]]]' "$PLAN_FILE" > "$TEMP_DIR/import-plan.json"

echo "Importing mock data into $SF_TARGET_ORG ..."
sf data import tree --plan "$TEMP_DIR/import-plan.json" --target-org "$SF_TARGET_ORG"

echo ""
echo "Done! Mock data imported successfully."
