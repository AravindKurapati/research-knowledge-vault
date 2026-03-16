---
_schema:
  entity_type: "topic-map"
  applies_to: "notes/*.md (type: moc)"
  required:
    - description
    - type
  optional:
    - project
    - theme
  enums:
    type:
      - moc
  constraints:
    description:
      max_length: 200
      format: "One sentence describing what this topic map covers and its central research question"

# Topic map fields — replace values below
description: ""
type: moc
---

# [project or theme name]

[2-3 sentences: what this covers, the core research question, current state of knowledge.]

## Core Ideas

- [[claim]] — what it contributes
- [[experiment record]] — what result it established

## Tensions

[Conflicting claims, unresolved design questions — where the literature disagrees or experiments conflict.]

## Open Questions

[Unexplored directions, gaps in current coverage, contradictions to investigate.]
