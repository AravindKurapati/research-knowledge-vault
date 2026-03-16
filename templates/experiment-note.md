---
_schema:
  entity_type: "experiment-note"
  applies_to: "notes/*.md (type: experiment)"
  required:
    - description
    - type
    - project
    - dataset
    - status
    - created
  optional:
    - metrics
    - hyperparameters
    - decisions
    - hardware
    - runtime
    - git_commit
    - superseded_by
  enums:
    type:
      - experiment
    project:
      - follicular-lymphoma
      - tcga-lung
      - alphafold
    dataset:
      - TCGA-DLBCL
      - TCGA-LUAD-LUSC
      - PDB
      - custom
    status:
      - planned
      - running
      - completed
      - failed
      - superseded
  constraints:
    description:
      max_length: 200
      format: "One sentence describing this experiment and its key finding or current state"
    metrics:
      format: "Comma-separated metric=value pairs, e.g. 'AUC 0.87, F1 0.79 (macro)'"
    hyperparameters:
      format: "Key=value pairs, e.g. 'lr=1e-4, batch=32, epochs=50'"

# Experiment record fields — replace values below
description: ""
type: experiment
project: follicular-lymphoma
dataset: TCGA-DLBCL
metrics: ""
hyperparameters: ""
hardware: ""
status: planned
decisions: []
created: YYYY-MM-DD
---

# prose-as-title: describe the experiment and what it tested

## Setup

What was tested and why. What motivated this specific design choice. Links to claims that justified the approach.

## Results

What happened. Key numbers. How they compare to baseline or prior experiments.

## Decisions

What this experiment decided. What was ruled out. What remains open.

---

Relevant Notes:
- [[claim that motivated this]] — why this approach
- [[prior experiment]] — baseline comparison

Topics:
- [[follicular-lymphoma]]
