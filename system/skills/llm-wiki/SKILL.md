---
name: llm-wiki
version: 2.0.0
description: >
  Bootstrap and route a local Markdown-first LLM-wiki framework instance. Use
  this whenever the user asks to capture inbox material, ingest notes, query the
  wiki, manage tracked todos, lint/check health, migrate old notes, generate
  reports, or update framework rules. This skill stays intentionally thin:
  workflow execution lives in system/workflows/ and reusable hard rules live in
  system/policies/.
triggers:
  - "inbox"
  - "暂存"
  - "todo"
  - "待办"
  - "给我记一个 todo"
  - "记一个待办"
  - "处理 inbox"
  - "ingest"
  - "入库"
  - "沉淀到 wiki"
  - "查询我的 wiki"
  - "检查 wiki"
  - "lint"
  - "迁移旧笔记"
  - "初始化知识库"
  - "生成 wiki 报告"
shortcuts:
  - "/wiki-todo"
  - "/wiki-ingest"
  - "/wiki-query"
  - "/wiki-lint"
  - "/wiki-migrate"
  - "/wiki-report"
tools:
  - read_file
  - search
  - edit_file
  - filesystem
  - shell
mutating: true
writes_pages: true
writes_to:
  - inbox/
  - sources/
  - wiki/
  - system/
  - todo.md
---

# LLM Wiki Skill

This skill is a bootstrapper and router. It should not contain full workflow bodies.

## Responsibilities

- Locate the wiki root.
- Load the minimum routing context.
- Choose exactly one primary workflow.
- Load only the workflow, policies, checklist, and domain rules needed for that request.
- Enforce non-negotiable policies.
- Keep query-only requests read-only.

## Wiki Root

Use the current working directory when it contains both:

- `AGENTS.md`
- `system/skills/llm-wiki/SKILL.md`

Otherwise, use the nearest parent with those files. If no root can be found, ask for the wiki root.

## Always Read First

1. `AGENTS.md`
2. `wiki/index.md`
3. `system/resolver.md`

For broad architecture, schema, migration, lint, or Obsidian work, also read the relevant files listed in `AGENTS.md`.

## Workflow Routing

Use `system/resolver.md` to classify the request, then read exactly the matching workflow file:

| Intent | Workflow file |
| --- | --- |
| `inbox`, `暂存`, capture-only material | `system/workflows/inbox.md` |
| `todo`, `待办`, create/update/complete/drop/block/schedule task | `system/workflows/task.md` |
| `ingest`, `入库`, `沉淀到 wiki`, `处理 inbox` | `system/workflows/ingest.md` |
| question about existing wiki knowledge | `system/workflows/query.md` |
| lint, health check, broken links, duplicate entities, schema drift | `system/workflows/lint.md` |
| setup, migration, historical import, many files | `system/workflows/migration.md` |
| briefing, pulse, task report, weekly review, learning review | `system/workflows/report.md` |

If a request mixes workflows, choose the smallest primary workflow that can satisfy the user. Only run additional workflows when the primary workflow explicitly requires them.

## Non-Negotiable Policies

Read the relevant policy file before acting:

- Source preservation: `system/policies/source-preservation.md`
- URL evidence: `system/policies/url-evidence.md`
- Task granularity: `system/policies/task-granularity.md`
- Task evidence: `system/policies/task-evidence.md`
- Ingest task impact: `system/policies/task-impact.md`
- Learning progress: `system/policies/learning-progress.md`

Hard rules:

- Inbox Capture writes only `inbox/`.
- Explicit Ingest is required before writing `sources/` or compiled `wiki/` pages.
- User-provided durable material must be preserved verbatim in `sources/` before compiled pages are written.
- Direct todo/task commands write to the task system, not `inbox/`.
- Query is read-only.
- Migration must not skip sample validation.
- Mutating workflows must update the active monthly log unless the workflow file explicitly says no log entry is needed.

## Domain Rules

Before writing a compiled page, read the nearest target-domain `AGENTS.md`.

Use `system/schema.md` for allowed `type`, `status`, task fields, source fields, and cross-domain rules.

## Audit Gates

For mutating workflows, read and satisfy the matching checklist:

- Ingest or query-derived update: `system/evals/ingest-checklist.md`
- Task capture/update: `system/evals/task-checklist.md`
- Lint/health check: `system/evals/lint-checklist.md`
- Migration: `system/workflows/migration.md` plus `system/templates/migration-report.md`

## Output

Use the output format defined by the selected workflow file.

If blocked by missing source material, ambiguous identity/entity merge, inaccessible files, or unsafe classification, stop and report `needs_user_review` instead of guessing.

## Anti-Patterns

- Do not paste workflow bodies into this skill.
- Do not load every workflow for ordinary requests.
- Do not treat generic model knowledge as wiki knowledge unless the user supplied, accepted, or applied it.
- Do not rewrite raw source material.
- Do not silently mutate files without the workflow's required log and audit output.
