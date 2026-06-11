---
type: concept
title: Octopus-style Agent Architecture
aliases:
  - octopus-style-agent
  - distributed agent architecture
  - local executor agent architecture
language:
status: learning
learning_state: saved
progress_evidence:
  - sources/articles/2026-06-11-agent-workflow-feishu-links.md
tags:
  - llm
  - agent
  - architecture
  - tool-use
created: 2026-06-11
updated: 2026-06-11
---

# Octopus-style Agent Architecture

## Compiled Truth

Octopus-style agent architecture is a saved design analogy for separating central reasoning from local execution. The captured Feishu article argues that a central model should handle goals, strategy, arbitration, and learning, while local tool adapters or executors handle sensing, retries, validation, and environment-specific action.

In this framing, tools should return status, uncertainty, errors, and next-step clues, not only raw output. Skills become reusable action programs carried by local executors.

## Why It Matters

This matters for agent reliability. A central model that micromanages every low-level action can become brittle, expensive, and hard to debug. Local executors can make repeated tool work more robust if they expose clear feedback loops.

For the user's agent-development learning, this provides a design lens for tool integrations, skill systems, and workflow decomposition.

## Examples

- A document-fetching executor can handle API pagination, retry, permission errors, and structured extraction, then return a compact status report to the central agent.
- A wiki-ingest executor can validate source preservation and link existence locally before the central agent writes the final summary.

## Mastery Evidence

- Saved reference only: `sources/articles/2026-06-11-agent-workflow-feishu-links.md`
- Learning state: saved.
- Counts as progress: false in the source evidence.
- Needs implementation or explanation evidence before status can move beyond `learning`.

## Common Pitfalls

- Treating tool wrappers as passive API calls with no local feedback.
- Letting local executors make high-level decisions without exposing state to the central agent.
- Over-distributing control before the boundaries between planning and execution are clear.
- Treating the biology analogy as proof instead of a design heuristic.

## Related Concepts

- [[loop-engineering]]
- [[llm-wiki-pattern]]
- [[wiki/learning/agent-development/agent-development-learning|Agent Development Learning]]
- [[agent-development-internal-transfer]]

## Q&A

Q: What belongs in the central model?

A: Goal interpretation, strategy, conflict resolution, cross-domain synthesis, and deciding when to ask the user.

Q: What belongs in local executors?

A: Tool-specific mechanics, retries, validation, structured status reporting, and narrow feedback loops.

## Sources

- `sources/articles/2026-06-11-agent-workflow-feishu-links.md`
