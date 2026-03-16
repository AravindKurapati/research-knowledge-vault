---
description: Self-supervised pretraining on medical images — transferable patterns across FL, TCGA, and structure-based tasks
type: moc
---

# ssl pretraining

Cross-cutting theme connecting all three projects. SSL pretraining (Barlow Twins, SimCLR, DINO, MAE) trains representations without labels, then fine-tunes on small labeled medical datasets. The central question across projects: how much does pretraining data domain, augmentation strategy, and SSL objective affect downstream task performance?

**Note on vocabulary:** "SSL" and "self-supervised" in this theme refer to contrastive/non-contrastive pretraining methods on medical images (Barlow Twins, SimCLR). Distinguish from SSL in transformers (self-supervised language model pretraining) when making cross-domain links.

## Core Ideas

*(Populate as claims are extracted from literature and experiments)*

## Tensions

- Barlow Twins vs SimCLR for small-batch histology: conflicting evidence across settings
- Domain-specific pretraining vs ImageNet initialization: when is it worth the compute?
- Patch-level vs slide-level pretraining objectives in MIL pipelines

## Open Questions

- Which SSL objective (Barlow Twins, DINO, MAE) is most sample-efficient for histology?
- How much does pretraining data domain (TCGA vs in-house vs ImageNet) affect downstream FL/TCGA performance?
- Can SSL representations pretrained for FL generalize to TCGA LUAD/LUSC without fine-tuning?
- What augmentation strategies preserve histological features relevant to subtype prediction?

## Projects Using This Theme

- [[follicular-lymphoma]] — Barlow Twins SSL on ResNet-50, patch-level representations
- [[tcga-lung]] — Barlow Twins SSL embeddings for InceptionV3 fine-tuning
