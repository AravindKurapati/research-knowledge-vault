---
description: Deep guide to /arscontexta:ask, /arscontexta:architect, /reassess, and /remember
type: manual
generated_from: "arscontexta-0.8.0"
---

# Meta-Skills

Meta-skills operate on the system itself rather than on research content.

## /arscontexta:ask

Query the bundled Ars Contexta research knowledge graph for methodology guidance.

```
/arscontexta:ask "why does this system use atomic notes?"
/arscontexta:ask "how should I handle a source that spans all three projects?"
/arscontexta:ask "what are the trade-offs of condition-based maintenance?"
/arscontexta:ask "when should I split a topic map?"
```

Routes through a 3-tier knowledge base:
1. **WHY** — research claims (empirical backing for design choices)
2. **HOW** — guidance documents (practical application)
3. **WHAT IT LOOKS LIKE** — domain examples (concrete implementations)

Use when you want to understand why your system is designed a certain way, or when you're deciding whether to deviate from a methodology default.

## /arscontexta:architect

Research-backed configuration advice. Analyzes your vault's health reports, friction patterns in `ops/observations/`, and derivation history in `ops/methodology/` to propose specific changes with research justification.

```
/arscontexta:architect
/arscontexta:architect "I want to add a fourth project"
/arscontexta:architect "processing feels too slow"
```

Never auto-implements — all proposals require your approval. After approval, use `/arscontexta:upgrade` to implement approved changes.

Use when:
- The vault has drifted from its original configuration
- You want evidence-backed advice before changing schema
- You're expanding the multi-domain setup

## /reassess

Review accumulated observations and tensions. Proposes methodology improvements based on actual friction.

```
/reassess
/reassess drift          # check for configuration drift
/reassess observations   # review pending observations only
```

/reassess reads `ops/observations/` and `ops/tensions/`, identifies patterns, and proposes specific improvements. Writes outcomes to `ops/methodology/`.

**Trigger:** Run when `ops/observations/` reaches 10+ pending items, or when the same friction occurs 3+ times.

**Rule Zero:** The methodology in `ops/methodology/` is the canonical specification. When system behavior diverges from that specification, /reassess detects and documents the drift.

## /remember

Capture friction, corrections, and methodology learnings.

```
/remember "search failed to find the Barlow Twins claim when searching SSL"
/remember "experiment records should link to the hypothesis claim that motivated them"
/remember "always check for duplicate notes before extracting — found 3 near-duplicates today"
```

Creates an atomic note in `ops/observations/` with `type: friction` or `type: methodology-insight`. These accumulate until /reassess reviews them.

When to use:
- Something in the pipeline didn't work as expected
- You found yourself doing something manually that should be automated
- A user correction contains a general principle worth preserving
- You discovered a pattern worth tracking

See [[configuration]] for config changes.
See [[troubleshooting]] for drift-related issues.
