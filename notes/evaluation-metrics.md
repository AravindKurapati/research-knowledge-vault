---
description: Metrics for evaluating imbalanced medical classification, MIL performance, and clinical utility of predictions
type: moc
---

# evaluation metrics

Choosing evaluation metrics for medical ML is not neutral — different metrics optimize for different clinical trade-offs. Accuracy is meaningless on imbalanced datasets. AUC measures ranking, not calibration. F1 favors balanced precision-recall. The choice of metric must reflect the clinical use case: screening (high recall) vs confirmation (high precision) vs monitoring (calibration).

## Core Ideas

*(Populate as claims are extracted from literature and experiments)*

## Tensions

- AUROC vs macro-F1 for multi-class imbalanced classification: which reports more honestly?
- Per-class metrics vs aggregated: reporting both or choosing one?
- Clinical utility (sensitivity at fixed specificity) vs statistical metrics: when does clinical framing override ML framing?

## Open Questions

- What is the appropriate primary metric for FL subtype prediction? AUROC per class, or something else?
- How should LUAD/LUSC classification performance be reported to be clinically meaningful?
- Is there a standard for evaluating GNN predictions on AlphaFold structures?
- How do MIL-specific metrics (patch-level AUC vs slide-level AUC) relate to clinical deployment quality?

## Projects Using This Theme

- [[follicular-lymphoma]] — Multi-class subtype prediction, imbalanced
- [[tcga-lung]] — Binary LUAD/LUSC, TCGA cohort imbalance
- [[alphafold]] — Evaluation of downstream structure-based predictions
