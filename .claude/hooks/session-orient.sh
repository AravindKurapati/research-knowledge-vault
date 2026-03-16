#!/usr/bin/env bash
# session-orient.sh — Runs at SessionStart. Orients the agent to the current vault state.
# Only runs if .arscontexta marker exists (vault guard).

VAULT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

# Vault guard — only run if this is an Ars Contexta vault
if [ ! -f "$VAULT_ROOT/.arscontexta" ]; then
  exit 0
fi

SESSION_DIR="$VAULT_ROOT/ops/sessions"
CURRENT_SESSION="$SESSION_DIR/current.json"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
SESSION_ID="${CLAUDE_CONVERSATION_ID:-$TIMESTAMP}"

mkdir -p "$SESSION_DIR"

# Archive previous session if it exists
if [ -f "$CURRENT_SESSION" ]; then
  PREV_TIME=$(python3 -c "import json,sys; d=json.load(sys.stdin); print(d.get('start_time','unknown'))" < "$CURRENT_SESSION" 2>/dev/null || echo "unknown")
  cp "$CURRENT_SESSION" "$SESSION_DIR/${PREV_TIME:-$TIMESTAMP}-previous.json" 2>/dev/null
fi

# Initialize new session state
cat > "$CURRENT_SESSION" << EOF
{
  "session_id": "$SESSION_ID",
  "start_time": "$TIMESTAMP",
  "notes_created": [],
  "notes_modified": [],
  "discoveries": [],
  "last_activity": "$TIMESTAMP"
}
EOF

# Orientation output — shows vault state to agent
echo "=== Research Vault Orientation ==="
echo ""

# Inbox pressure
INBOX_COUNT=$(find "$VAULT_ROOT/inbox" -name "*.md" -not -name ".gitkeep" 2>/dev/null | wc -l | tr -d ' ')
if [ "$INBOX_COUNT" -gt 0 ]; then
  # Check for items older than 3 days
  OLD_INBOX=$(find "$VAULT_ROOT/inbox" -name "*.md" -not -name ".gitkeep" -mtime +3 2>/dev/null | wc -l | tr -d ' ')
  if [ "$OLD_INBOX" -gt 0 ]; then
    echo "INBOX PRESSURE: $OLD_INBOX item(s) older than 3 days — consider /extract"
  else
    echo "Inbox: $INBOX_COUNT item(s) pending"
  fi
else
  echo "Inbox: empty"
fi

# Orphan check
NOTES_COUNT=$(find "$VAULT_ROOT/notes" -name "*.md" -not -name "index.md" 2>/dev/null | wc -l | tr -d ' ')
echo "Notes: $NOTES_COUNT claims and experiment records"

# Observation pressure
OBS_COUNT=$(find "$VAULT_ROOT/ops/observations" -name "*.md" -not -name ".gitkeep" 2>/dev/null | wc -l | tr -d ' ')
if [ "$OBS_COUNT" -ge 10 ]; then
  echo "OBSERVATION THRESHOLD: $OBS_COUNT pending observations — run /reassess"
fi

# Tension pressure
TENSION_COUNT=$(find "$VAULT_ROOT/ops/tensions" -name "*.md" -not -name ".gitkeep" 2>/dev/null | wc -l | tr -d ' ')
if [ "$TENSION_COUNT" -ge 5 ]; then
  echo "TENSION THRESHOLD: $TENSION_COUNT pending tensions — run /reassess"
fi

# Reminders check
REMINDERS_FILE="$VAULT_ROOT/ops/reminders.md"
if [ -f "$REMINDERS_FILE" ]; then
  TODAY=$(date +%Y-%m-%d)
  DUE=$(grep -E "^\- \[ \] $TODAY" "$REMINDERS_FILE" 2>/dev/null | wc -l | tr -d ' ')
  OVERDUE=$(grep -E "^\- \[ \] 20[0-9]{2}-[0-9]{2}-[0-9]{2}" "$REMINDERS_FILE" 2>/dev/null | awk -F: '{print $1}' | grep -v "$TODAY" | head -5)
  if [ "$DUE" -gt 0 ]; then
    echo "REMINDERS DUE TODAY: $DUE item(s)"
  fi
fi

# Recent session summary
PREV_SESSION=$(ls -t "$SESSION_DIR"/*.json 2>/dev/null | grep -v current | head -1)
if [ -n "$PREV_SESSION" ]; then
  PREV_CREATED=$(python3 -c "import json,sys; d=json.load(sys.stdin); print(len(d.get('notes_created',[])))" < "$PREV_SESSION" 2>/dev/null || echo "?")
  echo ""
  echo "Last session: $PREV_CREATED note(s) created"
fi

echo ""
echo "Goals: self/goals.md"
echo "Queue: ops/queue/"
echo "================================="
