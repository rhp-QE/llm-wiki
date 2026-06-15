# Wiki Index

This is the default entry point for querying an LLM-wiki framework instance.

## Operating Principle

Read this page first, then deep-read the most relevant domain pages. Do not scan the whole wiki unless the task is lint, migration, or broad synthesis.

## Domains

- [首页](首页.md): human-facing entry point for visual browsing.
- [地图](maps/地图.md): Obsidian-facing navigation maps.
- [People](people/README.md): people, relationships, aliases, and interaction context.
- [Self](self/README.md): compiled self-profile, identity snapshot, values, drivers, pressure patterns, and current direction.
- [Events](events/README.md): time-bound events, decisions, turning points, and episodes.
- [Themes](themes/README.md): long-running themes such as career, learning, relationships, health, money, creativity, and self-understanding.
- [Mental Models](models/README.md): thinking models, decision patterns, cognitive biases, and long-term reasoning frames.
- [Tech](tech/README.md): technical concepts, tools, repos, syntax, architecture, and implementation knowledge.
- [Learning](learning/README.md): learning paths, practice plans, progress, and review loops.
- [Writing](writing/README.md): ideas, drafts, published pieces, platform variants, and voice rules.
- [Craft](craft/README.md): engineering practices and experience patterns.
- [Q&A](qa/README.md): durable question-answer pages extracted from conversations or study sessions.
- [Reflections](reflections/README.md): principles, values, self-observations, and meta-rules.
- [Projects](projects/README.md): projects, experiments, product ideas, and ongoing initiatives.
- [Tasks](tasks/任务.md): canonical todos, task dashboard, due items, waiting items, and task history.
- [Reports](reports/README.md): briefings, pulse reports, task reports, weekly reviews, migration reports, and health checks.
- [Indexes](indexes/索引.md): retrieval indexes for entities, aliases, timelines, sources, and generated lookup surfaces.

## Fast Query Map

| User asks about | Read first |
| --- | --- |
| Identity, direction, self-profile, or long-term change | `self/`, then `themes/`, `reflections/`, `events/` |
| A person or relationship | `people/`, then linked `events/` and `themes/` |
| A life or project event | `events/`, then linked `people/`, `projects/`, and `themes/` |
| A technical concept | `tech/`, then `qa/` and `learning/` |
| A new thing learned | `learning/`, `tech/`, `qa/` |
| A writing task | `writing/`, then related `themes/`, `models/`, `craft/` |
| A principle or self-observation | `reflections/`, then linked `events/` |
| Todos, tasks, due items, or completion progress | `todo.md`, then `wiki/tasks/任务.md`, then specific task pages only when needed |
| A report, pulse, migration summary, or health check | `reports/`, then linked source domains |
| Fast lookup by entity, alias, source, or timeline | `wiki/indexes/索引.md`, then relevant generated index |
| Obsidian browsing, graph, visual map, or MOC | `wiki/首页.md`, `wiki/maps/` |
| Maintenance | `wiki/log.md`, `wiki/logs/`, `system/maintenance.md`, `system/evals/lint-checklist.md` |
| Schema, type, status, or domain rule changes | `system/schema.md`, `system/conventions.md`, nearest domain `AGENTS.md` |

## Current Status

- State: generic scaffold with no real source material and no real compiled personal pages.
- Instruction architecture: thin skill + resolver + `system/workflows/` + `system/policies/` + eval checklists.
- Source ingest: not started.
- Task dashboard: empty scaffold at `todo.md` and `wiki/tasks/任务.md`.
- Index architecture: scaffolded at `wiki/indexes/索引.md`.
- Self-profile domain: scaffolded at `wiki/self/`; create `wiki/self/自我画像.md` only after source-backed personal material exists.
- Obsidian entry: `wiki/首页.md` -> `wiki/maps/地图.md`.
- Next action: add raw materials under `inbox/` or `sources/`, then run explicit ingest when knowledge organization is desired.
