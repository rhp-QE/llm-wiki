# LLM Wiki Operating Guide

This repository is a personal LLM-wiki. Treat it as a knowledge codebase: read the local rules, make small auditable changes, preserve sources, and keep the wiki useful to both the user and future agents.

## Always Read First

Before any wiki operation, read:

1. `system/skills/llm-wiki/SKILL.md`
2. `wiki/index.md`
3. The nearest `AGENTS.md` in the target directory

For broad tasks, also read:

- `system/lifecycle.md`
- `system/conventions.md`
- `system/resolver.md`
- `system/maintenance.md`

## Core Model

The wiki has three layers:

- `sources/`: original evidence. Do not rewrite source content except to add metadata or clear archival notes.
- `wiki/`: compiled knowledge. This is the durable middle layer consumed by people and agents.
- `system/`: rules, templates, evals, and workflows. Do not mix operational rules into content pages unless the nearest domain `AGENTS.md` says so.

## Main Workflows

Use the `llm-wiki` skill for:

- `Ingest`: convert new materials into durable pages, links, and logs.
- `Query`: answer from wiki pages first, then sources if needed.
- `Lint`: check health, links, citations, schema, duplicates, and stale pages.
- `Setup / Migration`: import historical material through inventory, mapping, sample validation, full import, derived rebuild, health check, and migration report.

## Write Rules

- Keep original material in `sources/` or `inbox/` intact.
- Every non-trivial compiled claim should point to a source, log entry, or clearly marked inference.
- Prefer `[[wikilink]]` style internal links in wiki content.
- Update `wiki/index.md` when adding a new major page or domain.
- Update `wiki/log.md` after each meaningful ingest, query-derived update, lint repair, or schema change.
- Avoid creating a new directory or page type before checking whether an existing domain owns it.

## Agent Behavior

- Do not invent facts about the user. If a page needs information that is not in sources, mark it as `Needs evidence`.
- When processing many files, do a small sample first and report counts before bulk work.
- Do not split the same person, concept, or event across multiple pages because of aliases. Check existing aliases first.
- Do not overfit the wiki to a single tool. Markdown and local files are the source of truth.

## Output Standard

After mutating the wiki, report:

- Files read
- Files created
- Files updated
- Links or aliases added
- Open questions
- Suggested next action
