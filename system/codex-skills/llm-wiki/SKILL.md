---
name: llm-wiki
description: >
  Bootstrap and route a local Markdown-first LLM-wiki framework instance. Use
  this only when the request explicitly targets the user's wiki, for example
  llm_wiki, llm-wiki, my wiki, 我的 wiki, personal wiki, 查询我的 wiki, 检查我的
  wiki, 记录到我的知识库, 沉淀到 wiki, 入库到 wiki, 处理 wiki inbox, wiki inbox,
  wiki todo, wiki ingest, wiki lint, wiki migration, or the shortcut commands
  /wiki-todo, /wiki-ingest, /wiki-query, /wiki-lint, /wiki-migrate, and
  /wiki-report. Avoid triggering on generic words such as inbox, todo, ingest,
  knowledge base, or Obsidian unless the wiki context is explicit. This
  bootstrap skill is intentionally thin; the canonical local skill and workflow
  files live under system/.
---

# LLM Wiki Bootstrap Skill

This file is the installable/bootstrap version of the local skill. Keep it thin.

## Root Detection

Use the current working directory when it contains:

- `AGENTS.md`
- `system/skills/llm-wiki/SKILL.md`

Otherwise, walk upward to find those files.

If no current or parent directory is a wiki root, use `/root/llm-wiki`
when it contains both marker files above. This is the default wiki root
for this machine.

If no wiki root is found, ask for the root path. Do not recursively scan
arbitrary child directories unless the user asks for discovery.

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
