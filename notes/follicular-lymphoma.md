---
description: Predicting FL transcriptional subtypes from H&E whole slide images — replacing RNA-seq with routine pathology imaging
type: moc
project: follicular-lymphoma
---

# follicular lymphoma

The central question: does routine H&E pathology imaging contain sufficient signal to replace RNA-seq-based transcriptional subtyping in follicular lymphoma? The approach uses Barlow Twins SSL pretraining on a ResNet-50 backbone followed by Gated Attention MIL for slide-level classification, with Leiden clustering for biological validation of discovered subtypes.

## Core Ideas

*(Populate as claims are extracted from literature and experiments)*

## Active Experiments

*(Link experiment records here as they are created)*

## Tensions

*(Conflicting evidence, design disagreements, unresolved architectural questions)*

## Open Questions

- Does SSL pretraining on TCGA-DLBCL generalize to FL-specific morphologies?
- What patch size best captures nuclear features predictive of FL subtypes?
- How many Leiden clusters correspond to biologically meaningful transcriptional groups?
- Does Gated Attention MIL localize discriminative regions that correlate with known histological markers?
- What is the minimum number of slides per subtype needed for reliable classification?

## Cross-Project Connections

- SSL pretraining strategy connects to: [[ssl-pretraining]], [[tcga-lung]]
- MIL architecture connects to: [[mil-methods]]
- Class imbalance handling: [[class-imbalance]]
- Evaluation approach: [[evaluation-metrics]]
