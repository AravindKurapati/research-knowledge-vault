---
engine_version: "0.8.0"
research_snapshot: "2026-03-16"
generated_at: "2026-03-16T00:00:00Z"
platform: claude-code
kernel_version: "1.0"

dimensions:
  granularity: atomic
  organization: flat
  linking: explicit+implicit
  processing: heavy
  navigation: 3-tier
  maintenance: condition-based
  schema: dense
  automation: full

active_blocks:
  - atomic-notes
  - wiki-links
  - mocs
  - processing-pipeline
  - semantic-search
  - schema
  - maintenance
  - self-evolution
  - methodology-knowledge
  - session-rhythm
  - templates
  - multi-domain
  - ethical-guardrails
  - self-space
  - helper-functions
  - graph-analysis

coherence_result: passed

vocabulary:
  # Level 1: Folder names
  notes: "notes"
  inbox: "inbox"
  archive: "archive"
  ops: "ops"

  # Level 2: Note types
  note: "claim"
  note_plural: "claims"
  note_type_2: "experiment record"
  note_type_2_plural: "experiment records"

  # Level 3: Schema field names
  description: "description"
  topics: "topics"
  relevant_notes: "relevant notes"

  # Level 4: Navigation terms
  topic_map: "topic map"
  hub: "index"

  # Level 5: Process verbs
  reduce: "extract"
  reflect: "connect"
  reweave: "update"
  verify: "verify"
  validate: "validate"
  rethink: "reassess"

  # Level 6: Command names (as users invoke them)
  cmd_reduce: "/extract"
  cmd_reflect: "/connect"
  cmd_reweave: "/update"
  cmd_verify: "/verify"
  cmd_rethink: "/reassess"

  # Level 7: Extraction categories
  extraction_categories:
    - name: "methodology-claims"
      what_to_find: "ML/DL architecture decisions with empirical backing (e.g., why Barlow Twins over SimCLR for histology)"
      output_type: "claim"
    - name: "experimental-findings"
      what_to_find: "empirical results: accuracy, AUC, TTFT, ablation outcomes across FL/TCGA/AlphaFold"
      output_type: "claim or experiment record"
    - name: "implementation-patterns"
      what_to_find: "code and infrastructure patterns for GPU training, SLURM jobs, Kaggle notebooks, HPC"
      output_type: "claim"
    - name: "cross-domain-insights"
      what_to_find: "structural connections across all three projects (e.g., SSL pretraining applies to both FL and TCGA)"
      output_type: "claim"
    - name: "class-imbalance-strategies"
      what_to_find: "techniques for handling imbalanced medical datasets"
      output_type: "claim"
    - name: "evaluation-methods"
      what_to_find: "metrics for imbalanced data, MIL evaluation, clinical utility of predictions"
      output_type: "claim"
    - name: "open-questions"
      what_to_find: "unresolved research directions, gaps, contradictions to investigate"
      output_type: "claim (type: question)"

platform_hints:
  context: fork
  allowed_tools:
    - Read
    - Write
    - Edit
    - Bash
    - Grep
    - Glob
    - WebSearch
    - WebFetch
  semantic_search_tool: null  # update to mcp__qmd__deep_search after qmd installation

personality:
  warmth: clinical
  opinionatedness: neutral
  formality: formal
  emotional_awareness: task-focused
---
