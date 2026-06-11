---
name: llm-wiki
description: >
  Bootstrap and route a local Markdown-first LLM-wiki framework instance. Use
  this when the user mentions llm_wiki, llm-wiki, knowledge base, inbox, todo,
  待办, ingest, query my wiki, lint/check wiki, migrate old notes, Obsidian
  notes, 沉淀到 wiki, 入库, or 处理 inbox. This bootstrap skill is intentionally
  thin; the canonical local skill and workflow files live under system/.
  Shortcut commands: /wiki-todo, /wiki-ingest, /wiki-query, /wiki-lint,
  /wiki-migrate, /wiki-report.
---

# LLM Wiki Bootstrap Skill

This file is the installable/bootstrap version of the local skill. Keep it thin.

## Root Detection

Use the current working directory when it contains:

- `AGENTS.md`
- `system/skills/llm-wiki/SKILL.md`

Otherwise, walk upward to find those files. If no wiki root is found, ask for the root path.

## Load Order

Read:

1. `AGENTS.md`
2. `wiki/index.md`
3. `system/resolver.md`
4. `system/skills/llm-wiki/SKILL.md`

Then follow the local skill. Do not duplicate its workflow rules here.

## Route

The local skill routes to:

- `system/workflows/inbox.md`
- `system/workflows/task.md`
- `system/workflows/ingest.md`
- `system/workflows/query.md`
- `system/workflows/lint.md`
- `system/workflows/migration.md`
- `system/workflows/report.md`

Reusable hard rules live under `system/policies/`.

## Hard Rules

- Inbox capture writes only `inbox/`.
- Explicit Ingest is required before writing `sources/` or compiled `wiki/` pages.
- User-provided durable material must be preserved verbatim in `sources/` before compiled pages are written.
- Direct todo/task commands write to the task system, not `inbox/`.
- Query is read-only.
- Migration must not skip sample validation.

## Output

Use the output format defined by the selected local workflow file.
