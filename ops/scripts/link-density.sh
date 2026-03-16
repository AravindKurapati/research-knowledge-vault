#!/usr/bin/env bash
# link-density.sh — Average links per note (target: 3+)
# Usage: bash ops/scripts/link-density.sh

VAULT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
NOTES="$VAULT_ROOT/notes"

echo "=== Link Density Analysis ==="
echo ""

TOTAL_NOTES=0
TOTAL_LINKS=0
LOW_LINK_COUNT=0

for note in "$NOTES"/*.md; do
  [ -f "$note" ] || continue
  TYPE=$(grep '^type:' "$note" | head -1 | sed 's/^type: //')
  [ "$TYPE" = "moc" ] && continue

  TOTAL_NOTES=$((TOTAL_NOTES + 1))
  LINKS=$(grep -o '\[\[[^\]]*\]\]' "$note" 2>/dev/null | wc -l | tr -d ' ')
  TOTAL_LINKS=$((TOTAL_LINKS + LINKS))

  if [ "$LINKS" -lt 2 ]; then
    BASENAME=$(basename "$note" .md)
    PROJECT=$(grep '^project:' "$note" | head -1 | sed 's/^project: //')
    echo "  LOW LINKS ($LINKS): [$PROJECT] $BASENAME"
    LOW_LINK_COUNT=$((LOW_LINK_COUNT + 1))
  fi
done

if [ "$TOTAL_NOTES" -gt 0 ]; then
  echo ""
  echo "Total notes: $TOTAL_NOTES"
  echo "Total links: $TOTAL_LINKS"
  echo "Average links/note: $(echo "scale=1; $TOTAL_LINKS / $TOTAL_NOTES" | bc 2>/dev/null || echo "N/A")"
  echo "Notes with <2 links: $LOW_LINK_COUNT"
  echo ""
  echo "Target: >=3 links per note average"
  [ "$LOW_LINK_COUNT" -gt 0 ] && echo "Run /connect on low-link notes to improve density"
else
  echo "No notes yet."
fi
