#!/usr/bin/env bash
# orphan-notes.sh — Find notes with no incoming wiki links
# Usage: bash ops/scripts/orphan-notes.sh

VAULT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
NOTES="$VAULT_ROOT/notes"

echo "=== Orphan Notes (no incoming links) ==="
echo ""

ORPHAN_COUNT=0

for note in "$NOTES"/*.md; do
  [ -f "$note" ] || continue
  BASENAME=$(basename "$note" .md)

  # Skip topic maps and the index
  TYPE=$(grep '^type:' "$note" | head -1 | sed 's/^type: //')
  if [ "$TYPE" = "moc" ]; then
    continue
  fi

  # Count incoming links from all markdown files
  INCOMING=$(rg "\[\[$BASENAME\]\]" "$VAULT_ROOT" --glob '*.md' -l 2>/dev/null | grep -v "^$note$" | wc -l | tr -d ' ')

  if [ "$INCOMING" -eq 0 ]; then
    DESC=$(grep '^description:' "$note" | head -1 | sed 's/^description: //')
    PROJECT=$(grep '^project:' "$note" | head -1 | sed 's/^project: //')
    echo "  [$PROJECT] $BASENAME"
    echo "  $DESC"
    echo ""
    ORPHAN_COUNT=$((ORPHAN_COUNT + 1))
  fi
done

if [ "$ORPHAN_COUNT" -eq 0 ]; then
  echo "  No orphan notes found."
else
  echo "Total: $ORPHAN_COUNT orphan note(s)"
  echo "Fix: run /connect on each orphaned note to find topic map placements"
fi
