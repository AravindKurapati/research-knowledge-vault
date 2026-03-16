---
description: Classical ML vs deep learning trade-offs in medical imaging and structure-based tasks
type: moc
---

# model selection

When should a medical imaging task use a classical ML approach (SVMs on hand-crafted features, gradient boosting on extracted statistics) vs a deep learning approach (end-to-end CNN, SSL + fine-tune)? The decision depends on labeled data volume, interpretability requirements, compute availability, and whether the signal is in low-level features (edges, textures) or high-level patterns (morphological context).

## Core Ideas

*(Populate as claims are extracted from literature and experiments)*

## Tensions

- SSL + fine-tune vs supervised CNN: when does the pretrained representation stop helping?
- GNN vs classical graph kernels for protein structure: sample efficiency differences
- InceptionV3 vs vision transformer architectures: trade-offs at TCGA scale

## Open Questions

- At what labeled data volume does SSL pretraining stop providing meaningful advantage over supervised baseline?
- Does gradient boosting on SSL features outperform fine-tuned CNN at low sample sizes?
- What is the minimum dataset size for reliable Gated Attention MIL training vs simpler aggregation?
- For AlphaFold GNN tasks, when are graph neural networks justified vs simpler graph statistics?

## Projects Using This Theme

- [[follicular-lymphoma]] — Barlow Twins SSL + Gated Attention MIL vs simpler aggregation
- [[tcga-lung]] — InceptionV3 fine-tune vs classical ML on SSL embeddings
- [[alphafold]] — GNN vs classical graph methods for structure-based tasks
