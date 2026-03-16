#!/usr/bin/env bash
# stale-experiments.sh — Experiment records not updated in 30+ days with non-final status
# Usage: bash ops/queries/stale-experiments.sh

VAULT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
NOTES="$VAULT_ROOT/notes"

echo "=== Stale Experiment Records (30+ days, non-final status) ==="
echo ""

find "$NOTES" -name "*.md" -mtime +30 2>/dev/null | while read -r f; do
  TYPE=$(grep '^type:' "$f" | head -1 | sed 's/^type: //')
  STATUS=$(grep '^status:' "$f" | head -1 | sed 's/^status: //')

  # Only show experiment records with non-final status
  if [ "$TYPE" = "experiment" ] && [ "$STATUS" != "completed" ] && [ "$STATUS" != "superseded" ] && [ "$STATUS" != "failed" ]; then
    TITLE=$(grep '^# ' "$f" | head -1 | sed 's/^# //')
    PROJECT=$(grep '^project:' "$f" | head -1 | sed 's/^project: //')
    MODIFIED=$(stat -f '%Sm' -t '%Y-%m-%d' "$f" 2>/dev/null || stat -c '%y' "$f" 2>/dev/null | cut -d' ' -f1)
    echo "  [$PROJECT] $TITLE"
    echo "  status: $STATUS | last modified: $MODIFIED"
    echo ""
  fi
done

echo ""
echo "Run /update on stale experiments to bring them up to date."
