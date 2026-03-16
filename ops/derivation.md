---
description: How this knowledge system was derived — enables architect and reseed commands
created: 2026-03-16
engine_version: "0.8.0"
---

# System Derivation

## Configuration Dimensions

| Dimension | Position | Conversation Signal | Confidence |
|-----------|----------|--------------------|--------------------|
| Granularity | Atomic | "track claims across disciplines" + explicit distinction between lit notes and experiment records | High |
| Organization | Flat | Research preset default + multi-domain requires flat for cross-project linking | Inferred |
| Linking | Explicit+Implicit | "automatically link to related decisions" + "surface connections proactively" + cross-disciplinary vocab divergence (SSL in MIL vs transformers) | High |
| Processing | Heavy | "both literature and experiments" + explicit field requirements for experiments (metrics, hyperparameters) + output-directed research | High |
| Navigation | 3-tier | Three projects + five cross-cutting themes → hub → project/theme maps → atomic notes | High |
| Maintenance | Condition-based (tight thresholds) | Heavy processing generates targets fast; cross-project system needs tight orphan/link checks | Inferred |
| Schema | Dense | Explicit field requirements: source, confidence, methodology for lit; dataset, metrics, hyperparameters, status for experiments | High |
| Automation | Full | Claude Code platform + "automatically link" + "proactively surface" | High |

## Personality Dimensions

| Dimension | Position | Signal |
|-----------|----------|--------|
| Warmth | Clinical | Academic research register, technical domain — no warmth signals |
| Opinionatedness | Neutral | Research context: conclusions should be the user's |
| Formality | Formal | Technical vocabulary, professional context, complete sentences |
| Emotional Awareness | Task-focused | Intellectual domain — decisions and experiments, not emotional content |

## Vocabulary Mapping

| Universal Term | Domain Term | Category |
|---------------|-------------|----------|
| notes | notes | folder |
| inbox | inbox | folder |
| archive | archive | folder |
| note (type, lit) | claim | note type |
| note (type, exp) | experiment record | note type |
| reduce | extract | process phase |
| reflect | connect | process phase |
| reweave | update | process phase |
| verify | verify | process phase |
| validate | validate | process phase |
| rethink | reassess | process phase |
| MOC | topic map | navigation |
| description | description | schema field |
| topics | research areas | schema field |
| relevant_notes | relevant notes | schema field |
| orient | orient | session phase |
| persist | persist | session phase |

## Platform

- Tier: Claude Code
- Automation: full (hooks + skills + pipeline from day one)
- Skills location: .claude/skills/
- Hooks location: .claude/hooks/

## Active Feature Blocks

- [x] atomic-notes — granularity = atomic
- [x] wiki-links — always (kernel invariant)
- [x] mocs — navigation = 3-tier
- [x] processing-pipeline — always (full automation)
- [x] semantic-search — opted in (cross-disciplinary vocabulary divergence)
- [x] schema — always (kernel invariant)
- [x] maintenance — always
- [x] self-evolution — always
- [x] methodology-knowledge — always
- [x] session-rhythm — always
- [x] templates — always
- [x] multi-domain — three projects detected (FL, TCGA, AlphaFold)
- [x] ethical-guardrails — always
- [x] self-space — user explicitly requested persistent domain context across sessions
- [x] helper-functions — always
- [x] graph-analysis — always
- [ ] personality — no signals detected, neutral-helpful default

## Coherence Validation Results

- Hard constraints checked: 3. Violations: none
  - atomic + 2-tier nav + volume > 100: PASS (3-tier nav selected)
  - full automation + no platform hooks: PASS (Claude Code supports hooks)
  - heavy processing + manual automation: PASS (full automation)
- Soft constraints checked: 7. Auto-adjusted: 0. User-confirmed: 0
  - linking explicit+implicit + no semantic search: PASS (semantic search opted in)
  - dense schema + convention automation: PASS (full automation)
  - atomic + light processing: NOT violated (heavy processing)
  - flat + 2-tier + volume > 50: NOT violated (3-tier)
- Compensating mechanisms active: qmd semantic search compensates for cross-disciplinary vocabulary divergence

## Failure Mode Risks (Research domain — top 4)

1. **Collector's Fallacy** (HIGH) — papers pile up in inbox/ faster than processed; three projects magnify this
2. **Verbatim Risk** (HIGH) — extracting paper summaries instead of claims; every note must transform
3. **Orphan Drift** (HIGH) — high creation volume across three projects without mandatory connection
4. **Productivity Porn** (HIGH) — configuring the system instead of doing research; vault serves research, not reverse

## Generation Parameters

- Vault root: D:/Aru/NYU/vault/
- Claim note template: templates/claim-note.md
- Experiment note template: templates/experiment-note.md
- Topic map template: templates/topic-map.md
- Observation note template: templates/observation-note.md
- Project topic maps: follicular-lymphoma, tcga-lung, alphafold
- Theme topic maps: ssl-pretraining, mil-methods, class-imbalance, evaluation-metrics, model-selection
- Skills: extract, connect, update, verify, validate, seed, orchestrate, pipeline, next, stats, graph, learn, remember, reassess, refactor, tasks
- Hooks: session-orient.sh, session-capture.sh, validate-note.sh, auto-commit.sh

## Extraction Categories (domain-specific)

1. **methodology-claims** — ML/DL architecture decisions and their empirical backing (e.g., why Barlow Twins over SimCLR for this dataset)
2. **experimental-findings** — empirical results: accuracy, AUC, TTFT, ablation outcomes across FL/TCGA/AlphaFold
3. **implementation-patterns** — code and infrastructure patterns for GPU training, SLURM jobs, Kaggle notebooks, HPC
4. **cross-domain-insights** — structural connections across all three projects (e.g., SSL pretraining applies to both FL and TCGA)
5. **class-imbalance-strategies** — techniques for handling imbalanced medical datasets
6. **evaluation-methods** — metrics for imbalanced data, MIL evaluation, clinical utility of predictions
7. **open-questions** — unresolved research directions, gaps, contradictions to investigate
