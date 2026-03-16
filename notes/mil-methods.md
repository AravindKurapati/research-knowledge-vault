---
description: Multiple instance learning methods for weakly-supervised classification of whole slide images
type: moc
---

# mil methods

Cross-cutting theme for weakly supervised learning from whole slide images. In MIL, a slide is a "bag" of patches — the bag label (subtype, diagnosis) is known but patch labels are not. The key design choices: pooling mechanism (attention, max, mean), feature extractor (pretrained CNN, SSL backbone), and aggregation level (patch-level vs region-level vs slide-level).

## Core Ideas

*(Populate as claims are extracted from literature and experiments)*

## Tensions

- Gated Attention MIL vs ABMIL: performance differences on small vs large datasets
- Patch-level pooling vs hierarchical aggregation: compute vs accuracy trade-off
- Instance-level bag labels: does aggregation method affect which patches are attended to?

## Open Questions

- Does Gated Attention MIL reliably localize discriminative regions (interpretability vs performance trade-off)?
- How sensitive is MIL performance to patch extraction strategy (patch size, overlap, magnification)?
- Can MIL attention maps be used as proxy supervision for pathologist agreement?
- What sample size is needed for stable Gated Attention MIL training in imbalanced settings?

## Projects Using This Theme

- [[follicular-lymphoma]] — Gated Attention MIL for slide-level FL subtype classification
- [[tcga-lung]] — MIL relevant if patch-level aggregation is used for LUAD/LUSC
