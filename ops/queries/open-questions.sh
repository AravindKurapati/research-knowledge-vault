#!/usr/bin/env bash
# open-questions.sh — All open questions by project
# Usage: bash ops/queries/open-questions.sh

VAULT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
NOTES="$VAULT_ROOT/notes"

echo "=== Open Questions by Project ==="
echo ""

for project in follicular-lymphoma tcga-lung alphafold cross-project; do
  MATCHES=$(rg '^type: question' "$NOTES" --glob '*.md' -l 2>/dev/null | xargs grep -l "^project: $project" 2>/dev/null)
  if [ -n "$MATCHES" ]; then
    echo "-- $project --"
    echo "$MATCHES" | while read -r f; do
      TITLE=$(grep '^# ' "$f" | head -1 | sed 's/^# //')
      CONF=$(grep '^confidence:' "$f" | head -1 | sed 's/^confidence: //')
      echo "  [$CONF] $TITLE"
    done
    echo ""
  fi
done
