---
type: concept
title: LLM Wiki Pattern
aliases:
  - llm-wiki-pattern
  - LLM Wiki
  - personal LLM wiki
language:
status: learning
learning_state: saved
progress_evidence:
  - sources/articles/2026-06-11-karpathy-llm-wiki.md
  - sources/diary/2026/2026-06-10-byte-ios-llm-wiki-xiaoheihe.md
tags:
  - llm
  - knowledge-management
  - agent
  - obsidian
created: 2026-06-11
updated: 2026-06-11
---

# LLM Wiki Pattern

## Compiled Truth

An LLM wiki pattern separates original evidence from compiled knowledge. The core shape is:

- Preserve raw inputs under `sources/`.
- Compile durable, linked understanding under `wiki/`.
- Keep operating rules, schemas, templates, and checklists under `system/`.
- Use logs and indexes so future agents can audit what changed and where to resume.

In the user's local implementation, `inbox/` is an explicit temporary queue. It does not become durable knowledge until an explicit ingest archives the material under `sources/` and updates compiled wiki pages.

## Why It Matters

This pattern makes a personal knowledge base more maintainable than repeated ad hoc retrieval from raw chunks. The agent can answer from compiled pages first, then drill back to sources when the evidence matters.

For the user, this is directly tied to [[personal-llm-wiki]] and to the broader goal of turning scattered diary, learning, and project notes into a navigable system.

## Examples

- The 2026-06-10 diary was preserved in `sources/diary/2026/2026-06-10-byte-ios-llm-wiki-xiaoheihe.md`, then compiled into [[wiki/events/2026-06-10-byte-ios-llm-wiki-xiaoheihe|2026-06-10 ByteDance iOS work, LLM-wiki, and Xiaoheihe interview decision]] and linked project/theme pages.
- Karpathy's gist was captured as a bounded URL evidence package at `sources/articles/2026-06-11-karpathy-llm-wiki.md`; it is saved as a reference, not treated as mastery evidence.

## Mastery Evidence

- Saved reference: `sources/articles/2026-06-11-karpathy-llm-wiki.md`
- Applied local project evidence: [[personal-llm-wiki]] records that the user's wiki was basically usable by 2026-06-10.
- Learning caveat: the saved article itself has `counts_as_progress: false`; it does not prove the user has mastered the pattern.

## Common Pitfalls

- Mixing source preservation and compiled interpretation in the same section.
- Treating `inbox/` as durable storage instead of a temporary queue.
- Letting maps and indexes become second copies of source summaries.
- Creating many unlinked pages without updating navigation or logs.

## Related Concepts

- [[personal-llm-wiki]]
- [[loop-engineering]]
- [[octopus-style-agent]]
- [[wiki/learning/agent-development/agent-development-learning|Agent Development Learning]]

## Q&A

Q: When should a note become a source instead of staying in inbox?

A: Only after explicit ingest. During ingest, user-provided durable material is preserved under `sources/` before compiled pages are updated.

Q: Does saving an article about LLM-wikis count as learning progress?

A: No. A saved URL is useful context, but it stays `learning_state: saved` until there is study, practice, application, or validation evidence.

## Sources

- `sources/articles/2026-06-11-karpathy-llm-wiki.md`
- `sources/diary/2026/2026-06-10-byte-ios-llm-wiki-xiaoheihe.md`
