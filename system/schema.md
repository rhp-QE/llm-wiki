# Schema Registry

This file owns shared types, statuses, frontmatter fields, and cross-domain link rules. It must not duplicate workflow bodies or policy bodies.

## Instruction Layers

| Layer | Owns |
| --- | --- |
| `system/skills/llm-wiki/SKILL.md` | thin bootstrap and routing |
| `system/resolver.md` | intent and domain routing |
| `system/workflows/` | executable workflow steps |
| `system/policies/` | reusable hard rules |
| `system/evals/` | audit checklists |
| domain `AGENTS.md` | page shape and local anti-patterns |
| `system/schema.md` | shared types, statuses, and fields |

Each domain `AGENTS.md` should include:

- `When To Use`
- `How To Update`
- `Page Location`
- `Frontmatter`
- `Body`
- `Anti-Patterns`

## Core Layers

| Layer | Role | Durable types |
| --- | --- | --- |
| `inbox/` | temporary capture queue | none |
| `sources/` | preserved raw evidence | `source` |
| `wiki/` | compiled knowledge and views | wiki types below |
| `system/` | rules, templates, evals, scripts | operational docs |

## Source Schema

Allowed `source_type` values:

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

Allowed source statuses:

- `new`
- `ingested`
- `ignored`
- `needs-review`
- `example`

Suggested source directories:

- `sources/articles/`
- `sources/books/`
- `sources/chats/`
- `sources/diary/`
- `sources/learning/`
- `sources/media/`
- `sources/notes/`
- `sources/tasks/`

Common source fields:

- `type: source`
- `source_type`
- `title`
- `origin`
- `created`
- `captured`
- `status`
- `tags`

URL-backed source fields:

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

Learning/source progress fields:

- `learning_intent: active-study | future-reference | background-reading | review | archive-only | unknown`
- `learning_state: not-started | saved | skimmed | studied | practiced | applied | validated | unknown`
- `counts_as_progress: true | false`
- `priority: low | medium | high | unknown`
- `progress_evidence: user-stated | source-note | exercise | project-use | repeated-use | assessment | inference | none`

Task evidence fields:

- `task_page`
- `task_event: created | check-in | execution-log | milestone | missed | blocked | unblocked | review | completed | dropped`
- `task_evidence_scope: goal | routine | habit | project | learning | life | review | other`
- `task_impact: none | possible | updates-existing | creates-task | needs-review`
- `related_tasks: []`

Use policies for behavior:

- Source preservation: `system/policies/source-preservation.md`
- URL evidence: `system/policies/url-evidence.md`
- Learning progress: `system/policies/learning-progress.md`
- Task evidence: `system/policies/task-evidence.md`

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
| `wiki/indexes/` | `index`, `entity_index`, `timeline_index`, `source_index`, `alias_index` |
| `wiki/logs/` | `monthly_log` |
| `wiki/首页.md` | `home` |
| `wiki/log.md` | `log_index` |

## Status Values

General compiled statuses:

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

Domain-specific statuses:

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
- Indexes: `active`, `draft`, `stale`, `retired`
- Logs: `active`, `closed`

Use `example` only for scaffold or demo pages that must not count as real source evidence, real learning progress, or validated knowledge.

## Task Schema

Canonical task fields:

- `type: task`
- `title`
- `status: open | doing | waiting | scheduled | blocked | done | dropped`
- `priority: low | medium | high | unknown`
- `area: life | learning | project | career | wiki | health | relationship | finance | other`
- `progress_state: not-started | in-progress | partial | waiting | blocked | done | dropped | unknown`
- `progress_percent: 0-100 | unknown`
- `progress_updated`
- `progress_summary`
- `due`
- `scheduled`
- `created`
- `updated`
- `completed`
- `source`
- `evidence_policy: none | task-page-only | source-backed`
- `source_records: []`
- `linked_pages: []`
- `tags: []`

Task behavior lives in:

- `system/workflows/task.md`
- `system/policies/task-granularity.md`
- `system/policies/task-evidence.md`
- `system/policies/task-impact.md`

## Index Schema

Index pages are retrieval accelerators, not sources of truth.

Common index fields:

- `type: index | entity_index | timeline_index | source_index | alias_index`
- `title`
- `status: active | draft | stale | retired`
- `scope`
- `generated: true | false`
- `updated`
- `sources: []`
- `tags: []`

Index pages should link to canonical pages and source paths. They should not duplicate long summaries.

## Report Schema

Allowed `report_type` values:

- `briefing`
- `pulse`
- `ingest_report`
- `task_report`
- `weekly_review`
- `learning_review`
- `migration`
- `health_check`

## Link Rules

- Use `[[wikilink]]` for relationships between compiled wiki pages.
- Prefer path-qualified wikilinks when a target stem could be ambiguous.
- Keep source evidence as plain paths in `Sources` sections unless the source is intentionally part of the Obsidian graph.
- Map pages are for visual navigation.
- Index pages are for fast retrieval and generated or semi-generated lookup.

## Lint Expectations

Schema lint should check:

- Frontmatter exists on durable wiki pages.
- `type` matches the owning domain.
- Status fields use allowed values.
- Domain `AGENTS.md` files contain the required instruction headings.
- Workflow/policy files exist and `SKILL.md` remains thin.
- Learning progress fields are used only when learning progress is being tracked.
- Saved-for-later or not-started material is not counted as real learning progress.
- Task pages have valid task status, priority, area, evidence policy, and dashboard consistency.
- Source-backed tasks have existing `source_records`.
- Short wikilinks are not ambiguous across layers.
- Example pages are clearly marked as examples.
