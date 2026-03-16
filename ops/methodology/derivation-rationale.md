---
description: Why each configuration dimension was chosen for the NYU ML/AI research knowledge system
category: derivation-rationale
created: 2026-03-16
status: active
---

# derivation rationale for NYU ML/AI research vault

## System Context

This vault was configured for a NYU graduate student running three active ML/AI research projects: Follicular Lymphoma subtype prediction from whole slide images (Barlow Twins SSL + Gated Attention MIL), TCGA Lung Cancer Classification (LUAD vs LUSC, InceptionV3 on SSL embeddings), and AlphaFold structure-based ML with GNNs. The user tracks both literature (claims from papers) and experimental work (metrics, hyperparameters, decisions), and explicitly requested proactive cross-project connection surfacing.

## Dimension Choices

**Granularity: Atomic**
Signal: "track claims across disciplines" + explicit distinction between literature notes and experiment records. The user works across three projects with a cross-cutting theme layer — atomic notes are the only granularity that enables clean cross-project composability. A note about Barlow Twins performance on histology needs to link cleanly to notes about SSL pretraining in TCGA without dragging FL-specific context along.

**Organization: Flat**
Research preset default. With three projects and five cross-cutting themes, hierarchical folders would either over-segment (one folder per project, themes invisible) or under-segment (flat projects folder, navigation by filename). Flat organization + topic maps provides flexible navigation without commitment to a single hierarchy.

**Linking: Explicit + Implicit**
Signal: "automatically link to related decisions" + "surface connections proactively" + concrete vocabulary divergence across domains (SSL means different things in MIL vs. transformers). Explicit links are created during /extract and /connect; implicit links are discovered via semantic search for cross-disciplinary vocabulary mismatches.

**Processing: Heavy**
Signal: "both literature and experiments" + explicit field requirements for experiments (metrics, hyperparameters) + two distinct note types with different schema. Heavy processing is required when source material must be transformed into structured, typed, field-validated notes.

**Navigation: 3-tier**
Three projects + five cross-cutting themes produces eight topic maps that would overwhelm a 2-tier structure. 3-tier navigation (hub → project/theme maps → atomic notes) provides access paths from any direction.

**Maintenance: Condition-based (tight thresholds)**
Heavy processing generates targets fast; cross-project system needs tight orphan/link checks. Inbox pressure threshold of 3 days prevents Collector's Fallacy. Observation threshold of 10 prevents drift from accumulating unreviewed.

**Schema: Dense**
Signal: explicit field requirements in user description — `source`, `confidence`, `methodology` for claims; `dataset`, `metrics`, `hyperparameters`, `status`, `decisions` for experiments. These fields enable structural queries that differentiate this system from a collection of text files.

**Automation: Full**
Platform is Claude Code with hooks support. User explicitly requested "agent to remember domain context across sessions" and "automatically link." Full automation is the appropriate default for a Claude Code system with explicit automation expectations.

## Feature Block Decisions

**Semantic search: ON** — User explicitly opted in. Cross-disciplinary vocabulary divergence is concrete and consequential: "attention mechanism" in MIL (Gated Attention MIL) and "self-attention" in transformers are structurally similar concepts with incompatible surface vocabulary. Semantic search is essential, not optional.

**Multi-domain: ON** — Three detected projects (follicular-lymphoma, tcga-lung, alphafold) with five cross-cutting themes. Multi-domain architecture activated with proactive cross-project surfacing as a non-optional requirement.

**Self-space: ON** — User explicitly stated "agent to remember domain context across sessions so I don't re-explain things every time." This is the definition of self-space.

**Atomic notes: ON** — Granularity = atomic.
**MOCs: ON** — Navigation = 3-tier.
**Processing pipeline: ON** — Heavy processing level.
**Ethical guardrails: ON** — Always.

## Coherence Validation Summary

Three hard constraints checked — all passed:
- atomic + 2-tier nav + volume > 100: PASS (3-tier nav selected)
- full automation + no platform hooks: PASS (Claude Code supports hooks)
- heavy processing + manual automation: PASS (full automation)

Seven soft constraints checked — all passed or resolved:
- linking explicit+implicit + no semantic search: RESOLVED (user opted in)
- dense schema + convention automation: PASS (full automation handles)
- All other soft constraints: PASS

Compensating mechanism: qmd semantic search compensates for cross-disciplinary vocabulary divergence that would otherwise cause keyword search to miss structural connections.

## Risk Assessment

Top failure modes for this configuration (research domain, three projects):
1. **Collector's Fallacy** — papers pile up in inbox/ faster than processed; three projects magnify this
2. **Verbatim Risk** — extracting paper summaries instead of claims; every note must transform
3. **Orphan Drift** — high creation volume across three projects without mandatory connection
4. **Productivity Porn** — configuring the system instead of doing research; vault serves research, not reverse

---

Topics:
- [[methodology]]
