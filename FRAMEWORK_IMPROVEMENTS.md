# LLM Wiki Framework Improvement Backlog

## Functional Positioning

This framework is a local, Markdown-first operating memory for AI-assisted knowledge work.

Its job is to help a future agent and human user:

- Preserve raw evidence in `sources/`.
- Compile durable knowledge in `wiki/`.
- Keep raw evidence, user-stated facts, and AI inference explicitly separated.
- Manage serious tracked tasks through `todo.md` and `wiki/tasks/` without turning every tiny action into a permanent task page.
- Track learning as skill paths with saved-for-later material, active study, weak spots, practice, application, and validated knowledge.
- Support fast query, reports, reviews, and future agents through clear schema, indexes, logs, and checklists.

The framework should behave like a knowledge and task operating system: evidence-first, queryable, low-friction to capture, strict during ingest, and useful months later.

## Source Legend

- `Framework rule`: implemented operating constraint.
- `Backlog`: proposal for future iteration.
- `Optional`: useful only when the instance needs the capability.

## Implemented Framework Rules

| Area | Current direction | Status |
| --- | --- | --- |
| Inbox vs ingest | `inbox` / `暂存` is capture-only. Explicit `ingest` / `入库` / `沉淀到 wiki` is required for durable processing. | Implemented |
| Inbox aggregation | Multiple inbox fragments should be inventoried and grouped by compatible type/date/topic before source creation. | Implemented |
| Diary classification | Diary must be explicit through `diary` / `日记` markers or direct instruction. | Implemented |
| URL capture | During inbox capture, save only URL, capture time, and user context. | Implemented |
| URL ingest | During ingest, classify links by content form and primary subject. | Implemented |
| URL preservation | Do not store full linked content by default. Preserve metadata, core extraction, selected evidence anchors, coverage, and fetch status. | Implemented |
| Important content | Important material should preserve core content more carefully; very large important content should still avoid full archival by default. | Implemented |
| Learning progress | Skill-tree material distinguishes active study, saved-for-later, not-started, skimmed, practiced, applied, and validated states. | Implemented |
| Todo workflow | Direct todo commands do not go through inbox or ingest. | Implemented |
| Task granularity | Tiny one-off actions do not automatically create canonical task pages. | Implemented |
| Long-term task evidence | Some long-term tasks and execution history belong in `sources/tasks/`. | Implemented |
| Task progress cache | Task pages and task dashboards cache completion progress for fast task queries. | Implemented |
| Ingest task impact pass | Diary, learning, project, reflection, and event ingest should update related task status/progress caches when supported. | Implemented |
| Query behavior | Query should use local evidence packages first and avoid repeatedly fetching live URLs unless explicitly asked or local evidence is missing. | Implemented |

## Backlog

### 1. Knowledge And Identity Graph

| Idea | Why it helps | Possible implementation |
| --- | --- | --- |
| Entity registry and alias table | Prevents duplicate people, projects, concepts, and events. | Add `wiki/indexes/entities.md` or `system/indexes/entities.json` generated from frontmatter aliases and wikilinks. |
| Event timeline index | Makes "what happened over time" queries faster and more reliable. | Add generated `wiki/indexes/timeline.md` grouped by month, event type, people, project, and source. |
| Claims ledger | Separates stable claims from weak inference. | Add a `wiki/reflections/claims.md` page with claim, evidence, confidence, first seen, last updated, and counter-evidence. |
| Theme evolution pages | Long-running themes should show change over time instead of static summaries. | Add `## Timeline`, `## Current Pattern`, `## Evidence`, `## Open Questions`, and `## Changed My Mind` sections to major theme pages. |
| Decision log | Important decisions can disappear inside events or notes. | Add `wiki/decisions/` or `wiki/events/decisions.md` with decision, options, reason, date, related people/projects, and outcome review date. |

### 2. Task And Todo System

| Idea | Why it helps | Possible implementation |
| --- | --- | --- |
| Generated task indexes | Faster lookup by date, area, status, and priority. | Generate `wiki/tasks/by-status.md`, `wiki/tasks/by-area.md`, and `wiki/tasks/by-date/YYYY-MM.md` from task frontmatter. |
| Stale task review | Prevents open tasks from becoming invisible debt. | Add lint rule: open tasks older than N days without update go to Review Queue. |
| Lightweight todo aging | Lightweight items should not live forever in `todo.md`. | Add policy: lightweight todos older than N days are completed, dropped, promoted, or reviewed. |
| Recurring routines | Supports routines without duplicating task pages manually. | Add `wiki/tasks/routines.md` with recurrence, next due date, and generated dashboard entries. |
| Task dependency fields | Waiting/blocked states need clear cause and unblock condition. | Extend task template with optional `blocked_by`, `waiting_on`, and `unblock_condition`. |
| Task report template | Makes planning and review consistent. | Add `system/templates/task-report.md` and report workflow for today/weekly/overdue/waiting. |

### 3. Learning And Skill Tree

| Idea | Why it helps | Possible implementation |
| --- | --- | --- |
| Skill map per domain | Skill trees need visible nodes and prerequisites. | Add `wiki/learning/{domain}/skill-map.md` with nodes, prerequisites, current state, evidence, and next practice. |
| Mastery rubric | Prevents arbitrary status jumps like `understood` or `validated`. | Define rubric: saved -> skimmed -> studied -> practiced -> applied -> validated. |
| Weak spot index | Helps identify what needs review. | Generate `wiki/learning/weak-spots.md` from Q&A gaps, failed exercises, open questions, and low-confidence concept pages. |
| Review scheduling | Learning becomes durable only with spaced review. | Add `review_due`, `last_reviewed`, and `review_interval` to learning paths and important concept pages. |
| Practice evidence links | Skill progress should be backed by actual work. | Link concepts to exercises, code snippets, projects, interviews, or validated use cases. |
| Saved-for-later triage | Prevents saved links from becoming an infinite backlog. | Add recurring report: saved links older than N days -> keep, drop, promote, or archive-only. |

### 4. Retrieval And Query Efficiency

| Idea | Why it helps | Possible implementation |
| --- | --- | --- |
| Generated query indexes | Avoids scanning the whole wiki for common questions. | Generate indexes for people, events, projects, tasks, learning topics, sources, and reports. |
| Context packs | Gives agents a curated bundle for common query types. | Add `system/context-packs/` with routing files like `learning-report.md`, `task-review.md`, or `project-review.md`. |
| Source evidence manifest | Makes source lookup faster and avoids re-fetching links. | Generate `sources/manifest.md` or `sources/manifest.json`. |
| Alias resolver | Improves lookup when names, nicknames, typos, or shorthand vary. | Add `system/indexes/aliases.md` generated from aliases and canonical filenames. |
| Query confidence levels | Prevents weak inferred answers from being presented as fact. | Add response convention: `Supported by source`, `User-stated`, `Inference`, `Needs evidence`. |
| Report source map | Makes persisted reports reproducible. | Every persisted report should include pages read, source evidence, skipped areas, uncertainty, and follow-up tasks. |

### 5. Capture And Ingest Usability

| Idea | Why it helps | Possible implementation |
| --- | --- | --- |
| Capture templates by intent | Lowers friction while preserving classification quality. | Add templates for diary, learning, URL, chat, project idea, decision, reflection, and task. |
| Inbox dashboard | Helps users see pending material before ingest. | Add `inbox/INDEX.md` or a generated report with pending files, type guesses, age, and suggested grouping. |
| Ingest dry run | Gives visibility before mutating many files. | Add an optional plan-only phase: inventory, grouping, target pages, expected files, risks. |
| Sensitive content handling | Supports private, sensitive, and public-safe exports. | Add `sensitivity: private | sensitive | public-ok` and export rules. |
| Import quality tiers | Not all imported content deserves the same processing depth. | Use tiers: archive-only, extract-core, full-ingest, needs-review. |

### 6. Quality, Automation, And Maintenance

| Idea | Why it helps | Possible implementation |
| --- | --- | --- |
| Automated lint script | Manual checklist is good but easy to skip. | Add script to check frontmatter, broken wikilinks, invalid statuses, source paths, and task/dashboard consistency. |
| Generated indexes | Reduces drift between canonical pages and navigation pages. | Build lightweight scripts that regenerate task, source, alias, timeline, and learning indexes. |
| Schema versioning | Future migrations need to know which pages follow which version. | Add `schema_version` to page templates or maintain `system/schema-changelog.md`. |
| Framework decision log | Separates framework evolution from knowledge content. | Add `system/framework-decisions.md`. |
| Test fixtures | Makes future model behavior easier to validate. | Add example input/output fixtures for inbox capture, URL ingest, task granularity, learning progress, and report generation. |
| Commit discipline | The framework is code-like; changes need auditability. | Commit schema/process changes separately from content ingest when possible. |

## Recommended Roadmap

### P0: Make The Current System Reliable

- Add an automated lint script for wikilinks, source paths, frontmatter, task status, task dashboard consistency, and learning progress fields.
- Add generated source manifest and task indexes.
- Add task stale review and lightweight todo aging policy.
- Maintain the Task Evidence Gate for long-term task goals and execution history.
- Add report templates for task review and learning review.

### P1: Improve Knowledge Modeling

- Add entity/alias index.
- Add event timeline index.
- Add claims ledger.
- Add theme evolution sections to major themes.
- Add decision log.

### P2: Improve Learning Skill Tree

- Add per-domain skill maps.
- Add mastery rubric as a formal checklist.
- Add weak spot index.
- Add review scheduling fields.
- Link learning status to practice/project evidence.

### P3: Improve Scale And Experience

- Add context packs for common reports and queries.
- Add inbox dashboard and ingest dry-run output.
- Add sensitivity labels and export/report privacy rules.
- Add test fixtures for future AI behavior evaluation.

## Open Design Questions

- Should generated indexes be committed Markdown files, generated JSON files, or both?
- Should `wiki/indexes/` be a new wiki domain, or should generated indexes live under `system/indexes/`?
- Should task recurrence be modeled in Markdown only, or should a generated calendar-style view exist?
- What review cadence should source-backed long-term tasks use by default?
- Should claims be centralized in one ledger or remain distributed across themes/reflections with a generated index?
- What review cadence should be default for tasks, learning, links, and themes?

## How To Use This File

- Treat implemented items as framework constraints unless explicitly revised later.
- Treat backlog items as suggestions, not binding rules.
- When an idea is accepted, move it into the relevant schema, resolver, checklist, template, or domain `AGENTS.md`.
- After implementation, update the active monthly log and mark the item as implemented or superseded.
