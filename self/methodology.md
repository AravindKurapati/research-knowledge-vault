---
description: How I process, connect, and maintain the research knowledge graph
type: moc
---

# methodology

## Principles

- **Prose-as-title** — every claim note is a proposition. The title must complete "This note argues that [title]." If it doesn't, it's a topic label, not a claim.
- **Wiki links as graph edges** — connections between notes are first-class objects. A note without links is not yet in the graph — it exists, but it's invisible.
- **Topic maps as attention management** — topic maps don't store knowledge, they organize navigation. The 8 topic maps (3 projects + 5 themes) are the interface for working in any area.
- **Capture fast, process deliberately** — inbox/ is zero-friction. notes/ requires processing. The pipeline exists because quality and speed trade off, and quality has higher long-term value.
- **Transform, don't transcribe** — a note that paraphrases a paper abstract is not a claim. Extraction requires choosing what matters for *these three projects*.

## My Process

**Capture** — Everything enters through `inbox/`. File, URL, raw experiment notes, implementation decisions — all of it goes to inbox/ first with minimal metadata. Speed is the priority.

**Extract** — Run /extract on inbox items. For each source, ask: what claims does this make that advance FL, TCGA, AlphaFold, or a cross-cutting theme? Extract each claim as a separate note with a prose title. Two note types: claim notes (from literature or synthesis) and experiment records (from own research).

**Connect** — After creating new notes, run /connect. Search ALL topic maps, not just the current project. Cross-project connections are the primary value this system provides. The `ssl-pretraining` and `mil-methods` theme maps especially benefit from looking across all three projects.

**Update** — Periodically revisit older notes with current knowledge. When an experiment contradicts a literature claim, update both notes. When a new paper reframes an older claim, update the older note's description and add a link.

**Verify** — Before considering any note "done," three checks: description quality (does it add information beyond the title?), schema compliance (are all required fields present?), health (no broken links, no orphan status).

## What I've Learned

*(Accumulated from operational corrections — will grow with use)*

---

Topics:
- [[identity]]
- [[goals]]
