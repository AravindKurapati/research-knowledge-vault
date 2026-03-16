#!/usr/bin/env bash
# class-imbalance-audit.sh — All class imbalance strategies and where they are applied
# Usage: bash ops/queries/class-imbalance-audit.sh

VAULT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
NOTES="$VAULT_ROOT/notes"

echo "=== Class Imbalance Strategy Audit ==="
echo ""

echo "-- Explicit class-imbalance-strategy notes --"
rg '^type: class-imbalance-strategy' "$NOTES" -l --glob '*.md' | while read -r f; do
  TITLE=$(head -5 "$f" | grep -v '^---' | grep -v '^type:' | grep -v '^description:' | grep -v '^project:' | grep -v '^$' | head -1 | sed 's/^# //')
  DESC=$(grep '^description:' "$f" | head -1 | sed 's/^description: //')
  PROJECT=$(grep '^project:' "$f" | head -1 | sed 's/^project: //')
  echo "  [$PROJECT] $TITLE"
  echo "  $DESC"
  echo ""
done

echo ""
echo "-- Notes mentioning imbalance strategies --"
rg -i 'class.imbal|oversampl|undersampl|focal.loss|class.weight|stratif' "$NOTES" --glob '*.md' -l | while read -r f; do
  BASENAME=$(basename "$f" .md)
  PROJECT=$(grep '^project:' "$f" | head -1 | sed 's/^project: //')
  echo "  [$PROJECT] $BASENAME"
done
