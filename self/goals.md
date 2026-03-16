---
description: Active research threads, current experiments, and open questions across all three projects
type: moc
---

# goals

## Active Threads

### Follicular Lymphoma
- Barlow Twins SSL pretraining on ResNet-50 from H&E WSIs
- Leiden clustering for biological validation of FL subtypes
- Gated Attention MIL for slide-level subtype classification
- Core question: does routine pathology imaging contain enough signal to replace RNA-seq subtyping?

### TCGA Lung Cancer
- LUAD vs LUSC classification using InceptionV3 on Barlow Twins SSL embeddings
- Multi-GPU SLURM training on NYU HPC
- Built on HPL framework extension
- Core question: how much does SSL pretraining improve over supervised-only baseline?

### AlphaFold Structure ML
- AlphaFold2 for downstream structure-based ML tasks
- GNNs on predicted protein structures
- pLDDT score filtering for structurally reliable predictions
- Core question: which downstream tasks benefit most from predicted vs experimental structures?

### Cross-Cutting
- SSL pretraining across all three projects — transferable patterns
- Class imbalance strategies for medical datasets
- MIL methods shared across FL and TCGA
- Evaluation metrics appropriate for imbalanced medical classification

## Open Questions

*(Populate as research progresses)*

## Completed

*(none yet — system initialized 2026-03-16)*

---

**Session Handoff** *(updated each session end)*

System initialized 2026-03-16. Vault created with full configuration. Skills and hooks require Claude Code restart to activate. Begin by capturing first inbox items — papers, experiment notes, or implementation decisions from current work.

---

Topics:
- [[identity]]
- [[methodology]]
