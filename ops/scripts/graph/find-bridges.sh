#!/usr/bin/env bash
# find-bridges.sh — Find structurally critical notes (many cross-project links)
# These are notes whose removal would disconnect graph regions.
# Usage: bash ops/scripts/graph/find-bridges.sh

VAULT_ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
NOTES="$VAULT_ROOT/notes"

echo "=== Bridge Notes (high cross-project connectivity) ==="
echo ""

declare -A link_counts

for note in "$NOTES"/*.md; do
  [ -f "$note" ] || continue
  BASENAME=$(basename "$note" .md)

  # Count unique files that link TO this note
  INCOMING=$(rg "\[\[$BASENAME\]\]" "$VAULT_ROOT" --glob '*.md' -l 2>/dev/null | grep -v "^$note$" | wc -l | tr -d ' ')
  link_counts["$BASENAME"]=$INCOMING
done

# Sort by incoming link count and show top 10
echo "Top notes by incoming links:"
echo ""
for note_name in "${!link_counts[@]}"; do
  echo "${link_counts[$note_name]} $note_name"
done | sort -rn | head -10 | while read -r count name; do
  note_file="$NOTES/${name}.md"
  PROJECT=$(grep '^project:' "$note_file" 2>/dev/null | head -1 | sed 's/^project: //')
  DESC=$(grep '^description:' "$note_file" 2>/dev/null | head -1 | sed 's/^description: //')
  echo "  $count links → [$PROJECT] $name"
  echo "  $DESC"
  echo ""
done
