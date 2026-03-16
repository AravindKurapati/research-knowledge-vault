#!/usr/bin/env bash
# validate-note.sh — Runs after Write tool use. Validates new/modified markdown notes.
# Only validates files in notes/, inbox/, ops/observations/, ops/tensions/.
# Outputs warnings — does NOT block writes.

VAULT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

if [ ! -f "$VAULT_ROOT/.arscontexta" ]; then
  exit 0
fi

# Get the file that was just written (passed via CLAUDE_TOOL_INPUT env var or stdout parsing)
# Claude Code sets the file path in the hook environment
WRITTEN_FILE="${CLAUDE_TOOL_INPUT_FILE_PATH:-}"

# If no file path from environment, try to find the most recently modified .md file
if [ -z "$WRITTEN_FILE" ]; then
  WRITTEN_FILE=$(find "$VAULT_ROOT/notes" "$VAULT_ROOT/inbox" "$VAULT_ROOT/ops/observations" "$VAULT_ROOT/ops/tensions" -name "*.md" -newer "$VAULT_ROOT/.arscontexta" 2>/dev/null | head -1)
fi

if [ -z "$WRITTEN_FILE" ] || [ ! -f "$WRITTEN_FILE" ]; then
  exit 0
fi

# Only validate markdown files in the knowledge directories
case "$WRITTEN_FILE" in
  *notes/*.md|*inbox/*.md|*ops/observations/*.md|*ops/tensions/*.md)
    ;;
  *)
    exit 0
    ;;
esac

WARNINGS=0
FILE_BASENAME=$(basename "$WRITTEN_FILE")

# Check 1: YAML frontmatter exists
if ! head -1 "$WRITTEN_FILE" | grep -q '^---'; then
  echo "VALIDATE WARNING [$FILE_BASENAME]: Missing YAML frontmatter"
  WARNINGS=$((WARNINGS + 1))
fi

# Check 2: description field present
if ! grep -q '^description:' "$WRITTEN_FILE"; then
  echo "VALIDATE WARNING [$FILE_BASENAME]: Missing 'description:' field"
  WARNINGS=$((WARNINGS + 1))
fi

# Check 3: description is not empty
DESC=$(grep '^description:' "$WRITTEN_FILE" | head -1 | sed 's/^description: *//')
if [ -z "$DESC" ] || [ "$DESC" = '""' ] || [ "$DESC" = "''" ]; then
  echo "VALIDATE WARNING [$FILE_BASENAME]: description field is empty"
  WARNINGS=$((WARNINGS + 1))
fi

# Check 4: Topics footer present (for notes/ files)
case "$WRITTEN_FILE" in
  *notes/*.md)
    if ! grep -q '^Topics:' "$WRITTEN_FILE"; then
      echo "VALIDATE WARNING [$FILE_BASENAME]: Missing Topics: footer"
      WARNINGS=$((WARNINGS + 1))
    fi
    ;;
esac

# Check 5: type field present (for notes/ files)
case "$WRITTEN_FILE" in
  *notes/*.md)
    if ! grep -q '^type:' "$WRITTEN_FILE"; then
      echo "VALIDATE WARNING [$FILE_BASENAME]: Missing 'type:' field"
      WARNINGS=$((WARNINGS + 1))
    fi
    ;;
esac

if [ "$WARNINGS" -gt 0 ]; then
  echo "VALIDATE: $WARNINGS warning(s) in $FILE_BASENAME — review before /verify"
fi

exit 0
