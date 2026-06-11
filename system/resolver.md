# LLM Wiki Resolver

This file owns routing only. Workflow execution lives in `system/workflows/`; reusable hard rules live in `system/policies/`.

## Workflow Routing

| Intent signal | Primary workflow | Read next |
| --- | --- | --- |
| `inbox`, `暂存`, "先放 inbox", "先记下来", pasted material without explicit ingest wording | Inbox Capture | `system/workflows/inbox.md` |
| `todo`, `待办`, "给我记一个 todo", "记一个待办", add/update/complete/drop/block/wait/schedule task | Task Capture / Update | `system/workflows/task.md` |
| "处理 inbox", `ingest`, `入库`, `沉淀`, "沉淀到 wiki", "记录到 wiki" | Ingest | `system/workflows/ingest.md` |
| question about existing wiki knowledge | Query | `system/workflows/query.md` |
| "检查 wiki", `lint`, health check, broken links, duplicates, stale pages, schema drift | Lint | `system/workflows/lint.md` |
| "迁移", "初始化", "导入旧笔记", "全量导入", setup, many historical files | Setup / Migration | `system/workflows/migration.md` |
| "生成报告", briefing, pulse, task report, weekly review, learning review | Report | `system/workflows/report.md` |
| "新增领域", "改 schema", "调整目录", framework architecture | Schema / Framework Change | `AGENTS.md`, `system/conventions.md`, `system/schema.md`, relevant workflow/policy files |
| Obsidian, graph, MOC, map page, visual browsing | Obsidian / Map Maintenance | `system/obsidian.md`, `wiki/首页.md`, `wiki/maps/AGENTS.md` |

## Overrides

- `inbox` / `暂存` always means Inbox Capture unless the user explicitly says to ingest.
- Direct task commands always use Task Capture / Update, not Inbox Capture and not Ingest.
- Query is read-only unless the user explicitly asks to update files.
- Ingest requires explicit wording such as `ingest`, `入库`, `沉淀`, or `处理 inbox`.
- Migration is required for many historical files or external source systems; do not bypass sample validation.

## Workflow Boundaries

- Inbox Capture writes only `inbox/`.
- Task Capture / Update writes task surfaces and only writes `sources/tasks/` when the Task Evidence Gate fires.
- Ingest writes source evidence first, then compiled pages.
- Query does not mutate.
- Lint may fix safe mechanical issues and must report subjective issues for review.
- Report is read-only unless the user wants a persisted report or task-report cache refresh.

## Policy Routing

| Situation | Policy |
| --- | --- |
| User-provided durable material or source archival | `system/policies/source-preservation.md` |
| URL-only or URL-backed material | `system/policies/url-evidence.md` |
| Deciding whether a todo is lightweight/canonical/subtask/not-task | `system/policies/task-granularity.md` |
| Deciding whether a task/update needs `sources/tasks/` evidence | `system/policies/task-evidence.md` |
| Ingest source may affect task state/progress | `system/policies/task-impact.md` |
| Skill-tree, learning path, or tech mastery progress | `system/policies/learning-progress.md` |

## Domain Routing

| Signal | Domain |
| --- | --- |
| Person, nickname, family term, colleague, thinker | `wiki/people/` |
| Time-bound episode, decision, turning point | `wiki/events/` |
| Repeated pattern or long-running concern | `wiki/themes/` |
| Thinking tool or bias | `wiki/models/` |
| Programming, tools, repos, architecture | `wiki/tech/` |
| Study progress, review, exercises | `wiki/learning/` |
| Article, script, content idea | `wiki/writing/` |
| Engineering practice from experience | `wiki/craft/` |
| Reusable question and answer | `wiki/qa/` |
| Principle, value, self-observation | `wiki/reflections/` |
| Ongoing initiative with state | `wiki/projects/` |
| Concrete todo, action item, reminder, next action, follow-up task | `wiki/tasks/` plus `todo.md` |
| Briefing, pulse, task report, migration report, health check output | `wiki/reports/` |
| Obsidian navigation or visual browsing | `wiki/首页.md`, `wiki/maps/` |

## Tie-Breaking

1. Prefer the user's explicit command over inferred intent.
2. Prefer the primary subject, not source format.
3. Prefer updating an existing page over creating a duplicate.
4. Prefer the lighter workflow when mutation is not explicitly requested.
5. If uncertain and the choice would cause broad writes or entity merges, stop and list `needs_user_review`.
