---
description: Complete reference for every available command in the research knowledge system
type: manual
generated_from: "arscontexta-0.8.0"
---

# Skills

All commands use the form `/command-name [arguments]`. Plugin commands use `/arscontexta:command`.

## Processing Skills

These skills operate the pipeline that turns source material into connected knowledge.

| Command | What It Does | When to Use |
|---------|-------------|-------------|
| `/extract [file]` | Extract atomic claims and experiment records from source material | After dropping something in inbox/ |
| `/connect [note]` | Find connections between notes, update topic maps | After creating new notes |
| `/update [note]` | Revisit old notes with current knowledge, backward pass | After learning something that changes earlier conclusions |
| `/verify [note]` | Check description quality, schema compliance, link health | Before considering a note "done" |
| `/validate` | Batch schema validation across all notes | Periodic quality audit |

## Orchestration Skills

These skills coordinate the pipeline across multiple notes or sessions.

| Command | What It Does | When to Use |
|---------|-------------|-------------|
| `/seed [source]` | Run full pipeline (capture → extract → connect → verify) for one source | Complete processing of a single paper or experiment record |
| `/orchestrate` | Ralph orchestrator — fresh-context pipeline execution | Processing batches where context isolation matters |
| `/pipeline` | Queue-driven pipeline management, monitor task status | When processing multiple sources |
| `/tasks` | Task queue management — add, view, complete tasks | Managing the ops/queue/ state |

## Navigation Skills

These skills help you find what you know and understand the graph structure.

| Command | What It Does | When to Use |
|---------|-------------|-------------|
| `/next` | Reconcile maintenance conditions, surface next action recommendation | "What should I do?" — intelligent next-step |
| `/stats` | Vault metrics: note counts, link density, processing throughput | Periodic health overview |
| `/graph [query]` | Interactive graph analysis — clusters, bridges, influence | Understanding structure, synthesis |

## Growth Skills

These skills expand and correct the knowledge graph.

| Command | What It Does | When to Use |
|---------|-------------|-------------|
| `/learn [topic]` | Research a topic and file results to inbox with provenance | "What does the literature say about X?" |
| `/remember [observation]` | Capture friction, corrections, methodology learnings | When something goes wrong or you discover a pattern |

## Evolution Skills

These skills maintain and evolve the system itself.

| Command | What It Does | When to Use |
|---------|-------------|-------------|
| `/reassess` | Review accumulated observations and tensions, propose system changes | When 10+ observations accumulate, or friction recurs |
| `/refactor` | Structural vault refactoring — rename notes, restructure topic maps | When naming or structure has drifted |

## Plugin Commands (always available)

These commands use the bundled Ars Contexta research knowledge base.

| Command | What It Does |
|---------|-------------|
| `/arscontexta:ask [question]` | Research-backed methodology guidance from 249-note knowledge base |
| `/arscontexta:architect` | Evidence-based configuration advice for your system |
| `/arscontexta:health` | Vault health diagnostics — schema, orphans, links, quality |
| `/arscontexta:help` | Contextual command discovery |
| `/arscontexta:next` | Intelligent next-action recommendation |
| `/arscontexta:learn [topic]` | Research and file results to inbox |
| `/arscontexta:tutorial` | Interactive guided walkthrough |
| `/arscontexta:add-domain` | Add a new research domain/project |
| `/arscontexta:upgrade` | Check for methodology improvements |
| `/arscontexta:reseed` | Re-derive system configuration from scratch |

See [[meta-skills]] for detailed documentation on /arscontexta:ask, /arscontexta:architect, /reassess, and /remember.
See [[workflows]] for how skills chain together in the processing pipeline.
