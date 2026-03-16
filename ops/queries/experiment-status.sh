#!/usr/bin/env bash
# experiment-status.sh — Running and planned experiments per project
# Usage: bash ops/queries/experiment-status.sh [project]
# Example: bash ops/queries/experiment-status.sh follicular-lymphoma

VAULT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
NOTES="$VAULT_ROOT/notes"
FILTER="${1:-}"

echo "=== Experiment Status ==="
echo ""

for status in running planned completed failed superseded; do
  if [ -n "$FILTER" ]; then
    MATCHES=$(rg "^status: $status" "$NOTES" --glob '*.md' -l 2>/dev/null | xargs -I{} sh -c "grep -l '^project: $FILTER' {} 2>/dev/null" 2>/dev/null)
  else
    MATCHES=$(rg "^status: $status" "$NOTES" --glob '*.md' -l 2>/dev/null)
  fi

  if [ -n "$MATCHES" ]; then
    echo "-- $status --"
    echo "$MATCHES" | while read -r f; do
      [ -f "$f" ] || continue
      TITLE=$(grep '^# ' "$f" | head -1 | sed 's/^# //')
      PROJECT=$(grep '^project:' "$f" | head -1 | sed 's/^project: //')
      METRICS=$(grep '^metrics:' "$f" | head -1 | sed 's/^metrics: //')
      echo "  [$PROJECT] $TITLE"
      [ -n "$METRICS" ] && echo "  metrics: $METRICS"
      echo ""
    done
  fi
done
