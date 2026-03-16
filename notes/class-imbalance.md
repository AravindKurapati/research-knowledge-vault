---
description: Strategies for handling class imbalance in medical datasets across FL, TCGA, and pathology classification
type: moc
---

# class imbalance

Medical datasets are structurally imbalanced — rare subtypes are rare by definition. Strategies span data-level (oversampling, undersampling, augmentation), algorithm-level (class weights, focal loss, threshold tuning), and evaluation-level (choosing metrics robust to imbalance). The right strategy depends on the imbalance severity, the cost asymmetry of errors, and the training data size.

## Core Ideas

*(Populate as claims are extracted from literature and experiments)*

## Tensions

- SMOTE vs class-weighted loss: when does synthetic oversampling help vs hurt?
- Focal loss vs cross-entropy with weights: sample efficiency on small medical datasets
- Threshold tuning at inference vs training-time class weighting: which generalizes better?

## Open Questions

- What imbalance ratio triggers meaningful performance degradation in Gated Attention MIL?
- Does stratified sampling outperform oversampling for histology patch classification?
- How should class imbalance handling differ between FL subtype prediction (multi-class) and LUAD/LUSC (binary)?
- Do class imbalance techniques interact with SSL pretraining — does imbalance matter less with pretrained features?

## Projects Using This Theme

- [[follicular-lymphoma]] — FL subtype imbalance, multi-class
- [[tcga-lung]] — LUAD/LUSC imbalance in TCGA cohort
- [[alphafold]] — Potential imbalance in structure classes for downstream tasks
