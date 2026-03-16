#!/usr/bin/env bash
# dangling-links.sh — Find wiki links that point to non-existent files
# Usage: bash ops/scripts/dangling-links.sh

VAULT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

echo "=== Dangling Wiki Links ==="
echo ""

DANGLING_COUNT=0

# Find all wiki links across all markdown files
rg '\[\[([^\]]+)\]\]' "$VAULT_ROOT" --glob '*.md' -o --no-filename 2>/dev/null | \
  sed 's/\[\[//g; s/\]\]//g; s/ *|.*//g' | \
  sort -u | \
  while read -r link; do
    # Check if any file with this name (as basename) exists
    FOUND=$(find "$VAULT_ROOT" -name "${link}.md" 2>/dev/null | head -1)
    if [ -z "$FOUND" ]; then
      # Find files that contain this link
      SOURCES=$(rg "\[\[$link\]\]" "$VAULT_ROOT" --glob '*.md' -l 2>/dev/null | head -3)
      echo "  DANGLING: [[$link]]"
      echo "  Referenced in: $SOURCES"
      echo ""
    fi
  done

echo "Fix: update dangling links or create the missing note"
echo "When renaming notes, always use: bash ops/scripts/rename-note.sh 'old' 'new'"
