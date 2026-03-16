#!/usr/bin/env bash
# auto-commit.sh — Runs async after Write tool use. Commits vault changes.
# Only runs if .arscontexta has git: true (default).

VAULT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

if [ ! -f "$VAULT_ROOT/.arscontexta" ]; then
  exit 0
fi

# Check git config
GIT_ENABLED=$(grep 'git:' "$VAULT_ROOT/.arscontexta" | grep -v 'false' | wc -l | tr -d ' ')
if [ "$GIT_ENABLED" -eq 0 ] && grep -q 'git: false' "$VAULT_ROOT/.arscontexta"; then
  exit 0
fi

cd "$VAULT_ROOT" || exit 0

# Check if git repo
if [ ! -d ".git" ]; then
  exit 0
fi

# Stage all changes in vault
git add -A . 2>/dev/null

# Check if anything to commit
if git diff --cached --quiet 2>/dev/null; then
  exit 0
fi

# Generate a commit message from what changed
CHANGED=$(git diff --cached --name-only 2>/dev/null | head -5 | tr '\n' ', ' | sed 's/,$//')
NOTE_COUNT=$(git diff --cached --name-only 2>/dev/null | grep '^notes/' | wc -l | tr -d ' ')

if [ "$NOTE_COUNT" -gt 0 ]; then
  MSG="vault: add $NOTE_COUNT note(s) — $CHANGED"
else
  MSG="vault: update $CHANGED"
fi

git commit -m "$MSG" --quiet 2>/dev/null

exit 0
