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
- `system/schema.md`
- `system/resolver.md`
- `system/maintenance.md`

For Obsidian browsing, graph, MOC, or visual navigation tasks, also read:

- `system/obsidian.md`
- `wiki/首页.md`
- `wiki/maps/AGENTS.md`

For mutating workflows, also read the relevant audit checklist:

- Ingest or query-derived update: `system/evals/ingest-checklist.md`
- Lint or health check: `system/evals/lint-checklist.md`
- Migration or batch import: `system/lifecycle.md` plus `system/templates/migration-report.md`

## Core Model

The wiki has three layers:

- `sources/`: original evidence. Do not rewrite source content except to add metadata or clear archival notes.
- `inbox/`: temporary capture queue. `inbox` / `暂存` commands write only here and do not trigger source archival or wiki knowledge organization.
- `wiki/`: compiled knowledge. This is the durable middle layer consumed by people and agents.
- `system/`: rules, templates, evals, and workflows. Do not mix operational rules into content pages unless the nearest domain `AGENTS.md` says so.

## Main Workflows

Use the `llm-wiki` skill for:

- `Ingest`: convert new materials into durable pages, links, and logs.
- `Inbox Capture`: save raw fragments to `inbox/` only; do not create `sources/` or organize `wiki/` until explicit Ingest.
- `Query`: answer from wiki pages first, then sources if needed.
- `Lint`: check health, links, citations, schema, duplicates, and stale pages.
- `Setup / Migration`: import historical material through inventory, mapping, sample validation, full import, derived rebuild, health check, and migration report.

## Write Rules

- Keep original material in `sources/` intact. `inbox/` is only a temporary capture queue; after an inbox item is ingested and archived under `sources/`, remove the processed inbox file so the queue is clear.
- Treat `inbox` / `暂存` as capture-only commands. Explicit `ingest`, `入库`, `沉淀到 wiki`, or `处理 inbox` is required before writing `sources/` or compiled `wiki/` pages.
- Every non-trivial compiled claim should point to a source, log entry, or clearly marked inference.
- Prefer `[[wikilink]]` style internal links in wiki content.
- Update `wiki/index.md` when adding a new major page or domain.
- Update `wiki/首页.md` or `wiki/maps/` when a new page changes Obsidian navigation.
- Update the active monthly log under `wiki/logs/YYYY-MM.md` after each meaningful ingest, query-derived update, lint repair, report, migration step, or schema change.
- Update `wiki/log.md` only as the log index when a new month starts or recent summary changes.
- Avoid creating a new directory or page type before checking whether an existing domain owns it.

## Workflow Gates

Before mutating files:

- Use `system/resolver.md` to declare the workflow and target domains.
- Read each nearest target-domain `AGENTS.md`.
- Check existing pages and aliases before creating new pages.
- For complex or multi-domain ingest, sketch the route with `system/templates/ingest-plan.md`.

After mutating files:

- Run the relevant checklist from `system/evals/`.
- Confirm source paths and wikilinks introduced by the change.
- Update the active monthly log under `wiki/logs/YYYY-MM.md`.
- End with the auditable output fields required by the active workflow.

## Agent Behavior

- Do not invent facts about the user. If a page needs information that is not in sources, mark it as `Needs evidence`.
- When processing many files, do a small sample first and report counts before bulk work.
- Do not split the same person, concept, or event across multiple pages because of aliases. Check existing aliases first.
- Do not overfit the wiki to a single tool. Markdown and local files are the source of truth.

## Output Standard

After mutating the wiki, report:

- Workflow
- Wiki root
- Inputs
- Files read
- Files created
- Files updated
- Sources created or used
- Pages created
- Pages updated
- Links or aliases added
- Questions added
- Citations fixed
- Maintenance done
- Open questions
- Needs user review
- Suggested next action
