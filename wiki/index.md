# Wiki Index

This is the default entry point for querying an LLM-wiki framework instance.

## Operating Principle

Read this page first, then deep-read the most relevant domain pages. Do not scan the whole wiki unless the task is lint, migration, or broad synthesis.

## Domains

- [[wiki/首页|首页]]: human-facing entry point for visual browsing.
- [[wiki/maps/地图|地图]]: Obsidian-facing navigation maps.
- [[wiki/people/README|People]]: people, relationships, aliases, and interaction context.
- [[wiki/events/README|Events]]: time-bound events, decisions, turning points, and episodes.
- [[wiki/themes/README|Themes]]: long-running themes such as career, learning, relationships, health, money, creativity, and self-understanding.
- [[wiki/models/README|Mental Models]]: thinking models, decision patterns, cognitive biases, and long-term reasoning frames.
- [[wiki/tech/README|Tech]]: technical concepts, tools, repos, syntax, architecture, and implementation knowledge.
- [[wiki/learning/README|Learning]]: learning paths, practice plans, progress, and review loops.
- [[wiki/writing/README|Writing]]: ideas, drafts, published pieces, platform variants, and voice rules.
- [[wiki/craft/README|Craft]]: engineering practices and experience patterns.
- [[wiki/qa/README|Q&A]]: durable question-answer pages extracted from conversations or study sessions.
- [[wiki/reflections/README|Reflections]]: principles, values, self-observations, and meta-rules.
- [[wiki/projects/README|Projects]]: projects, experiments, product ideas, and ongoing initiatives.
- [[wiki/tasks/任务|Tasks]]: canonical todos, task dashboard, due items, waiting items, and task history.
- [[wiki/reports/README|Reports]]: briefings, pulse reports, task reports, weekly reviews, migration reports, and health checks.

## Fast Query Map

| User asks about | Read first |
| --- | --- |
| Identity, direction, or long-term change | `themes/`, `reflections/`, `events/` |
| A person or relationship | `people/`, then linked `events/` and `themes/` |
| A life or project event | `events/`, then linked `people/`, `projects/`, and `themes/` |
| A technical concept | `tech/`, then `qa/` and `learning/` |
| A new thing learned | `learning/`, `tech/`, `qa/` |
| A writing task | `writing/`, then related `themes/`, `models/`, `craft/` |
| A principle or self-observation | `reflections/`, then linked `events/` |
| Todos, tasks, due items, or completion progress | `todo.md`, then `wiki/tasks/任务.md`, then specific task pages only when needed |
| A report, pulse, migration summary, or health check | `reports/`, then linked source domains |
| Obsidian browsing, graph, visual map, or MOC | `wiki/首页.md`, `wiki/maps/` |
| Maintenance | `wiki/log.md`, `wiki/logs/`, `system/maintenance.md`, `system/evals/lint-checklist.md` |
| Schema, type, status, or domain rule changes | `system/schema.md`, `system/conventions.md`, nearest domain `AGENTS.md` |

## Current Status

- State: generic scaffold with no real source material and no real compiled personal pages.
- Source ingest: not started.
- Task dashboard: empty scaffold at `todo.md` and `wiki/tasks/任务.md`.
- Obsidian entry: `wiki/首页.md` -> `wiki/maps/地图.md`.
- Next action: add raw materials under `inbox/` or `sources/`, then run explicit ingest when knowledge organization is desired.
