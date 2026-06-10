# Schema Registry

This file is the shared schema registry for linting and agent execution. Domain `AGENTS.md` files still own page-specific body shape and local anti-patterns; this file owns cross-domain `type`, `status`, and link rules.

## Instruction Shape

Each domain `AGENTS.md` should answer:

- `When To Use`: what belongs in the domain.
- `How To Update`: the minimum execution steps before writing.
- `Page Location`: canonical path pattern.
- `Frontmatter`: required fields and allowed status values.
- `Body`: expected headings.
- `Anti-Patterns`: common mistakes to avoid.

If a domain file is missing one of these headings, use `system/resolver.md` for routing and the nearest template under `system/templates/` for write shape, then list the schema gap in lint output.

## Core Layers

| Layer | Role | Allowed durable types |
| --- | --- | --- |
| `inbox/` | temporary capture queue | none; not durable knowledge |
| `sources/` | preserved raw evidence | `source` |
| `wiki/` | compiled knowledge and views | domain types below |
| `system/` | rules, templates, evals | operational docs, not wiki knowledge |

## Source Schema

Allowed source types:

- `article`
- `book`
- `chat`
- `diary`
- `learning`
- `media`
- `note`
- `idea`
- `project`
- `qa`
- `reflection`
- `task_evidence`
- `other`

Suggested source directories:

- `sources/articles/`: articles, documentation pages, essays, newsletters, gists, posts
- `sources/chats/`: chat records, conversation exports, discussion excerpts
- `sources/media/`: media links, transcripts, screenshots, podcasts, video notes
- `sources/learning/`: user learning notes and study sessions
- `sources/tasks/`: source-worthy long-term task goals, check-ins, milestones, failures, blockers, reviews, and completion outcomes
- `sources/notes/`: ambiguous or miscellaneous material needing review

Allowed source statuses:

- `new`
- `ingested`
- `ignored`
- `needs-review`
- `example`

Use `example` only for scaffold or demo sources that should not count as real user history or real learning progress.

Optional URL-backed source fields:

- `delivery: url`
- `original_payload: user-provided | inbox | imported-file | url-only | fetched | manual`
- `raw_preservation: verbatim | evidence-package | metadata-only`
- `content_form: article | chat | thread | documentation | gist | newsletter | video | podcast | transcript | post | other`
- `original_url`
- `accessed`
- `fetch_status: fetched | partial | failed | manual`
- `archive_policy: metadata-only | excerpted | full`
- `coverage: full | partial | metadata-only`
- `importance: normal | important | very-important`
- `preservation_limit`
- `primary_subject`
- `target_domains`
- `learning_intent: active-study | future-reference | background-reading | review | archive-only | unknown`
- `learning_state: not-started | saved | skimmed | studied | practiced | applied | validated | unknown`
- `counts_as_progress: true | false`
- `priority: low | medium | high | unknown`
- `progress_evidence: user-stated | source-note | exercise | project-use | repeated-use | assessment | inference | none`
- `task_page`
- `task_event: created | check-in | execution-log | milestone | missed | blocked | unblocked | review | completed | dropped`
- `task_evidence_scope: goal | routine | habit | project | learning | life | review | other`

Original payload preservation is a hard source gate. When a source comes from user-provided pasted text, uploaded file content, imported notes, inbox captures, diary, learning notes, chat excerpts, reflections, project notes, or other durable personal material, use `raw_preservation: verbatim` and preserve the exact payload in `## Raw Material` before compiled wiki updates. Preserve wording, line breaks, order, and fragment boundaries. Do not summarize, translate, normalize, clean up, omit, or rewrite inside the raw block. Minimal metadata, archival notes, AI extraction, and compiled summaries may appear outside the raw block.

Direct lightweight todos or small task commands unrelated to durable personal growth, knowledge, projects, events, or sources are exempt from source archival and should remain in the task system.

Long-term task evidence is the exception to the direct-task shortcut. If a task or task update is source-worthy under the Task Evidence Gate, create or update a `sources/tasks/` record with `source_type: task_evidence` before or alongside updating the compiled task page. This keeps durable task goals and execution history rebuildable from sources while keeping lightweight operational state out of `sources/`.

A URL is an origin/delivery mechanism, not a source type and not a domain route. Classify URL-backed sources by their fetched or user-provided content. Do not assume a link is `tech`, `learning`, or `article` without inspecting the content or user context.

URL-backed sources should not default to storing a full webpage. A URL-only submission has `original_payload: url-only`, not `raw_preservation: verbatim` for the linked page. Prefer a bounded evidence package: metadata, user context, AI core extraction, key supported claims, selected short excerpts or anchors, and fetch status. Use `archive_policy: full` only when the content is short, uniquely important, unavailable elsewhere, user-provided, or explicitly requested by the user. If the user pasted or uploaded the linked content itself, preserve that user-provided payload verbatim even if the fetched webpage would otherwise be excerpted. Ordinary Query should use this local evidence package first to avoid repeated live fetches.

Importance markers such as `important`, `importent`, `非常重要`, `重要`, or equivalent user wording should set `importance: important` or `importance: very-important`. Important material should preserve the core information as carefully as possible, especially for chats and decisions. If URL-linked or fetched content is very large, do not store the full content by default; use `archive_policy: excerpted` and `preservation_limit: core-extraction-500-zh-chars` with selected evidence anchors. If the user pasted or uploaded the content itself, preserve that user-provided payload verbatim and put any bounded AI extraction outside `## Raw Material`.

## Skill Progress Schema

Use skill-progress fields only for skill trees, learning paths, and technical mastery tracking. This includes `source_type: learning`, sources routed to `wiki/learning/` or `wiki/tech/`, and compiled learning or technical concept pages when they represent the user's learning progress.

Do not apply these fields to objective fact domains such as diary entries, events, people, relationships, factual life notes, or ordinary project chronology unless the material explicitly records learning, practice, or skill use.

Allowed `learning_intent` values:

- `active-study`: the user is intentionally studying the topic now or says it is a focus.
- `future-reference`: the user saved material that may be useful later.
- `background-reading`: the user skimmed, browsed, or read broadly without committing to study.
- `review`: the user is revisiting known material.
- `archive-only`: keep the material as reference, but do not treat it as a learning plan.
- `unknown`: intent is unclear and should not be guessed.

Allowed `learning_state` values:

- `not-started`: the user has not learned the topic yet.
- `saved`: material was captured for later use.
- `skimmed`: the user glanced at or lightly read the material.
- `studied`: the user actively studied or took notes.
- `practiced`: the user did exercises, examples, or drills.
- `applied`: the user used the knowledge in a real task or project.
- `validated`: the user has verified the knowledge through repeated use, tests, review, or reliable assessment.
- `unknown`: state is unclear and should not be guessed.

`counts_as_progress` is `true` only when the source shows actual learning, practice, application, or validation. It is `false` for saved-only links, future-reference material, not-started topics, archive-only material, and generic external content with no evidence that the user engaged with it.

Use `priority` to record the user's emphasis. `active-study` plus words like "重点学习" should usually be `priority: high`; saved-for-later material should default to `low` or `medium` unless the user says otherwise. Use `unknown` or omit the field when there is no priority signal.

Use `progress_evidence` to explain why a state was assigned. Prefer explicit evidence over inference. If the only evidence is a model guess, use `learning_state: unknown` and `counts_as_progress: false`.

Mapping examples:

- "正在重点学习 X" -> `learning_intent: active-study`, `priority: high`; choose `learning_state` from evidence.
- "收藏这个链接，以后可能学" -> `learning_intent: future-reference`, `learning_state: saved`, `counts_as_progress: false`.
- "完全没学过，但觉得以后有用" -> `learning_intent: future-reference`, `learning_state: not-started`, `counts_as_progress: false`.
- "泛读 / 扫了一眼" -> `learning_intent: background-reading`, `learning_state: skimmed`, `counts_as_progress: false` unless the user states a durable takeaway.
- "练过 / 用过 / 项目里用了" -> `learning_state: practiced` or `applied`, `counts_as_progress: true`.
- "验证过 / 多次使用 / 能稳定复现" -> `learning_state: validated`, `counts_as_progress: true`.

## Wiki Types

| Domain | Allowed `type` |
| --- | --- |
| `wiki/people/` | `person` |
| `wiki/events/` | `event` |
| `wiki/themes/` | `theme` |
| `wiki/models/` | `mental_model` |
| `wiki/tech/` | `concept`, `syntax`, `repo`, `pattern`, `debug_case` |
| `wiki/learning/` | `learning_path` |
| `wiki/writing/` | `writing_idea`, `article`, `voice` |
| `wiki/craft/` | `craft_practice` |
| `wiki/qa/` | `qa` |
| `wiki/reflections/` | `reflection` |
| `wiki/projects/` | `project` |
| `wiki/tasks/` | `task`, `task_index` |
| `wiki/reports/` | `report` |
| `wiki/maps/` | `map`, `map_index` |
| `wiki/logs/` | `monthly_log` |
| `wiki/首页.md` | `home` |
| `wiki/log.md` | `log_index` |

## Status Values

General compiled status values:

- `new`
- `learning`
- `emerging`
- `active`
- `stable`
- `validated`
- `partial`
- `needs-review`
- `retired`
- `example`

Domain-specific status values:

- People: `active`, `historical`, `unknown`
- Tech: `learning`, `understood`, `applied`, `validated`, `example`
- Learning paths: `learning`, `active`, `paused`, `validated`, `retired`, `example`
- Q&A: `answered`, `partial`, `open`, `example`
- Reflections: `emerging`, `stable`, `challenged`, `needs-review`
- Projects: `idea`, `active`, `paused`, `done`, `abandoned`
- Tasks: `open`, `doing`, `waiting`, `scheduled`, `blocked`, `done`, `dropped`
- Task indexes: `active`, `draft`, `retired`
- Writing: `idea`, `draft`, `final`, `published`, `retired`
- Reports: `draft`, `final`
- Maps: `active`, `draft`, `retired`
- Logs: `active`, `closed`

Use `example` only for scaffold pages generated as demos. Example pages must explicitly say that they are not real personal progress.

## Task Schema

Use task fields for concrete personal todos and action items. A task is a commitment or action to track, not merely a source note, open question, saved link, or vague idea.

Canonical task records live under `wiki/tasks/`. The root `todo.md` is the active dashboard. Serious tracked tasks should link to canonical task pages; lightweight one-off todos may live only as plain checkboxes in `todo.md`.

Task frontmatter should use:

- `type: task`
- `title`
- `status: open | doing | waiting | scheduled | blocked | done | dropped`
- `priority: low | medium | high | unknown`
- `area: life | learning | project | career | wiki | health | relationship | finance | other`
- `due`
- `scheduled`
- `created`
- `updated`
- `completed`
- `source`
- `evidence_policy: none | task-page-only | source-backed`
- `source_records: []`
- `linked_pages: []`

Rules:

- A direct command such as `给我记一个 todo` creates or updates a task, not an inbox note and not an ingest.
- Do not create an empty task when the user provides no action. Ask for the missing task text.
- Do not invent priority, due date, or linked pages. Use `unknown`, blank fields, or `Needs review` when absent.
- Resolve relative dates such as `今天`, `明天`, or `下周三` to absolute dates at capture time.
- A task must have evidence: direct user request, an existing source path, or a linked wiki page that explains why the task exists.
- Every canonical task must declare an `evidence_policy`. Use `task-page-only` for ordinary canonical tasks whose direct request or linked page is enough. Use `source-backed` when the Task Evidence Gate says the goal or execution history is durable source evidence. Use `none` only for example or placeholder-free operational pages that should not count as real personal evidence.
- Source-backed tasks must list existing `sources/tasks/` paths in `source_records`. If the source-worthy raw user update cannot be preserved yet, do not pretend the task is fully sourced; mark the missing source under `Needs review` or the task log.
- Open questions are not automatically tasks. Convert them only when there is a concrete action.
- Saved links and learning backlog items are not tasks unless the user explicitly asks to do something with them.
- Completion, cancellation, deferral, or priority changes must update both the task page and `todo.md`.

## Task Granularity Gate

Before creating a canonical `wiki/tasks/` page, classify the candidate item:

- `lightweight_todo`: small, one-step, one-off action; no explicit due/scheduled date; no waiting or blocked state; no durable context/history; no clear relationship to a project, learning path, event, theme, source, or report. Store as a plain checkbox in `todo.md` and do not create a task page.
- `canonical_task`: serious tracked todo. Create or update a task page when the item is important, high priority, due/scheduled, multi-step, waiting/blocked, source-backed, review-worthy, report-worthy, or linked to a project, learning path, event, theme, source, or report.
- `subtask`: small action that belongs to a larger tracked outcome. Add it to the parent task's checklist or next step instead of creating a separate task page.
- `not_task`: vague idea, open question, saved link, reference, or learning backlog item without a concrete action.

Multiple todos should map to one canonical task when they share the same goal, context, and review surface. Split them into separate canonical tasks only when they have different deadlines, owners, blocking states, domains, or the user explicitly asks for separate tracking.

If the granularity is ambiguous, prefer the lighter representation unless that would lose a deadline, dependency, source-backed action, or important review context. Ask the user when the wrong granularity would be harmful.

## Task Evidence Gate

After the Task Granularity Gate classifies an item as `canonical_task` or `subtask`, decide whether the task event is source-worthy.

Create or update a `sources/tasks/` record when any of these are true:

- The user explicitly calls the task long-term, ongoing, recurring, routine, habit-forming, important, or something to review later.
- The task records durable life, health, career, relationship, project, or learning evidence rather than a transient operational step.
- The update is a meaningful execution sample: milestone reached, substantial progress, repeated practice, missed routine with reason, blocker discovered, unblock condition resolved, failure, abandonment reason, completion outcome, or weekly/monthly review.
- The task is linked to a project, learning path, theme, event, report, or source and future agents would need the execution history to reconstruct what happened.
- The user asks to `入库`, `沉淀`, `记录到 wiki`, `记为证据`, or otherwise preserve the task update as evidence.

Do not create or update `sources/tasks/` for:

- Lightweight one-off todos.
- Mechanical status moves such as `open -> doing`, dashboard reordering, typo fixes, or priority changes with no durable context.
- Daily checkboxes that only say done/not done with no user-provided raw observation, unless the task is explicitly configured to preserve sampled check-ins.
- Agent guesses, inferred outcomes, or synthesized reviews that do not preserve user-provided evidence or cite existing source-backed records.

For repeated check-ins on the same long-term task, prefer a monthly grouped source such as `sources/tasks/YYYY/YYYY-MM-{task-slug}.md` or a dated event source such as `sources/tasks/YYYY/YYYY-MM-DD-{task-slug}-{event}.md`. Preserve each user-provided update as a fragment with timestamp, origin, and original wording.

## Link Rules

- Use `[[wikilink]]` for relationships between compiled wiki pages.
- Prefer path-qualified wikilinks when a target stem exists in more than one layer, especially when `sources/` and `wiki/` share a filename.
- Keep source evidence as plain paths in `Sources` sections unless the source file is intentionally part of the Obsidian graph.
- Query should use local source snapshots for URL-backed evidence before any live re-fetch.
- Map pages should link to canonical domain pages and avoid linking `README.md`, `AGENTS.md`, `index.md`, or `log.md`.

## Lint Expectations

Schema lint should check:

- Frontmatter exists on durable wiki pages.
- `type` matches the owning domain.
- `status` is allowed by this registry or the nearest domain `AGENTS.md`.
- Skill-tree learning material records `learning_intent`, `learning_state`, and `counts_as_progress` when the source or page could otherwise be confused with real progress.
- Saved-for-later or not-started material is not counted as `Recently Learned`, `applied`, or `validated`.
- Task pages have valid task status, priority, area, evidence, and dashboard consistency with `todo.md`.
- Source-backed long-term tasks have `evidence_policy: source-backed`, existing `source_records`, and no missing task evidence that should have been archived under `sources/tasks/`.
- Lightweight todos and mechanical task state changes do not create source records.
- Short wikilinks are not ambiguous across `sources/` and `wiki/`.
- Example pages are clearly marked as examples and excluded from real progress claims.
