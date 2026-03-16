#!/usr/bin/env bash
# cross-project-methodology.sh — Find claims that span multiple projects
# Usage: bash ops/queries/cross-project-methodology.sh
# Shows: notes tagged project: cross-project, plus notes linked from multiple project topic maps

VAULT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
NOTES="$VAULT_ROOT/notes"

echo "=== Cross-Project Claims ==="
echo ""

echo "-- Explicitly tagged cross-project --"
rg '^project: cross-project' "$NOTES" -l --glob '*.md' | while read -r f; do
  DESC=$(grep '^description:' "$f" | head -1 | sed 's/^description: //')
  echo "  $(basename "$f" .md)"
  echo "  $DESC"
  echo ""
done

echo ""
echo "-- Notes linked from multiple project topic maps --"
for note in "$NOTES"/*.md; do
  [ -f "$note" ] || continue
  BASENAME=$(basename "$note" .md)
  # Count which project topic maps link to this note
  REFS=0
  for pm in follicular-lymphoma tcga-lung alphafold; do
    if rg -q "\[\[$BASENAME\]\]" "$NOTES/$pm.md" 2>/dev/null; then
      REFS=$((REFS + 1))
    fi
  done
  if [ "$REFS" -ge 2 ]; then
    DESC=$(grep '^description:' "$note" | head -1 | sed 's/^description: //')
    echo "  $BASENAME (in $REFS project maps)"
    echo "  $DESC"
    echo ""
  fi
done
