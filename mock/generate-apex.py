#!/usr/bin/env python3
"""Generate chunked mock/seed-NN.apex scripts, mock/clear.apex and mock/seed.sh
from mock/schemas/*.json (order from mock/import-plan.json).

Anonymous Apex is capped at 32,000 characters per script, so the seed data is
split across multiple scripts. The referenceId -> Id map is persisted between
chunks as a ContentVersion titled 'mock-seed-refs'; the last chunk deletes it.
"""
import glob
import json
import os

MOCK_DIR = os.path.dirname(os.path.abspath(__file__))
DATA_BUDGET = 21000  # minified JSON chars per chunk; engine + overhead adds ~7KB
MAX_FILE = 31000


def apex_escape(s: str) -> str:
    return s.replace("\\", "\\\\").replace("'", "\\'")


def load(rel):
    with open(os.path.join(MOCK_DIR, rel)) as f:
        return json.load(f)


def minify(obj) -> str:
    return json.dumps(obj, separators=(",", ":"), ensure_ascii=True)


plan = load("import-plan.json")

# Flatten the plan into an ordered list of records, each tagged with its
# sObject type, source file and referenceId. attributes.type is dropped
# (redundant with the group type) to save script space.
flat = []  # (sobject, source_file, record_dict)
for entry in plan:
    for rel in entry["files"]:
        for record in load(rel)["records"]:
            attributes = record.get("attributes", {})
            record = dict(record)
            record["attributes"] = {"referenceId": attributes.get("referenceId")}
            flat.append((entry["sobject"], rel, record))

# Pack records into chunks; within a chunk, contiguous same-type records form
# one insert group.
chunks = []  # list of chunk; chunk = list of groups; group = dict
current_chunk, current_size = [], 0
for sobject, source, record in flat:
    record_json = minify(record)
    added = len(record_json) + 1
    if current_chunk and current_size + added > DATA_BUDGET:
        chunks.append(current_chunk)
        current_chunk, current_size = [], 0
    # A new insert group starts on every source-file change (not just sObject
    # change): files like Locations-Blocks.json reference records from
    # Locations-Sites.json even though both are animalos__Location__c, so they
    # must be inserted separately for '@Ref' resolution to work.
    if not current_chunk or current_chunk[-1]["sources"] != [source]:
        current_chunk.append({"sobject": sobject, "sources": [source], "records": []})
        current_size += len(sobject) + 60
    group = current_chunk[-1]
    group["records"].append(record)
    current_size += added
if current_chunk:
    chunks.append(current_chunk)

total_parts = len(chunks)

ENGINE = r"""
// ---------------------------------------------------------------------------
// Engine (identical in every part): resolves RecordTypes dynamically, resolves
// '@Ref' lookups against the Ids of records inserted by this and earlier
// parts, coerces field values via describe metadata, and inserts in order.
// The referenceId -> Id map is carried between parts in a ContentVersion.
// ---------------------------------------------------------------------------

String refsTitle = 'mock-seed-refs';
Map<String, Schema.SObjectType> globalDescribe = Schema.getGlobalDescribe();

Map<String, Id> refIds = new Map<String, Id>();
Id refsDocumentId = null;

if (partNumber == 1) {
    delete [SELECT Id FROM ContentDocument WHERE Title = :refsTitle];
} else {
    List<ContentVersion> existing = [
        SELECT VersionData, ContentDocumentId
        FROM ContentVersion
        WHERE Title = :refsTitle AND IsLatest = true
        LIMIT 1
    ];
    if (existing.isEmpty()) {
        throw new MockSeedException(
            'Reference map not found. Run the seed parts in order, starting with seed-01.apex.'
        );
    }
    refsDocumentId = existing[0].ContentDocumentId;
    Map<String, Object> stored =
        (Map<String, Object>) JSON.deserializeUntyped(existing[0].VersionData.toString());
    for (String key : stored.keySet()) {
        refIds.put(key, (Id) ((String) stored.get(key)));
    }
}

// Only ACTIVE record types can be assigned on insert. Orgs may carry both a
// managed (animalos) and a local copy of the same DeveloperName — prefer the
// active one, and the org-local one when both are active.
Set<String> chunkSobjects = new Set<String>(groupTypes);
Map<String, Id> recordTypeIds = new Map<String, Id>();
Set<String> activeRtKeys = new Set<String>();
for (RecordType rt : [
    SELECT Id, DeveloperName, SobjectType, IsActive, NamespacePrefix
    FROM RecordType
    WHERE SobjectType IN :chunkSobjects
]) {
    String key = rt.SobjectType + '.' + rt.DeveloperName;
    if (rt.IsActive && (!activeRtKeys.contains(key) || rt.NamespacePrefix == null)) {
        recordTypeIds.put(key, rt.Id);
        activeRtKeys.add(key);
    }
}
Set<String> warnedRecordTypes = new Set<String>();

// Fallbacks for orgs where the managed record types are deactivated and
// replaced by local equivalents (e.g. RSPCA sandboxes). The exact
// DeveloperName always wins when it has an active record type.
Map<String, String> recordTypeAliases = new Map<String, String>{
    'animalos__Referral__c.Inbound_Return' =>
        'Return_Animals_returned_less_that_14_days_post_adoption',
    'animalos__Referral__c.Inbound_Stray' => 'Stray',
    'animalos__Referral__c.Inbound_Surrender' => 'Surrender'
};

Integer totalInserted = 0;

for (Integer g = 0; g < groupTypes.size(); g++) {
    String sobjectName = groupTypes[g];
    Schema.SObjectType sobjectType = globalDescribe.get(sobjectName);
    if (sobjectType == null) {
        throw new MockSeedException('Unknown sObject type: ' + sobjectName);
    }
    Map<String, Schema.SObjectField> fieldMap = sobjectType.getDescribe().fields.getMap();

    Map<String, Object> payload = (Map<String, Object>) JSON.deserializeUntyped(groupJson[g]);
    List<Object> records = (List<Object>) payload.get('records');

    List<SObject> toInsert = new List<SObject>();
    List<String> referenceIds = new List<String>();

    for (Object recordObj : records) {
        Map<String, Object> recordMap = (Map<String, Object>) recordObj;
        Map<String, Object> attributes = (Map<String, Object>) recordMap.get('attributes');
        SObject record = sobjectType.newSObject();

        for (String key : recordMap.keySet()) {
            if (key == 'attributes') {
                continue;
            }
            Object value = recordMap.get(key);

            if (key == 'RecordType') {
                String developerName = (String) ((Map<String, Object>) value).get('DeveloperName');
                String rtKey = sobjectName + '.' + developerName;
                Id recordTypeId = recordTypeIds.get(rtKey);
                if (recordTypeId == null && recordTypeAliases.containsKey(rtKey)) {
                    recordTypeId = recordTypeIds.get(
                        sobjectName + '.' + recordTypeAliases.get(rtKey));
                }
                if (recordTypeId != null) {
                    record.put('RecordTypeId', recordTypeId);
                } else if (warnedRecordTypes.add(rtKey)) {
                    System.debug(LoggingLevel.WARN,
                        'No active RecordType ' + developerName + ' for ' + sobjectName +
                        ' in this org — affected records will use the default record type.');
                }
                continue;
            }

            if (value == null) {
                continue;
            }

            Schema.SObjectField field = fieldMap.get(key.toLowerCase());
            if (field == null) {
                throw new MockSeedException('Unknown field ' + key + ' on ' + sobjectName);
            }
            Schema.DisplayType fieldType = field.getDescribe().getType();

            if (value instanceof String) {
                String stringValue = (String) value;
                if (stringValue.startsWith('@')) {
                    Id refId = refIds.get(stringValue.substring(1));
                    if (refId == null) {
                        throw new MockSeedException(
                            'Unresolved reference ' + stringValue + ' on ' + sobjectName + '.' + key +
                            '. Run the seed parts in order, starting with seed-01.apex.'
                        );
                    }
                    record.put(field, refId);
                } else if (fieldType == Schema.DisplayType.DATE) {
                    record.put(field, Date.valueOf(stringValue));
                } else if (fieldType == Schema.DisplayType.DATETIME) {
                    record.put(field, (Datetime) JSON.deserialize('"' + stringValue + '"', Datetime.class));
                } else {
                    record.put(field, stringValue);
                }
            } else if (value instanceof Boolean) {
                record.put(field, value);
            } else {
                Decimal decimalValue = (value instanceof Decimal)
                    ? (Decimal) value
                    : Decimal.valueOf(String.valueOf(value));
                if (fieldType == Schema.DisplayType.INTEGER) {
                    record.put(field, decimalValue.intValue());
                } else {
                    record.put(field, decimalValue);
                }
            }
        }

        toInsert.add(record);
        referenceIds.add(attributes == null ? null : (String) attributes.get('referenceId'));
    }

    if (toInsert.isEmpty()) {
        continue;
    }

    insert toInsert;
    totalInserted += toInsert.size();

    for (Integer i = 0; i < toInsert.size(); i++) {
        if (referenceIds[i] != null) {
            refIds.put(referenceIds[i], toInsert[i].Id);
        }
    }

    System.debug('Inserted ' + toInsert.size() + ' ' + sobjectName + ' record(s)');
}

if (partNumber < totalParts) {
    ContentVersion refsVersion = new ContentVersion(
        Title = refsTitle,
        PathOnClient = refsTitle + '.json',
        VersionData = Blob.valueOf(JSON.serialize(refIds))
    );
    if (refsDocumentId != null) {
        refsVersion.ContentDocumentId = refsDocumentId;
    }
    insert refsVersion;
} else if (refsDocumentId != null) {
    delete [SELECT Id FROM ContentDocument WHERE Id = :refsDocumentId];
}

System.debug('Seed part ' + partNumber + ' of ' + totalParts +
    ' complete. Records inserted by this part: ' + totalInserted);
"""

# Remove stale generated seed files, then write the new parts.
for old in glob.glob(os.path.join(MOCK_DIR, "seed*.apex")):
    os.remove(old)

for index, chunk in enumerate(chunks, start=1):
    part = f"{index:02d}"
    lines = []
    lines.append(f"// Seed mock data into an org — part {index} of {total_parts}.")
    lines.append("//")
    lines.append("// GENERATED from mock/schemas/*.json (insert order from mock/import-plan.json),")
    lines.append("// split across parts because anonymous Apex scripts are capped at 32,000 chars.")
    lines.append("// Regenerate after editing the JSON.")
    lines.append("//")
    lines.append("// Run every part IN ORDER against the same org (or use mock/seed.sh):")
    for i in range(1, total_parts + 1):
        lines.append(f"//   sf apex run --file mock/seed-{i:02d}.apex --target-org <alias>")
    lines.append("")
    lines.append("class MockSeedException extends Exception {}")
    lines.append("")
    lines.append(f"Integer partNumber = {index};")
    lines.append(f"Integer totalParts = {total_parts};")
    lines.append("")
    lines.append("List<String> groupTypes = new List<String>();")
    lines.append("List<String> groupJson = new List<String>();")
    lines.append("")
    for group in chunk:
        payload = minify({"records": group["records"]})
        lines.append(f"// {', '.join(group['sources'])} ({len(group['records'])} records)")
        lines.append(f"groupTypes.add('{group['sobject']}');")
        lines.append(f"groupJson.add('{apex_escape(payload)}');")
        lines.append("")
    lines.append(ENGINE.strip())
    content = "\n".join(lines) + "\n"
    assert len(content) <= MAX_FILE, f"part {part} is {len(content)} bytes (> {MAX_FILE})"
    path = os.path.join(MOCK_DIR, f"seed-{part}.apex")
    with open(path, "w") as f:
        f.write(content)
    print(f"seed-{part}.apex: {len(content)} bytes, "
          f"{sum(len(g['records']) for g in chunk)} records, {len(chunk)} group(s)")

# ---------------- seed.sh convenience wrapper ----------------
seed_sh = """#!/usr/bin/env bash
# Run all mock seed parts in order via the sf CLI.
# Usage: ./mock/seed.sh <org-alias>

set -euo pipefail

ORG="${1:?Usage: seed.sh <org-alias>}"
DIR="$(cd "$(dirname "$0")" && pwd)"

command -v sf >/dev/null || { echo "ERROR: sf CLI is required" >&2; exit 1; }

for part in "$DIR"/seed-*.apex; do
  echo ">>> Running $(basename "$part") against $ORG ..."
  sf apex run --file "$part" --target-org "$ORG"
done

echo ""
echo "Done! Mock data seeded into $ORG."
"""
seed_sh_path = os.path.join(MOCK_DIR, "seed.sh")
with open(seed_sh_path, "w") as f:
    f.write(seed_sh)
os.chmod(seed_sh_path, 0o755)
print("seed.sh written")

# ---------------- clear.apex ----------------
def apex_string_set(name: str, values, indent: str = "    ") -> str:
    items = ",\n".join(f"{indent}'{apex_escape(v)}'" for v in values)
    return f"Set<String> {name} = new Set<String>{{\n{items}\n}};"


def uniq(seq):
    seen = set()
    out = []
    for v in seq:
        if v not in seen:
            seen.add(v)
            out.append(v)
    return out


job_names = [r["Name"] for r in load("schemas/Jobs.json")["records"]]
loi_names = [r["Name"] for r in load("schemas/LocationOfInterests.json")["records"]]
breed_ids = [r["animalos__Breed_ID__c"] for r in load("schemas/Breeds.json")["records"]]
location_names = [
    r["Name"]
    for rel in ("schemas/Locations-Sites.json", "schemas/Locations-Blocks.json", "schemas/Locations-Units.json")
    for r in load(rel)["records"]
]
action_plan_names = [r["Name"] for r in load("schemas/ActionPlans.json")["records"]]
medicine_names = [r["Name"] for r in load("schemas/Medicines.json")["records"]]
shelter_ids = [r["animalos__Shelter_ID__c"] for r in load("schemas/Animals.json")["records"]]
contact_last_names = [r["LastName"] for r in load("schemas/Contacts.json")["records"]]

clear_header = """// Clear seeded mock data from an org.
//
// GENERATED from mock/schemas/*.json: the identifier sets below are derived
// from the seeded records' names/external ids. Regenerate after editing the JSON.
//
// Usage: sf apex run --file mock/clear.apex --target-org <alias>
//
// Contacts, Accounts, Job Bundles and Job Activities are located via their
// relationships to the seeded Jobs/Animals, then everything is deleted
// children-first. Also removes any leftover 'mock-seed-refs' file from a
// partially-run seed.
"""

sets_src = "\n".join(
    [
        apex_string_set("seededJobNames", uniq(job_names)),
        apex_string_set("animalShelterIds", uniq(shelter_ids)),
        apex_string_set("locationOfInterestNames", uniq(loi_names)),
        apex_string_set("breedIds", uniq(breed_ids)),
        apex_string_set("locationNames", uniq(location_names)),
        apex_string_set("actionPlanNames", uniq(action_plan_names)),
        apex_string_set("medicineNames", uniq(medicine_names)),
        apex_string_set("seededContactLastNames", uniq(contact_last_names)),
    ]
)

clear_body = r"""
Set<Id> contactIds = new Set<Id>();
Set<Id> accountIds = new Set<Id>();
Set<Id> jobIds = new Set<Id>();
Set<Id> jobBundleIds = new Set<Id>();
Set<Id> jobActivityIds = new Set<Id>();
Set<Id> jobContactIds = new Set<Id>();

for (animalos__Job__c record : [
    SELECT Id
    FROM animalos__Job__c
    WHERE Name IN :seededJobNames
       OR animalos__Location_Of_Interest__r.Name IN :locationOfInterestNames
]) {
    jobIds.add(record.Id);
}

for (animalos__Animal_Referral__c record : [
    SELECT animalos__Job__c
    FROM animalos__Animal_Referral__c
    WHERE animalos__Animal__r.animalos__Shelter_ID__c IN :animalShelterIds
      AND animalos__Job__c != null
]) {
    jobIds.add(record.animalos__Job__c);
}

if (!jobIds.isEmpty()) {
    for (animalos__Job__c record : [
        SELECT Id, animalos__Job_Bundle__c
        FROM animalos__Job__c
        WHERE Id IN :jobIds
    ]) {
        if (record.animalos__Job_Bundle__c != null) {
            jobBundleIds.add(record.animalos__Job_Bundle__c);
        }
    }

    for (animalos__Job_Activity__c record : [
        SELECT Id
        FROM animalos__Job_Activity__c
        WHERE animalos__Job__c IN :jobIds
    ]) {
        jobActivityIds.add(record.Id);
    }

    for (animalos__Job_Contact__c record : [
        SELECT Id, animalos__Contact__c, animalos__Organization__c
        FROM animalos__Job_Contact__c
        WHERE animalos__Job__c IN :jobIds
    ]) {
        jobContactIds.add(record.Id);
        if (record.animalos__Contact__c != null) {
            contactIds.add(record.animalos__Contact__c);
        }
        if (record.animalos__Organization__c != null) {
            accountIds.add(record.animalos__Organization__c);
        }
    }

    for (animalos__Referral__c record : [
        SELECT animalos__Contact__c, animalos__Referral_Organisation__c
        FROM animalos__Referral__c
        WHERE animalos__Job__c IN :jobIds
    ]) {
        if (record.animalos__Contact__c != null) {
            contactIds.add(record.animalos__Contact__c);
        }
        if (record.animalos__Referral_Organisation__c != null) {
            accountIds.add(record.animalos__Referral_Organisation__c);
        }
    }
}

if (!jobActivityIds.isEmpty()) {
    delete [SELECT Id FROM animalos__Assigned_Resource__c WHERE animalos__Job_Activity__c IN :jobActivityIds];
    delete [SELECT Id FROM animalos__Job_Activity_Animal__c WHERE animalos__Job_Activity__c IN :jobActivityIds];
}

delete [SELECT Id FROM animalos__Animal_Referral__c WHERE animalos__Animal__r.animalos__Shelter_ID__c IN :animalShelterIds];

if (!jobIds.isEmpty()) {
    delete [SELECT Id FROM animalos__Job_Note__c WHERE animalos__Job__c IN :jobIds];
    delete [SELECT Id FROM animalos__Job_Role__c WHERE animalos__Job__c IN :jobIds];
    delete [SELECT Id FROM animalos__Job_Status_Tracking__c WHERE animalos__Job__c IN :jobIds];
}

if (!jobContactIds.isEmpty()) {
    delete [SELECT Id FROM animalos__Interaction_Caution__c WHERE animalos__Job_Contact__c IN :jobContactIds];
    delete [SELECT Id FROM animalos__Charge_Outcome__c WHERE animalos__Job_Contact__c IN :jobContactIds];
}

if (!jobActivityIds.isEmpty()) {
    delete [SELECT Id FROM animalos__Job_Activity__c WHERE Id IN :jobActivityIds];
}

delete [SELECT Id FROM animalos__Animal_Action__c WHERE animalos__Animal__r.animalos__Shelter_ID__c IN :animalShelterIds];
delete [SELECT Id FROM animalos__Animal_Note__c WHERE animalos__Animal__r.animalos__Shelter_ID__c IN :animalShelterIds];
delete [SELECT Id FROM animalos__Movement__c WHERE animalos__Animal__r.animalos__Shelter_ID__c IN :animalShelterIds];

if (!jobIds.isEmpty()) {
    delete [SELECT Id FROM animalos__Referral__c WHERE animalos__Job__c IN :jobIds];
    delete [SELECT Id FROM animalos__Medicine_Used__c WHERE animalos__Job__c IN :jobIds];
    delete [SELECT Id FROM animalos__Animal_Report__c WHERE animalos__Job__c IN :jobIds];
    delete [SELECT Id FROM animalos__Enforcement_Action__c WHERE animalos__Job__c IN :jobIds];
}

if (!jobContactIds.isEmpty()) {
    delete [SELECT Id FROM animalos__Job_Contact__c WHERE Id IN :jobContactIds];
}

delete [SELECT Id FROM animalos__Animal__c WHERE animalos__Shelter_ID__c IN :animalShelterIds];

if (!jobIds.isEmpty()) {
    delete [SELECT Id FROM animalos__Job__c WHERE Id IN :jobIds];
}

delete [SELECT Id FROM animalos__Location_Of_Interest__c WHERE Name IN :locationOfInterestNames];

if (!jobBundleIds.isEmpty()) {
    delete [SELECT Id FROM animalos__Job_Bundle__c WHERE Id IN :jobBundleIds];
}

delete [SELECT Id FROM animalos__Action_Plan__c WHERE Name IN :actionPlanNames];
delete [SELECT Id FROM animalos__Medicine__c WHERE Name IN :medicineNames];
delete [SELECT Id FROM animalos__Location__c WHERE Name IN :locationNames];
delete [SELECT Id FROM animalos__Breed__c WHERE animalos__Breed_ID__c IN :breedIds];

// Seeded contacts carry only a last name; pick up any not linked to a seeded
// job (their NPSP household accounts are removed automatically by NPSP).
for (Contact record : [
    SELECT Id
    FROM Contact
    WHERE LastName IN :seededContactLastNames
      AND FirstName = null
      AND Email = null
      AND Phone = null
]) {
    contactIds.add(record.Id);
}

if (!contactIds.isEmpty()) {
    delete [SELECT Id FROM Contact WHERE Id IN :contactIds];
}

if (!accountIds.isEmpty()) {
    delete [SELECT Id FROM Account WHERE Id IN :accountIds];
}

// Leftover reference-map file from a partially-run seed, if any.
delete [SELECT Id FROM ContentDocument WHERE Title = 'mock-seed-refs'];

System.debug('Mock dataset clear complete.');
"""

with open(os.path.join(MOCK_DIR, "clear.apex"), "w") as f:
    f.write(clear_header + "\n" + sets_src + "\n" + clear_body)
print("clear.apex:", os.path.getsize(os.path.join(MOCK_DIR, "clear.apex")), "bytes")
