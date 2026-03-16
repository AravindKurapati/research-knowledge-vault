---
_schema:
  entity_type: "claim-note"
  applies_to: "notes/*.md (type: claim)"
  required:
    - description
    - type
    - project
    - confidence
    - source
    - created
  optional:
    - methodology
    - contradicted_by
    - replication_status
  enums:
    type:
      - methodology-claim
      - experimental-finding
      - implementation-pattern
      - cross-domain-insight
      - class-imbalance-strategy
      - evaluation-method
      - question
      - tension
    project:
      - follicular-lymphoma
      - tcga-lung
      - alphafold
      - cross-project
    confidence:
      - established
      - likely
      - experimental
      - contradicted
  constraints:
    description:
      max_length: 200
      format: "One sentence adding context beyond the title — mechanism, scope, or implication"
    source:
      format: "[[inbox/source-file]] or external citation"

# Claim note fields — replace values below
description: ""
type: methodology-claim
project: follicular-lymphoma
confidence: experimental
source: "[[inbox/]]"
created: YYYY-MM-DD
---

# prose-as-title: state the claim here

Explain the reasoning behind the claim. Why does this matter for one or more of the three projects? What is the evidence? What are the limits of the claim?

---

Relevant Notes:
- [[related claim]] — how it connects

Topics:
- [[follicular-lymphoma]]
