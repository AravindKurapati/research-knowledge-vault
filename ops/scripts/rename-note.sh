#!/usr/bin/env bash
# rename-note.sh — Safely rename a note and update all wiki links
# Usage: bash ops/scripts/rename-note.sh "old note title" "new note title"
# NEVER rename notes manually — always use this script

VAULT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
OLD_NAME="$1"
NEW_NAME="$2"

if [ -z "$OLD_NAME" ] || [ -z "$NEW_NAME" ]; then
  echo "Usage: bash ops/scripts/rename-note.sh 'old title' 'new title'"
  exit 1
fi

OLD_FILE="$VAULT_ROOT/notes/${OLD_NAME}.md"

if [ ! -f "$OLD_FILE" ]; then
  echo "ERROR: Note not found: $OLD_FILE"
  exit 1
fi

NEW_FILE="$VAULT_ROOT/notes/${NEW_NAME}.md"

if [ -f "$NEW_FILE" ]; then
  echo "ERROR: Target already exists: $NEW_FILE"
  exit 1
fi

echo "Renaming: $OLD_NAME → $NEW_NAME"

# Git mv to rename
cd "$VAULT_ROOT" || exit 1
git mv "notes/${OLD_NAME}.md" "notes/${NEW_NAME}.md" 2>/dev/null || \
  mv "$OLD_FILE" "$NEW_FILE"

# Update all wiki links
LINK_COUNT=$(rg "\[\[$OLD_NAME\]\]" "$VAULT_ROOT" --glob '*.md' -l 2>/dev/null | wc -l | tr -d ' ')
echo "Updating $LINK_COUNT file(s) with wiki links..."

rg "\[\[$OLD_NAME\]\]" "$VAULT_ROOT" --glob '*.md' -l 2>/dev/null | while read -r f; do
  sed -i "s/\[\[$OLD_NAME\]\]/[[$NEW_NAME]]/g" "$f"
  echo "  Updated: $f"
done

echo "Done. Commit with: git commit -m 'rename: $OLD_NAME → $NEW_NAME'"
