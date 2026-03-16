---
description: LUAD vs LUSC classification from whole slide images using InceptionV3 on Barlow Twins SSL embeddings, NYU HPC
type: moc
project: tcga-lung
---

# tcga lung cancer

Binary classification of lung adenocarcinoma (LUAD) vs squamous cell carcinoma (LUSC) from whole slide images. InceptionV3 is trained on Barlow Twins SSL embeddings extracted from TCGA slides. Built on NYU HPC with multi-GPU SLURM jobs, extending the HPL (Histomorphological Phenotype Learning) framework.

## Core Ideas

*(Populate as claims are extracted from literature and experiments)*

## Active Experiments

*(Link experiment records here as they are created)*

## Tensions

*(Conflicting evidence, design disagreements)*

## Open Questions

- How much does SSL pretraining improve LUAD/LUSC classification vs supervised-only InceptionV3 baseline?
- What is the optimal SLURM job configuration for multi-GPU training on NYU HPC?
- How does class imbalance between LUAD and LUSC in TCGA affect model calibration?
- Does the HPL framework extension generalize without modification, or does it need LUAD/LUSC-specific adaptation?
- What evaluation metrics best capture clinical utility of LUAD/LUSC prediction?

## Cross-Project Connections

- SSL pretraining shares methods with: [[follicular-lymphoma]], [[ssl-pretraining]]
- Class imbalance in TCGA: [[class-imbalance]]
- Evaluation approach: [[evaluation-metrics]]
- MIL relevance (if patch-level aggregation used): [[mil-methods]]
