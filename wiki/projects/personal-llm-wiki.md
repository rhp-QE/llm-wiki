---
type: project
title: Personal LLM Wiki
status: active
started: 2026-06-09
updated: 2026-06-11
tags:
  - llm-wiki
  - codex
  - knowledge-management
---

# Personal LLM Wiki

## Goal

Build a personal knowledge system where raw personal documents are preserved, skills classify and store them into wiki pages, and new entries connect back to prior knowledge.

## Current State

User-stated for 2026-06-09: after work, the user studied how to use the personal wiki, had Codex read others' usage cases, and received an initial shape for the system.

User-stated for 2026-06-10: after arriving home around 19:00, the user kept working on the LLM-wiki and felt it was basically usable.

Agent inference from the source: the intended shape has three layers:

- Personal raw documents.
- Skills that classify raw documents into wiki storage.
- Links from new material to prior knowledge.

Saved references captured on 2026-06-11 add three relevant patterns for future study: [[llm-wiki-pattern]], [[loop-engineering]], and [[octopus-style-agent]]. These references are saved for later and do not by themselves count as learning mastery.

## Context

This project is part of the user's broader use of Codex and personal knowledge management.

The 2026-06-10 diary also records opening ChatGPT Pro at the user-stated price of 100 USD/month, with the intention to make heavy enough use of it to justify the cost.

## Decisions

- Preserve raw material before compiling wiki pages.
- Use skills to route sources into durable domains.
- Treat URL-only saved references as bounded evidence packages by default rather than full local archives.

## Tasks

- Continue ingesting real diary and learning notes.
- Clarify the daily diary template fields: date, location, weather, mood, energy, people, raw note.
- Run a lint after several real diary entries.
- Identify which repeated wiki operations are stable enough to become explicit [[loop-engineering|Loop Engineering]] workflows.
- Decide whether ChatGPT Pro spend should be tracked under a future finance/tool-budget page.

## Related Knowledge

- [[wiki/events/2026-06-09-beijing-work-wiki-career|2026-06-09 Beijing work, personal wiki, and career anxiety]]
- [[wiki/events/2026-06-10-byte-ios-llm-wiki-xiaoheihe|2026-06-10 ByteDance iOS work, LLM-wiki, and Xiaoheihe interview decision]]
- [[career-direction]]
- [[agent-development-internal-transfer]]
- [[llm-wiki-pattern]]
- [[loop-engineering]]
- [[octopus-style-agent]]

## Log

- 2026-06-09: first diary entry recorded active exploration of the wiki workflow and Codex-assisted examples.
- 2026-06-10: diary records the project as basically usable after evening work.
- 2026-06-11: captured Karpathy's LLM Wiki gist and two Feishu agent architecture/workflow links as saved references.

## Sources

- `sources/diary/2026/2026-06-09-beijing-work-wiki-career.md`
- `sources/diary/2026/2026-06-10-byte-ios-llm-wiki-xiaoheihe.md`
- `sources/articles/2026-06-11-karpathy-llm-wiki.md`
- `sources/articles/2026-06-11-agent-workflow-feishu-links.md`
