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
- `other`

Suggested source directories:

- `sources/articles/`: articles, documentation pages, essays, newsletters, gists, posts
- `sources/chats/`: chat records, conversation exports, discussion excerpts
- `sources/media/`: media links, transcripts, screenshots, podcasts, video notes
- `sources/learning/`: user learning notes and study sessions
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

A URL is an origin/delivery mechanism, not a source type and not a domain route. Classify URL-backed sources by their fetched or user-provided content. Do not assume a link is `tech`, `learning`, or `article` without inspecting the content or user context.

URL-backed sources should not default to storing a full webpage. Prefer a bounded evidence package: metadata, user context, AI core extraction, key supported claims, selected short excerpts or anchors, and fetch status. Use `archive_policy: full` only when the content is short, uniquely important, unavailable elsewhere, user-provided, or explicitly requested by the user. Ordinary Query should use this local evidence package first to avoid repeated live fetches.

Importance markers such as `important`, `importent`, `非常重要`, `重要`, or equivalent user wording should set `importance: important` or `importance: very-important`. Important material should preserve the core information as carefully as possible, especially for chats and decisions. If the linked or pasted content is very large, do not store the full content by default; use `archive_policy: excerpted` and `preservation_limit: core-extraction-500-zh-chars` with selected evidence anchors.

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
- Writing: `idea`, `draft`, `final`, `published`, `retired`
- Reports: `draft`, `final`
- Maps: `active`, `draft`, `retired`
- Logs: `active`, `closed`

Use `example` only for scaffold pages generated as demos. Example pages must explicitly say that they are not real personal progress.

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
- Short wikilinks are not ambiguous across `sources/` and `wiki/`.
- Example pages are clearly marked as examples and excluded from real progress claims.
