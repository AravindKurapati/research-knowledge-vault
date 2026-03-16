---
description: The processing pipeline, maintenance cycle, and session rhythm for the research knowledge system
type: manual
generated_from: "arscontexta-0.8.0"
---

# Workflows

## The Processing Pipeline

Every piece of content follows: **capture → /extract → /connect → /update → /verify**

### Step 1: Capture to inbox/

Zero friction. Drop anything into `inbox/`: papers, URLs, raw experiment notes, meeting notes, implementation decisions. Minimal frontmatter:

```yaml
---
source_type: research | web-search | manual | import
generated: YYYY-MM-DD
---
```

Never write directly to `notes/`. The pipeline exists because quality and speed trade off.

### Step 2: /extract

Transform source material into atomic claims. Each claim becomes one file in `notes/` with a prose title stating the claim.

```
/extract inbox/paper-on-barlow-twins.md
/extract inbox/fl-experiment-run-12.md
```

For papers: extract methodology claims, experimental findings, implementation patterns, cross-domain insights.
For experiments: create experiment records with `dataset`, `metrics`, `hyperparameters`, `status`.

**Quality gate:** Every extracted note must pass "This note argues that [title]." If the title is a topic label, not a claim, it needs to be sharpened before saving.

### Step 3: /connect

Find connections to the existing graph. Run after every extraction session.

```
/connect
/connect "barlow-twins-outperforms-simclr-small-batch-histology"
```

/connect searches ALL topic maps — not just the current project. Cross-project connections (e.g., SSL pretraining in FL connects to tcga-lung) are the primary value of the system.

**Quality gate:** Every new note must appear in at least one topic map with a context phrase ("what it contributes"), not just a bare link.

### Step 4: /update

Backward pass — revisit older notes that should reference new ones.

```
/update "old-note-about-ssl-pretraining"
```

When an experiment contradicts a literature claim, update both notes. When a new paper reframes an older claim, update the older note's description and links.

### Step 5: /verify

Three checks before a note is considered complete.

```
/verify "note-title"
```

1. **Description quality** — cold-read test: does description add information beyond the title?
2. **Schema compliance** — are all required fields present and non-empty?
3. **Health** — no broken wiki links, Topics footer present, at least one topic map links to this note

### Full-Source Pipeline (/seed)

For complete processing of one source from capture to verify:

```
/seed inbox/my-paper.md
```

/seed runs all five phases sequentially, pausing for review at extraction.

### Batch Pipeline (/pipeline)

For processing multiple sources from queue:

```
/pipeline
```

Reads `ops/queue/` for pending tasks and processes them in order.

---

## The Session Rhythm

Every session: **Orient → Work → Persist**

### Orient (2-3 minutes)

1. Read session-orient.sh output (auto-runs at session start)
2. Read `self/goals.md` — active threads, last handoff
3. Check `ops/reminders.md` — due items
4. Check `inbox/` count — processing pressure

### Work (focused)

One task per session. Context-switching mid-task degrades quality on both tasks.

- Drop discovery in `inbox/` and return to current task if interrupted
- Reserve ~60% of context for actual work

### Persist (before closing)

1. Update `self/goals.md` with session handoff
2. Commit changes (`git add -A && git commit -m "..."`) — auto-commit hook handles this automatically
3. Log observations if friction occurred (`/remember`)

---

## The Maintenance Cycle

Condition-based, not calendar-based. Actions trigger when thresholds are crossed.

| Condition | Threshold | What to Do |
|-----------|-----------|------------|
| Orphan notes | Any detected | Run /connect on the orphaned note |
| Dangling links | Any detected | Fix broken wiki link or remove reference |
| Inbox age | >3 days | Run /extract on old items |
| Observations | >=10 pending | Run /reassess |
| Tensions | >=5 pending | Run /reassess |
| Topic map size | >40 notes | Consider splitting the topic map |

Check conditions with `/next` — it surfaces maintenance tasks automatically.

---

## Chaining Skills

Skills can chain automatically based on `ops/config.yaml`:

- `manual` — Each skill outputs "Next: /[skill] [target]" — you decide whether to continue
- `suggested` — Skills add the next step to the task queue — you can skip
- `automatic` — Skills complete → next phase runs immediately

Default is `suggested`. Change in `ops/config.yaml` under `processing.chaining`.

See [[skills]] for individual command documentation.
See [[configuration]] for adjusting pipeline settings.
