---
description: How to adjust your research knowledge system via config.yaml and /arscontexta:architect
type: manual
generated_from: "arscontexta-0.8.0"
---

# Configuration

## ops/config.yaml

The primary configuration file. Edit directly to adjust behavior without re-running setup.

Key settings:

```yaml
processing:
  depth: standard      # deep | standard | quick
  chaining: suggested  # manual | suggested | automatic
  extraction:
    selectivity: moderate  # strict | moderate | permissive
```

**depth:**
- `deep` — Full pipeline, fresh context per phase, maximum quality gates. For important sources and initial vault building.
- `standard` — Full pipeline, balanced attention. Default for regular processing.
- `quick` — Compressed pipeline. For high-volume catch-up, minor sources.

**chaining:**
- `manual` — Skills output "Next: /[skill]" — you decide
- `suggested` — Skills add next step to queue — you can skip
- `automatic` — Phases chain immediately

**selectivity:**
- `strict` — Only extract notes that clearly advance one of the three projects
- `moderate` — Default. Extract anything potentially relevant to the research areas.
- `permissive` — Extract broadly, filter later.

## Feature Toggles

```yaml
features:
  semantic-search: true   # qmd vector search (requires qmd install)
  processing-pipeline: true
```

## Maintenance Thresholds

```yaml
maintenance:
  orphan_threshold: 1       # any orphans trigger surface for /connect
  inbox_age_days: 3         # inbox items older than N days trigger /extract suggestion
  observation_threshold: 10  # pending observations trigger /reassess
  tension_threshold: 5       # pending tensions trigger /reassess
```

## Using /arscontexta:architect

For research-backed configuration advice:

```
/arscontexta:architect
```

/arscontexta:architect analyzes your vault health, friction patterns, and derivation history to propose specific changes with research justification. It never auto-implements — proposals require your approval.

Use it when:
- You're adding a fourth project and want advice on expanding the multi-domain setup
- Processing feels too slow or too shallow
- You want to adjust schema fields based on what you actually query

## Dimension Reference

Your current configuration (from `ops/derivation.md`):

| Dimension | Position | Why |
|-----------|----------|-----|
| Granularity | Atomic | Cross-project composability requires one claim per file |
| Organization | Flat | 3 projects + 5 themes: topic maps handle navigation |
| Linking | Explicit + implicit | Cross-disciplinary vocabulary requires semantic search |
| Processing | Heavy | Two note types with dense schema |
| Navigation | 3-tier | 8 topic maps justify the additional tier |
| Schema | Dense | project, confidence, metrics, hyperparameters fields |
| Automation | Full | Claude Code platform + explicit automation expectations |

See [[meta-skills]] for /arscontexta:architect details.
See [[troubleshooting]] for configuration issues.
