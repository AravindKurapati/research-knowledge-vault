---
description: AlphaFold2 for downstream structure-based ML — GNNs on predicted structures, pLDDT filtering
type: moc
project: alphafold
---

# alphafold structure prediction

Using AlphaFold2 predicted protein structures as inputs for downstream ML tasks. GNNs are applied to the predicted 3D structures to learn structure-function relationships. pLDDT (predicted Local Distance Difference Test) scores filter predictions by structural reliability before downstream use.

## Core Ideas

*(Populate as claims are extracted from literature and experiments)*

## Active Experiments

*(Link experiment records here as they are created)*

## Tensions

*(Conflicting evidence, design disagreements)*

## Open Questions

- What pLDDT threshold reliably separates structurally meaningful from unreliable predictions?
- Which downstream tasks benefit from predicted structures vs experimental (PDB) structures?
- How should GNN architecture be adapted for AlphaFold-predicted confidence scores?
- Are domain-specific fine-tuned AlphaFold models available for relevant protein families?
- How does structural noise from AlphaFold predictions propagate through GNN training?

## Cross-Project Connections

- SSL pretraining principles may apply to structure-based pre-training: [[ssl-pretraining]]
- Evaluation metrics for structure prediction quality: [[evaluation-metrics]]
- Model selection trade-offs (GNN vs classical graph methods): [[model-selection]]
