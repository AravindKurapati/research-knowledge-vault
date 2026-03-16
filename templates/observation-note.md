---
_schema:
  entity_type: "observation-note"
  applies_to: "ops/observations/*.md, ops/tensions/*.md"
  required:
    - description
    - type
    - created
  optional:
    - session
    - resolution
    - status
  enums:
    type:
      - friction
      - surprise
      - process-gap
      - methodology-insight
      - contradiction
      - improvement
    status:
      - pending
      - reviewed
      - resolved
  constraints:
    description:
      max_length: 200
      format: "One sentence describing what was observed — specific enough to act on"

# Observation fields — replace values below
description: ""
type: friction
status: pending
created: YYYY-MM-DD
---

# prose description of what happened

Concrete description: what occurred, what was expected, what was surprising or wrong.
Specific enough that /reassess can evaluate whether this represents a pattern.

**If friction:** What step failed or felt slow? What was the workaround?
**If contradiction:** Which two notes conflict? What would resolve the contradiction?
**If improvement:** What change would help? Where in the pipeline does it apply?
