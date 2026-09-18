#!/usr/bin/env bash
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
