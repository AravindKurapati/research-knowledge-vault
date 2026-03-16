# Research Knowledge Vault

A living knowledge system for computational pathology and biomedical ML research.
Built with [arscontexta](https://github.com/agenticnotetaking/arscontexta) — a Claude Code
plugin that generates a persistent cognitive architecture from conversation.

## What this is

This is not a static notes folder. It is an active knowledge system that:

- Remembers research context across every Claude Code session automatically
- Extracts atomic claims from papers dropped into inbox/ and connects them across projects
- Surfaces cross-project connections as you work (e.g. class imbalance handling in FL linking to TCGA evaluation decisions)
- Maintains experiment records with structured fields: dataset, metrics, hyperparameters, decisions
- Enforces quality through automated hooks on every session start

## Research domains covered

**Follicular Lymphoma Subtype Prediction**
Predicting FL transcriptional subtypes from H&E whole slide images using Barlow Twins SSL
pretraining on ResNet-50, Leiden clustering for biological validation, and Gated Attention MIL
for slide-level classification. Goal: replace RNA-seq subtyping with routine pathology imaging.

**TCGA Lung Cancer Classification**
LUAD vs LUSC classification using InceptionV3 trained on Barlow Twins SSL embeddings from
whole slide images. Built on NYU HPC with multi-GPU SLURM jobs, extending the HPL framework
(Quiros et al., Nature Communications 2024).

**AlphaFold Protein Structure Prediction**
AlphaFold2 for downstream structure-based ML tasks, GNNs on predicted structures,
pLDDT score filtering for reliable downstream use.

## Cross-cutting themes

Five theme maps connect concepts across all three projects:

- SSL pretraining on medical images
- Multiple instance learning methods
- Class imbalance in medical datasets
- Evaluation metrics for imbalanced medical data
- Model selection tradeoffs

## Structure

```
vault/
  CLAUDE.md                   - complete research methodology, loaded every session
  notes/                      - claims from literature + experiment records (flat, wiki-linked)
  inbox/                      - papers queued for extraction, raw experiment notes
  archive/                    - processed papers and closed experiments
  self/
    identity.md               - agent identity and project summaries
    methodology.md            - how the agent operates
    goals.md                  - active research threads and open questions
  templates/
    claim-note.md             - schema for literature claims
    experiment-note.md        - schema for experiment records
    topic-map.md              - schema for MOCs
  ops/                        - pipeline configuration and session logs
  .claude/
    skills/                   - 16 domain-specific skills
    hooks/                    - session-orient, session-capture, validate-note, auto-commit
```

## Note types

**Claims** (from literature)
Fields: source, confidence, methodology, topics, relevant_notes

**Experiment records** (your own research)
Fields: project, dataset, metrics, hyperparameters, status, decisions, topics, relevant_notes

Both live flat in notes/ and link to each other via wikilinks. A paper claim about
class imbalance and your TCGA experiment handling class weights live in the same graph
and get connected automatically.

## Navigation

```
notes/index.md (hub)
  - notes/follicular-lymphoma.md  (project map)
  - notes/tcga-lung.md            (project map)
  - notes/alphafold.md            (project map)
  - notes/ssl-pretraining.md      (theme map)
  - notes/mil-methods.md          (theme map)
  - notes/class-imbalance.md      (theme map)
  - notes/evaluation-metrics.md   (theme map)
  - notes/model-selection.md      (theme map)
```

## How to use it

**Add a paper:**
Drop a PDF or markdown summary into inbox/ and run:
```
/extract
```
The pipeline extracts atomic claims, connects them to existing notes, and updates the graph.

**Log an experiment:**
```
/arscontexta:help
```
to see all available commands for creating experiment records, connecting notes, and querying the graph.

**Session start:**
The hooks run automatically. Claude Code reads your three project summaries, active research
threads, and recent decisions at the start of every session. No re-explaining needed.

## Setup

Requires Claude Code with arscontexta plugin:
```
/plugin marketplace add agenticnotetaking/arscontexta
/plugin install arscontexta@agenticnotetaking
```

Optional semantic search (requires Node 22+):
```
npm install -g @tobilu/qmd
cd vault/
qmd init
qmd collection add . --name "research-notes" --mask "**/*.md"
qmd update && qmd embed
```

## Visualizing the graph

Open this folder in [Obsidian](https://obsidian.md) to see the wikilink connections
rendered as an interactive network. The cross-cutting theme nodes (class-imbalance,
eval-metrics, ssl-pretraining) will show the most connections since every project links to them.

## Inspiration

This vault was inspired by Heinrich ([@arscontexta](https://x.com/arscontexta)) whose work on
skill graphs and agentic knowledge management directly motivated this approach.

Key posts that explain the thinking behind this system:

- [Skill Graphs > SKILL.md](https://x.com/arscontexta/status/2023957499183829467) - the original post
  explaining why single skill files are not enough for deep domains and how wikilink graphs
  enable agents to navigate complex knowledge
- [Obsidian + Claude Code 101](https://x.com/arscontexta/status/2013045749580259680) - how Claude Code
  operates markdown vaults as a living thinking system
- [arscontexta GitHub](https://github.com/agenticnotetaking/arscontexta) - the plugin that generated this vault

The core insight from Heinrich's work: a vault encodes how you think, not just what you thought about.
Every note is effectively a skill that gets injected when relevant. The methodology becomes
part of the system.

## Related

- [skill-graph-biomedical-ml](https://github.com/AravindKurapati/skill-graph-biomedical-ml)
  - Manual precursor to this vault. Built to understand skill graphs from first principles
    before using arscontexta to generate this system properly.
