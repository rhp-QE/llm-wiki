# Wiki Index

This is the default entry point for querying the personal LLM-wiki.

## Operating Principle

Read this page first, then deep-read the most relevant domain pages. Do not scan the whole wiki unless the task is a lint, migration, or broad synthesis.

## Domains

- [[wiki/首页|首页]]: human-facing entry point for visual browsing.
- [[wiki/maps/地图|地图]]: Obsidian-facing 内容地图 for cross-domain navigation.
- [[wiki/people/README|People]]: family, friends, colleagues, mentors, important relationships, and aliases.
- [[wiki/events/README|Events]]: life events, work changes, turning points, decisions, and memorable episodes.
- [[wiki/themes/README|Themes]]: long-running personal themes such as career, learning, relationships, health, money, creativity, and self-understanding.
- [[wiki/models/README|Mental Models]]: thinking models, decision patterns, cognitive biases, and long-term reasoning frames.
- [[wiki/tech/README|Tech]]: technical concepts, tools, repos, syntax, architecture, and implementation knowledge.
- [[wiki/learning/README|Learning]]: learning paths, practice plans, progress, and review loops.
- [[wiki/writing/README|Writing]]: ideas, drafts, published pieces, platform variants, and voice rules.
- [[wiki/craft/README|Craft]]: personal engineering practices and experience patterns.
- [[wiki/qa/README|Q&A]]: durable question-answer pages extracted from conversations or study sessions.
- [[wiki/reflections/README|Reflections]]: principles, values, self-observations, and meta-rules.
- [[wiki/projects/README|Projects]]: projects, experiments, product ideas, and ongoing initiatives.
- [[wiki/tasks/任务|Tasks]]: canonical personal todos, task dashboard, due items, waiting items, and task history.
- [[wiki/reports/README|Reports]]: briefing, pulse, task report, weekly review, migration report, and health check output.

## Fast Query Map

Use these routing hints:

| User asks about | Read first |
| --- | --- |
| "我是谁 / 我在追求什么 / 我的变化" | `themes/`, `reflections/`, `events/` |
| A person or relationship | `people/`, then linked `events/` and `themes/` |
| A life event | `events/`, then linked `people/` and `themes/` |
| A technical concept | `tech/`, then `qa/` and `learning/` |
| A new thing learned | `learning/`, `tech/`, `qa/` |
| A writing task | `writing/`, then related `themes/`, `models/`, `craft/` |
| A personal principle | `reflections/`, then linked `events/` |
| Todos, tasks, due items, completion progress, or "我今天该做什么" | `todo.md` Progress Snapshot, then `wiki/tasks/任务.md`, then specific task pages only when needed |
| A report, pulse, migration summary, or health check result | `reports/`, then linked source domains |
| Obsidian browsing, graph, visual map, or MOC | `wiki/首页.md`, `wiki/maps/` |
| Maintenance | `wiki/log.md`, `wiki/logs/`, `system/maintenance.md`, `system/evals/lint-checklist.md` |
| Schema, type, status, or domain rule changes | `system/schema.md`, `system/conventions.md`, nearest domain `AGENTS.md` |

## Current Status

- State: active scaffold with real diary, task, learning, and URL-reference ingest
- Full personal source ingest: not started
- First real diary ingest: `sources/diary/2026/2026-06-09-beijing-work-wiki-career.md` -> `wiki/events/2026-06-09-beijing-work-wiki-career.md`
- Second diary ingest: `sources/diary/2026/2026-06-10-byte-ios-llm-wiki-xiaoheihe.md` -> `wiki/events/2026-06-10-byte-ios-llm-wiki-xiaoheihe.md`
- Example archived path: `sources/learning/go/2026-06-09-go-defer-example.md` -> `wiki/tech/go/syntax/defer.md`; the original `inbox/example-go-defer.md` drop was cleared after ingest.
- First real learning sample: `sources/learning/cpp/2026-06-09-cpp-template-explicit-instantiation.md` -> `wiki/tech/cpp/templates/explicit-instantiation.md`
- Saved LLM/Agent references: `sources/articles/2026-06-11-karpathy-llm-wiki.md`, `sources/articles/2026-06-11-agent-workflow-feishu-links.md` -> `wiki/tech/llm/`
- Obsidian entry: `wiki/首页.md` -> `wiki/maps/地图.md`
- Task dashboard: `todo.md` -> `wiki/tasks/任务.md`
- Next action: add more raw notes, then run `llm-wiki Ingest` to continue building durable learning paths
