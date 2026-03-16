---
description: Common issues and resolution patterns for the research knowledge system
type: manual
generated_from: "arscontexta-0.8.0"
---

# Troubleshooting

## Orphan Claims

**Symptom:** Notes in `notes/` with no incoming links — they exist but are invisible to navigation.

**Detection:**
```bash
bash ops/scripts/orphan-notes.sh
```

**Fix:** Run `/connect` on the orphaned note. Every note must appear in at least one topic map with a context phrase.

**Prevention:** Always run `/connect` after creating notes.

---

## Dangling Links

**Symptom:** Wiki links like `[[note-title]]` that point to files that don't exist. Breaks graph traversal.

**Detection:**
```bash
bash ops/scripts/dangling-links.sh
```

**Fix:** Either create the missing note, or update the link to point to the correct existing note. After renaming notes, always use `ops/scripts/rename-note.sh` — never rename manually.

---

## Stale Claims

**Symptom:** Notes in `notes/` with sparse connections and no updates in 30+ days.

**Detection:**
```bash
bash ops/queries/stale-experiments.sh
```

**Fix:** Run `/update` on the stale note. If the note has been superseded, update its `status: superseded` field and link to the replacement.

---

## Inbox Overflow

**Symptom:** Items in `inbox/` older than 3 days. Collector's Fallacy risk.

**Detection:** `session-orient.sh` reports this at session start.

**Fix:** Run `/extract` or `/pipeline` to process pending items. WIP limit: process what you have before adding more. If inbox is genuinely overwhelming, run `/next` for a prioritized processing plan.

---

## Methodology Drift

**Symptom:** System behavior diverges from `ops/methodology/` specification. Claims being written with topic labels instead of prose assertions, notes going directly to `notes/` skipping the pipeline.

**Detection:**
```bash
/reassess drift
rg '^description: ""' notes/  # empty descriptions
rg -L '^project:' notes/*.md  # notes missing project field
```

**Fix:** Run `/reassess` to diagnose drift pattern and propose corrections. Update `ops/methodology/` via `/remember` when corrections reveal general principles.

---

## Schema Violations

**Symptom:** Notes missing required fields (`description`, `type`, `project`).

**Detection:**
```bash
/validate
bash ops/scripts/validate-schema.sh
```

**Fix:** Open the note and add the missing fields. Check the relevant template (`templates/claim-note.md` or `templates/experiment-note.md`) for the required field list.

---

## Semantic Search Not Finding Connections

**Symptom:** `/connect` or `/learn` misses obvious connections between cross-project notes.

**Causes:**
1. qmd index is stale — run `qmd update && qmd embed` from vault root
2. qmd not installed — see setup instructions below
3. Cross-disciplinary vocabulary mismatch — this is expected; check manually

**qmd setup (if not yet installed):**
```bash
npm install -g @tobilu/qmd
# or: bun install -g @tobilu/qmd

cd D:/Aru/NYU/vault
qmd init
qmd collection add . --name "research-notes" --mask "**/*.md"
qmd update && qmd embed
```

Add to `.mcp.json` in vault root:
```json
{
  "mcpServers": {
    "qmd": {
      "command": "qmd",
      "args": ["mcp"],
      "autoapprove": ["mcp__qmd__search","mcp__qmd__vector_search","mcp__qmd__deep_search","mcp__qmd__get","mcp__qmd__multi_get","mcp__qmd__status"]
    }
  }
}
```

---

## Skills Not Available

**Symptom:** `/extract`, `/connect`, etc. show as unknown commands.

**Fix:** Skills were generated but require Claude Code restart to activate. Quit and restart Claude Code. Skills appear in the skills index after restart.

---

## Common Mistakes

| Mistake | Correction |
|---------|-----------|
| Writing directly to notes/ | Route through inbox/ → /extract |
| Title is a topic label ("SSL pretraining") | Rewrite as claim ("barlow twins outperforms simclr for small-batch histology") |
| Description restates the title | Rewrite to add mechanism, scope, or implication |
| Not running /connect after extraction | Always run /connect — cross-project connections won't form automatically without it |
| Orphan note in notes/ | Add to at least one topic map with context phrase |

See [[meta-skills]] for /reassess and /remember.
See [[configuration]] for threshold adjustments.
