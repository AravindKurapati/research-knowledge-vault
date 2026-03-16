#!/usr/bin/env bash
# validate-schema.sh — Check all notes in notes/ against required schema fields
# Usage: bash ops/scripts/validate-schema.sh

VAULT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
NOTES="$VAULT_ROOT/notes"

echo "=== Schema Validation ==="
echo ""

VIOLATION_COUNT=0
TOTAL_COUNT=0

for note in "$NOTES"/*.md; do
  [ -f "$note" ] || continue
  BASENAME=$(basename "$note")

  # Skip topic maps (they have minimal schema)
  TYPE=$(grep '^type:' "$note" | head -1 | sed 's/^type: //')
  if [ "$TYPE" = "moc" ]; then
    continue
  fi

  TOTAL_COUNT=$((TOTAL_COUNT + 1))
  VIOLATIONS=""

  # Check required fields
  grep -q '^description:' "$note" || VIOLATIONS="$VIOLATIONS description"
  grep -q '^type:' "$note" || VIOLATIONS="$VIOLATIONS type"
  grep -q '^project:' "$note" || VIOLATIONS="$VIOLATIONS project"
  grep -q '^created:' "$note" || VIOLATIONS="$VIOLATIONS created"

  # Check description is non-empty
  DESC=$(grep '^description:' "$note" | head -1 | sed 's/^description: *//')
  if [ -z "$DESC" ] || [ "$DESC" = '""' ]; then
    VIOLATIONS="$VIOLATIONS description(empty)"
  fi

  # Check Topics footer
  grep -q '^Topics:' "$note" || VIOLATIONS="$VIOLATIONS Topics-footer"

  if [ -n "$VIOLATIONS" ]; then
    echo "  FAIL: $BASENAME"
    echo "  Missing:$VIOLATIONS"
    echo ""
    VIOLATION_COUNT=$((VIOLATION_COUNT + 1))
  fi
done

PASS_COUNT=$((TOTAL_COUNT - VIOLATION_COUNT))
echo "Result: $PASS_COUNT/$TOTAL_COUNT notes pass schema validation"

if [ "$VIOLATION_COUNT" -gt 0 ]; then
  echo "$VIOLATION_COUNT violation(s) found — run /validate for guided remediation"
fi
