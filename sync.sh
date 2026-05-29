#!/bin/bash
# Exports all n8n workflows from Docker and pushes to GitHub

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
CONTAINER="n8n"

cd "$REPO_DIR"

docker exec "$CONTAINER" mkdir -p /tmp/n8n-export
docker exec "$CONTAINER" n8n export:workflow --all --output=/tmp/n8n-export/workflows.json
docker cp "$CONTAINER":/tmp/n8n-export/workflows.json "$REPO_DIR/workflows.json"
docker exec "$CONTAINER" rm -f /tmp/n8n-export/workflows.json

git add workflows.json
if git diff --cached --quiet; then
  echo "No workflow changes to commit."
  exit 0
fi

git commit -m "sync: n8n workflows $(date '+%Y-%m-%d %H:%M')"
git push origin main
echo "Pushed to GitHub successfully."
