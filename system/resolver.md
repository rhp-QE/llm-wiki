# LLM Wiki Resolver

Use this file to decide which workflow and domain rules apply.

## Workflow Routing

| Intent | Workflow | Read |
| --- | --- | --- |
| "inbox", "暂存", "先放 inbox", "先记下来", pasted material without explicit ingest wording | Inbox Capture | `inbox/README.md` |
| "todo", "待办", "给我记一个 todo", "记一个待办", "添加任务", "完成任务", "关闭任务", "推迟任务" | Task Capture / Update with Task Granularity Gate | `wiki/tasks/AGENTS.md`, `system/evals/task-checklist.md` |
| "处理 inbox", "入库", "ingest", "沉淀这个", "沉淀到 wiki", "记录到 wiki" | Ingest | `system/skills/llm-wiki/SKILL.md`, target domain `AGENTS.md` |
| "分析我", "总结我", "复盘", "查一下我的 wiki" | Query | `wiki/index.md`, relevant pages |
| "检查 wiki", "lint", "断链", "重复实体" | Lint | `system/maintenance.md`, `system/evals/lint-checklist.md` |
| "迁移", "初始化", "导入旧笔记", "全量导入", "setup" | Setup / Migration | `system/lifecycle.md`, `system/templates/migration-report.md` |
| "生成报告", "briefing", "pulse", "task report", "周报" | Report | `system/lifecycle.md`, `wiki/reports/AGENTS.md` |
| "新增领域", "改 schema", "调整目录" | Schema change | `AGENTS.md`, `system/conventions.md`, `system/schema.md`, existing domain rules |
| "Obsidian", "图谱", "MOC", "可视化", "地图页" | Schema change or maintenance | `system/obsidian.md`, `wiki/首页.md`, `wiki/maps/AGENTS.md` |

## Domain Routing

| Signal | Domain |
| --- | --- |
| Person, nickname, family term, colleague, thinker | `wiki/people/` |
| Time-bound episode, decision, turning point | `wiki/events/` |
| Repeated life pattern or long-running concern | `wiki/themes/` |
| Thinking tool or bias | `wiki/models/` |
| Programming, tools, repos, architecture | `wiki/tech/` |
| Study progress, review, exercises | `wiki/learning/` |
| Article, script, content idea | `wiki/writing/` |
| Engineering practice from experience | `wiki/craft/` |
| Reusable question and answer | `wiki/qa/` |
| Principle, value, self-observation | `wiki/reflections/` |
| Ongoing initiative with state | `wiki/projects/` |
| Concrete todo, action item, reminder, next action, follow-up task | `wiki/tasks/` plus root `todo.md` |
| Diary, learning, project, or event material that records task progress, completion, missed routine, blocker, unblock, or new serious action | run Ingest Task Impact Pass, then `wiki/tasks/` plus root `todo.md` |
| Briefing, pulse, task report, migration report, health check output | `wiki/reports/` |

## Source Type Classification

Source type is based on content, not on delivery mechanism. A URL may point to an article, chat record, technical documentation, media transcript, project idea, Q&A, personal reflection, or another form. Do not classify a URL as `tech`, `learning`, or `article` merely because it is a URL.

## Original Payload Preservation

For explicit Ingest, original payload preservation is a hard gate before compiled wiki updates.

Rules:

1. If the user pasted text, uploaded file content, imported notes, diary, learning notes, chat excerpts, reflections, project notes, or other durable personal material, create or update a `sources/` file with `raw_preservation: verbatim`.
2. Put the exact payload in `## Raw Material`, preserving wording, line breaks, order, and fragment boundaries. Do not summarize, translate, normalize, clean up, omit, or rewrite inside that raw block.
3. Metadata, archival notes, AI extraction, and compiled summaries may be added outside `## Raw Material`.
4. If the material came from `inbox/`, preserve each grouped fragment verbatim with a fragment ID, capture timestamp when available, original inbox path, and original order before removing processed inbox files.
5. If the payload cannot be preserved, stop the ingest or keep a `sources/notes/` record with `status: needs-review`; do not update compiled pages as if preservation succeeded.
6. Direct lightweight todos or small task commands unrelated to durable personal growth, knowledge, projects, events, or sources are exempt from source archival and should remain in `todo.md` or the task system.

Do not infer `diary` from tone, emotion, first-person writing, daily routine, or words such as "today" alone. Model judgment should not decide whether a fragment is a diary.

Classify material as `diary` only when an explicit marker is present:

- `Type: diary`
- `source_type: diary`
- A title, filename, or command containing `diary` or `日记`
- User wording such as "这是一篇日记" or "按日记处理"

If a fragment lacks an explicit `diary` / `日记` marker, do not route it to `sources/diary/`. Use the explicit type if provided, otherwise preserve it as `source_type: note` with `status: needs-review` during Ingest and list the classification ambiguity in the final report.

## Task / Todo Capture

Use Task Capture / Update when the user explicitly asks to create, remember, update, complete, drop, block, wait on, schedule, or list a todo. This is a direct mutating workflow and does not require Ingest.

Rules:

1. Direct todo commands write to the task system and update the root `todo.md` dashboard when the active view changes. Do not write to `inbox/`. Do not write to `sources/` for direct lightweight tasks; create or update `sources/tasks/` only when the Task Evidence Gate says the task goal or update is source-worthy long-term evidence.
2. Apply the Task Granularity Gate before creating a canonical task page.
3. Create a canonical task page at `wiki/tasks/{YYYY-MM-DD}-{slug}.md` using `system/templates/task.md` only for serious tracked tasks.
4. Add or update a short dashboard item in `todo.md` under the appropriate section: Today, Next, Scheduled, Waiting / Blocked, Review Queue, or Recently Done. Canonical task items should link to task pages; lightweight one-off todos may be plain checkboxes.
5. If the user gives no actionable task text, ask for the task instead of creating a placeholder.
6. Parse status, priority, area, due date, scheduled date, and related pages only from explicit user wording or obvious existing wiki context. Do not invent these fields.
7. Resolve relative dates to absolute dates at capture time. If the current date matters, record the concrete date in the task page or dashboard note.
8. Use `source: direct user request YYYY-MM-DD` for direct canonical task pages. Use a source path when the task is extracted during Ingest.
9. Apply the Task Evidence Gate after granularity classification. If the task or update is source-worthy, preserve the raw user task/update text under `sources/tasks/` with `source_type: task_evidence` and link that path from the task page's `source_records`.
10. If a similar open task exists, update it or ask before creating a duplicate.
11. Completing, dropping, blocking, waiting, or rescheduling a canonical task must update both the task page and `todo.md`; also update task evidence only when the state change carries durable source-worthy context.
12. Querying todos is read-only: read the `todo.md` progress snapshot first, then `wiki/tasks/任务.md`, then relevant `wiki/tasks/` pages only when the snapshot is missing, stale, ambiguous, or the user asks for evidence; read linked project or learning pages only when needed.

Task Granularity Gate:

- `lightweight_todo`: small, one-step, one-off action with no due/scheduled date, no blocking/waiting state, no durable context, and no clear linked page. Keep it as a plain checkbox in `todo.md`; do not create a task page.
- `canonical_task`: serious tracked todo. Create/update a task page when the item is important, high priority, due/scheduled, multi-step, waiting/blocked, source-backed, report-worthy, review-worthy, or clearly linked to a project, learning path, event, theme, source, or report.
- `subtask`: if several todo items share the same goal and context, create/update one parent canonical task and put the small actions in its checklist or next step.
- `not_task`: vague ideas, open questions, saved links, references, and learning backlogs do not become todos unless the user asks for a concrete tracked action.

Prefer one parent task with a checklist over multiple tiny task pages when the items serve the same outcome. Split only when deadlines, owners, blocking states, domains, or user instructions differ.

Task Evidence Gate:

- Run this gate for every `canonical_task` and every update to an existing canonical task.
- Create or update a `sources/tasks/` record when the user explicitly marks the task as long-term, ongoing, recurring, routine, habit-forming, important, or review-worthy.
- Create or update a `sources/tasks/` record when the task/update records durable life, health, career, relationship, project, or learning evidence; a milestone; substantial progress; repeated practice; a missed routine with reason; a blocker or unblock condition; a failure; an abandonment reason; a completion outcome; or a weekly/monthly review.
- Create or update a `sources/tasks/` record when the user asks to preserve the task/update as evidence, says `入库`, `沉淀`, `记录到 wiki`, or links the task to a project, learning path, theme, event, report, or source whose future reconstruction depends on task execution history.
- Do not create task evidence sources for lightweight one-off todos, dashboard reordering, simple status moves, typo fixes, priority changes without context, or daily done/not-done checkboxes with no user-provided observation.
- For repeated check-ins, group compatible updates by task and month before writing `sources/tasks/`; preserve each raw user update as a fragment with timestamp, origin, and original wording.

Task vs other records:

- Open questions remain open questions unless there is a concrete next action.
- Project page `## Tasks` can hold project-local next actions, but serious tracked todos should also have `wiki/tasks/` pages.
- Learning `Practice Tasks` are learning exercises; promote one to `wiki/tasks/` only if the user wants it tracked as a todo and it passes the Task Granularity Gate.
- A saved link, future-reference item, or learning backlog item is not a todo unless the user says to do something with it.
- Source-worthy long-term task evidence belongs in `sources/tasks/`; the task page remains compiled operational state and should link back to the source record.

Task progress cache:

- Canonical task pages should cache latest completion state in frontmatter `progress_state`, `progress_percent`, `progress_updated`, and `progress_summary`, plus a `## Progress Snapshot` section.
- `todo.md` and `wiki/tasks/任务.md` should cache aggregate progress snapshots for fast task queries.
- Task Capture / Update, scheduled task review, task report, and weekly review should refresh the relevant progress cache.
- Do not infer exact percentages without explicit evidence, a checklist denominator, or a mechanical completion signal. Use `unknown` and a concise reason instead.

## Ingest Task Impact Pass

Run this pass during every Ingest after source preservation and before final reporting.

1. Read `todo.md` and `wiki/tasks/任务.md`; deep-read relevant task pages when titles, aliases, linked pages, tags, or source content overlap.
2. Detect task impact signals in diary, learning, project, reflection, event, and article/chat sources: completion, partial progress, checklist movement, missed routine, blocker, unblock condition, failure, abandonment reason, weekly/monthly review, or new serious action.
3. If a signal clearly maps to an existing canonical task, update that task's status/progress cache, log, source/source_records as appropriate, `todo.md`, and `wiki/tasks/任务.md`.
4. If a source creates a serious tracked action, apply the Task Granularity Gate and create/promote a task when warranted.
5. Add `## Related Tasks` or an equivalent task backlink section to compiled source-derived pages that affect tasks.
6. If the task match or outcome is ambiguous, list it under `needs_user_review` and do not invent completion.

## Skill / Learning Progress Classification

Use these fields only for skill-tree and learning-progress material. They apply to learning notes, technical concepts, practice records, and sources routed to `wiki/learning/` or `wiki/tech/`. They do not apply to objective facts such as diary events, people, relationships, factual life notes, or ordinary project chronology unless the material explicitly records learning, practice, or skill use.

Before updating a learning path, tech concept status, review queue, or practice task, classify:

- `learning_intent`: `active-study`, `future-reference`, `background-reading`, `review`, `archive-only`, or `unknown`.
- `learning_state`: `not-started`, `saved`, `skimmed`, `studied`, `practiced`, `applied`, `validated`, or `unknown`.
- `counts_as_progress`: `true` only when the source shows real study, practice, application, or validation.
- `priority`: `low`, `medium`, `high`, or `unknown` when the user gives a priority signal or the ambiguity must be explicit.
- `progress_evidence`: the evidence used for the classification.

Signal mapping:

- "正在学", "重点学习", "系统学习", or equivalent -> `learning_intent: active-study`; set `priority: high` when the wording emphasizes priority.
- "收藏", "以后可能学", "以后可能用得上" -> `learning_intent: future-reference`, `learning_state: saved`, `counts_as_progress: false`.
- "完全没学过", "只是觉得可能有用" -> `learning_state: not-started`, `counts_as_progress: false`.
- "泛读", "扫了一眼", "随便看看" -> `learning_intent: background-reading`, `learning_state: skimmed`, normally `counts_as_progress: false`.
- "做了练习", "跑了例子", "写了 demo" -> `learning_state: practiced`, `counts_as_progress: true`.
- "项目里用了", "工作里用了" -> `learning_state: applied`, `counts_as_progress: true`.
- "验证过", "多次使用", "能稳定复现" -> `learning_state: validated`, `counts_as_progress: true`.

Saved-only, not-started, and future-reference material may update `Saved For Later` or `Potential Wiki Targets`, but must not update `Recently Learned`, raise a tech page to `understood`, `applied`, or `validated`, or count as learning progress.

If the signal is ambiguous, use `learning_intent: unknown`, `learning_state: unknown`, `counts_as_progress: false`, and list the ambiguity in the final report or monthly log.

## URL / Link Ingest

When an inbox item is a URL or contains a URL:

1. During Inbox Capture, save only the URL, capture time, and user-provided context under `inbox/`; do not fetch, summarize, classify, or update `sources/` / `wiki/`.
2. During explicit Ingest, treat the URL as `delivery: url`, then try to preserve the source evidence under `sources/`. A URL-only submission is not the full original article/chat/page; save the URL and user context, then create a bounded evidence package unless full archival is justified.
3. If the content can be fetched or provided, create a bounded evidence package before writing compiled wiki pages. Do not default to storing the full linked content.
4. The evidence package should preserve metadata, user context, AI core extraction, key supported claims, selected short excerpts or anchors, coverage, and fetch status.
5. Treat `important`, `importent`, `非常重要`, `重要`, and equivalent user wording as importance markers. Important material should preserve core information carefully, especially chat records, decisions, reusable answers, and personal insights.
6. If important URL-linked or fetched material is short enough to archive without bloat, use a more detailed excerpt package or `archive_policy: full` when justified. If URL-linked or fetched content is very large, do not store the full content by default; store a core extraction capped at 500 Chinese characters plus selected evidence anchors, message IDs, timestamps, or section references. If the user pasted or uploaded the content itself, preserve that user-provided payload verbatim and put any bounded AI extraction outside `## Raw Material`.
7. Store full linked content only when it is short, uniquely important and not huge, unavailable elsewhere, user-provided, or explicitly requested by the user. If the user pasted or uploaded the linked content itself, preserve that user-provided payload verbatim under `## Raw Material`.
8. If fetching fails or network access is unavailable, preserve the URL plus user context with `fetch_status: failed` or `needs-review`; do not invent article contents.
9. Decide `content_form` and `source_type` from the fetched content, extracted evidence package, or explicit user context, not from the fact that it is a link.
10. Route by primary subject:
   - Chat logs or conversation exports -> `sources/chats/`, then `wiki/qa/`, `wiki/projects/`, `wiki/reflections/`, `wiki/tech/`, or other domains only if the content supports it.
   - Articles, documentation, essays, newsletters, gists, or posts -> usually `sources/articles/`, then route by subject.
   - Videos, podcasts, transcripts, screenshots, or media links -> `sources/media/`, then route by subject.
   - User learning notes attached to a URL -> classify skill-progress intent/state first. Actual study notes may go to `sources/learning/`, then `wiki/learning/`, `wiki/tech/`, and `wiki/qa/` when applicable. Saved-for-later links are reference material, not learning progress; route by content form and, if useful, add them only to `Saved For Later`.
   - Ambiguous or miscellaneous links -> `source_type: note` with `status: needs-review`.
11. Multiple inbox fragments from the same external link may be grouped into one URL-backed source if their context is compatible.
12. Link compiled pages back to the preserved source path and keep the original URL in source frontmatter.

## Inbox Ingest Aggregation

When explicitly ingesting `inbox/`, do not mechanically create one source per inbox fragment.

Required process:

1. Inventory all pending inbox files/fragments.
2. Determine explicit source type when present.
3. Group compatible fragments before writing `sources/`.
4. Preserve fragment boundaries inside the grouped source with fragment IDs, capture timestamps, and original inbox paths.
5. Only then update compiled `wiki/` pages from the grouped source evidence.

Allowed grouping examples:

- Multiple `Type: diary` / `日记` fragments for the same diary date -> one daily diary source.
- Multiple `Type: learning` fragments about the same language/topic and compatible origin -> one learning source or append to an existing source for that topic/session.
- Multiple fragments from the same external article/link -> one article source.

Forbidden grouping:

- Do not merge `diary` with `learning`.
- Do not merge diary fragments with article, chat, project, or technical learning fragments.
- Do not merge different explicit source types unless the user explicitly instructs that they are one source.
- Do not merge unrelated learning topics just because they arrived in the same inbox batch.

If grouping is uncertain, create separate source groups or preserve as `source_type: note` with `status: needs-review`.

## View Routing

Use `wiki/首页.md` and `wiki/maps/` for Obsidian navigation, MOC pages, and visual browsing.

These are view-layer pages, not source or domain truth. If a map needs factual detail, link to the owning domain page instead of duplicating the claim.

## Link Routing

Use path-qualified wikilinks when a short target could resolve to more than one file. This matters especially when a raw source and a compiled page share the same filename stem. Prefer linking to the compiled canonical page and keep source evidence as a plain path in `Sources`.

## URL Query Policy

Ordinary Query should not re-fetch live URLs. Query reads compiled wiki pages first, then local preserved sources when evidence or quotes matter. For URL-backed sources, use the archived source snapshot, extracted text, or URL metadata under `sources/`. Re-fetch a live URL only when the user explicitly asks to refresh/re-read the link, or when the local source is missing and the answer cannot be supported without the original content.

## Tie-Breaking

1. Prefer the primary subject, not the source format.
2. Prefer updating an existing page over creating a duplicate.
3. If one note touches multiple domains, archive once in `sources/`, then update multiple compiled pages.
4. If uncertain, create a `needs-review` note and list the ambiguity in the active monthly log under `wiki/logs/YYYY-MM.md`.

## Inbox Capture

Inbox Capture is the default for raw material when the user says `inbox`, `暂存`, or has not explicitly requested `ingest` / `入库` / `沉淀到 wiki`.

Rules:

- Write only to `inbox/`.
- Do not create or update `sources/`.
- Do not create or update compiled `wiki/` pages.
- Do not run domain enrichment or citation fixing.
- Do not clear the inbox item until a later explicit Ingest succeeds.
- Routine capture does not need a monthly log entry; the later Ingest logs the archived source and knowledge updates.

## Mutating Preflight

Before any ingest, schema change, migration sample, or query-derived update:

1. State the workflow and whether it is read-only or mutating. For `inbox` / `暂存`, state `Inbox Capture`, not Ingest.
2. State the source destination or confirm the source already exists.
3. State the target domains and nearest `AGENTS.md` files to read.
4. Check existing pages and aliases before creating new pages.
5. For complex or multi-domain ingest, use `system/templates/ingest-plan.md`.
6. For ingest, complete `system/evals/ingest-checklist.md` before final response.

For task capture or task update, read `wiki/tasks/AGENTS.md` and complete `system/evals/task-checklist.md` before final response.

## Incremental vs Stock

Use `Ingest` for a small number of new notes, links, or files.

Use `Setup / Migration` when:

- The user wants to initialize a wiki from old material.
- There are many historical files.
- Source folders or old systems need mapping.
- The task needs sample import before full import.
- The output should include a migration report.

Do not run full import before sample validation.
