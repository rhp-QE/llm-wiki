---
type: report
report_type: health_check
title: LLM Wiki Framework Architecture Review
period: 2026-06-12
status: final
created: 2026-06-12
updated: 2026-06-12
sources: []
---

# LLM Wiki Framework Architecture Review

## Executive Summary

The framework now has a cleaner long-term architecture: thin skill, resolver, workflow files, policy files, schema registry, eval checklists, domain schemas, and retrieval indexes. The review found and fixed three structural gaps: domain `AGENTS.md` files did not consistently expose required schema headings, the schema registry duplicated policy bodies, and there was no dedicated retrieval index layer.

## Scope

- Instruction architecture.
- Workflow and policy boundaries.
- Domain schema completeness.
- Knowledge-network linkage.
- Retrieval index architecture.

## What Changed / What Was Checked

- Checked `system/skills/llm-wiki/SKILL.md`, `system/resolver.md`, `system/lifecycle.md`, `system/workflows/`, `system/policies/`, `system/schema.md`, domain `AGENTS.md`, templates, maps, and entry pages.
- Added `wiki/indexes/` as the retrieval-index domain.
- Reduced `system/schema.md` to shared types, statuses, fields, and link rules.
- Added missing `When To Use`, `How To Update`, `Page Location`, `Frontmatter`, `Body`, or `Anti-Patterns` sections to domain `AGENTS.md` files.
- Added missing common templates for project, theme, mental model, report, map, index page, and writing article.

## Key Findings

- The instruction layers are now clear: `SKILL.md` routes, `resolver.md` classifies, `workflows/` execute, `policies/` enforce hard rules, `schema.md` defines fields, and domain `AGENTS.md` files define page shape.
- The domain model can form a useful knowledge network through people, events, themes, models, projects, tasks, learning, tech, Q&A, reports, maps, and indexes.
- `wiki/maps/` and `wiki/indexes/` now have distinct responsibilities: maps are for visual navigation; indexes are for fast lookup.

## Issues

- Some unavoidable short reminders remain in `AGENTS.md`, README, workflow files, and checklists. This is acceptable if policy bodies remain authoritative under `system/policies/`.
- Generated index scripts do not exist yet; `wiki/indexes/` currently defines the architecture and entry point only.
- `system/schema.md` is cleaner but still depends on lint discipline to prevent schema drift.

## Next Actions

- Add an automated lint script for frontmatter, required domain headings, broken wikilinks, and stale indexes.
- Add generated index builders for entities, aliases, timeline, and source manifest.
- After the first real ingest, validate whether the domain network links are sufficient or whether a dedicated decisions domain is needed.

## Evidence

- `system/skills/llm-wiki/SKILL.md`
- `system/resolver.md`
- `system/workflows/`
- `system/policies/`
- `system/schema.md`
- `wiki/indexes/AGENTS.md`
- `wiki/indexes/索引.md`
