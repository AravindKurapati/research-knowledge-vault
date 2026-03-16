#!/usr/bin/env bash
# session-capture.sh — Runs at Stop. Archives session state.
# Only runs if .arscontexta marker exists.

VAULT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

if [ ! -f "$VAULT_ROOT/.arscontexta" ]; then
  exit 0
fi

SESSION_DIR="$VAULT_ROOT/ops/sessions"
CURRENT_SESSION="$SESSION_DIR/current.json"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

if [ ! -f "$CURRENT_SESSION" ]; then
  exit 0
fi

# Update last_activity timestamp
python3 - << 'PYEOF' 2>/dev/null
import json, sys, os
current = os.environ.get('VAULT_ROOT', '') + '/ops/sessions/current.json'
try:
    with open(current) as f:
        data = json.load(f)
    from datetime import datetime
    data['last_activity'] = datetime.utcnow().strftime('%Y%m%d-%H%M%S')
    data['end_time'] = data['last_activity']
    with open(current, 'w') as f:
        json.dump(data, f, indent=2)
except:
    pass
PYEOF

# Archive the session with a timestamp name
START_TIME=$(python3 -c "import json,sys; d=json.load(sys.stdin); print(d.get('start_time', 'unknown'))" < "$CURRENT_SESSION" 2>/dev/null || echo "$TIMESTAMP")
cp "$CURRENT_SESSION" "$SESSION_DIR/${START_TIME}.json" 2>/dev/null

echo "Session archived to ops/sessions/${START_TIME}.json"
