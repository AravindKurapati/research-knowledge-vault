---
description: First session guide — creating your first claim, connecting to a topic map, and building the graph
type: manual
generated_from: "arscontexta-0.8.0"
---

# Getting Started

## Your First Session

At session start, Claude Code runs `session-orient.sh` which shows vault state: inbox pressure, note count, pending observations, due reminders. Read the output — it tells you what needs attention.

Then orient manually: read `self/goals.md` to see active research threads and the last session's handoff. This takes 2-3 minutes and is worth it every session.

## Creating Your First Claim

Every claim starts in `inbox/`. Don't write directly to `notes/` — the pipeline ensures quality.

**Step 1: Capture to inbox**

Drop anything into `inbox/`: a paper PDF or URL, your own notes from a lab meeting, an experiment result. Add minimal metadata:

```yaml
---
source_type: manual
generated: 2026-03-16
---
# Notes from [paper / meeting / experiment]
[raw content]
```

**Step 2: Run /extract**

```
/extract inbox/my-source.md
```

/extract reads the source and produces atomic claim notes in `notes/`. For a paper about Barlow Twins on histology, it might produce:
- `barlow-twins-outperforms-simclr-small-batch-histology.md`
- `patch-augmentation-strategy-matters-ssl-pretraining-medical-images.md`

Each note has a prose title that states the claim, plus YAML frontmatter with `description`, `type`, `project`, `confidence`, `source`, `created`.

**Step 3: Run /connect**

```
/connect
```

/connect searches the graph for connections to your new notes. It looks across ALL topic maps — not just the current project. A new claim about SSL pretraining in FL will connect to the `ssl-pretraining` theme map and potentially to `tcga-lung` if relevant.

## How Connections Work

Wiki links (`[[note title]]`) are the edges of your knowledge graph. Every note appears in the Research Areas footer of other notes that connect to it, and in at least one topic map.

The 8 topic maps (3 project + 5 theme) are the navigation layer. Browse `notes/follicular-lymphoma.md` to see all FL-relevant knowledge, or `notes/ssl-pretraining.md` to see cross-project SSL patterns.

## The Session Rhythm

Every session: **Orient → Work → Persist**

- **Orient** (2-3 min): read session-orient output, check self/goals.md
- **Work** (focused): one task, full attention
- **Persist** (before closing): update self/goals.md, commit changes, leave handoff note

## Where to Go Next

- [[workflows]] — the full processing pipeline step by step
- [[skills]] — every available command
- Try `/arscontexta:tutorial` for an interactive guided walkthrough
