#!/bin/bash
# Exports all n8n workflows from Docker into per-workflow folders and pushes to GitHub

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
CONTAINER="n8n"
TMP_FILE="/tmp/n8n-all-workflows.json"

cd "$REPO_DIR"

docker exec "$CONTAINER" n8n export:workflow --all --output="$TMP_FILE"
docker cp "$CONTAINER":"$TMP_FILE" /tmp/n8n-all-workflows.json
docker exec "$CONTAINER" rm -f "$TMP_FILE"

python3 - <<EOF
import json, os, re

with open("/tmp/n8n-all-workflows.json") as f:
    workflows = json.load(f)

for workflow in workflows:
    name = workflow.get("name", "unnamed")
    folder = re.sub(r'[^\w\s-]', '', name).strip().replace(' ', '_')
    os.makedirs(os.path.join("$REPO_DIR", folder), exist_ok=True)
    out_path = os.path.join("$REPO_DIR", folder, "workflow.json")
    with open(out_path, "w") as f:
        json.dump(workflow, f, indent=2)

print(f"Exported {len(workflows)} workflows.")
EOF

git add -A
if git diff --cached --quiet; then
  echo "No workflow changes to commit."
  exit 0
fi

git commit -m "sync: n8n workflows $(date '+%Y-%m-%d %H:%M')"
git push origin main
echo "Pushed to GitHub successfully."
