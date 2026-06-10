# LLM Wiki Framework Improvement Backlog

## Functional Positioning

This framework is a local, Markdown-first personal operating memory for an AI-assisted life and learning system.

Its job is not only to store notes. It should help a future AI and the user:

- Reconstruct what the user did, decided, learned, practiced, postponed, and cared about.
- Build a durable picture of who the user is through events, people, projects, values, preferences, constraints, and recurring patterns.
- Preserve evidence in `sources/`, compile useful knowledge in `wiki/`, and keep the difference between raw evidence, user-stated facts, and AI inference explicit.
- Manage serious personal tasks through `todo.md` and `wiki/tasks/`, without turning every tiny action into a permanent task page.
- Track learning as a skill tree, including saved-for-later material, active study, weak spots, practice, application, and validated knowledge.
- Support fast query, reports, reviews, and future agents through clear schema, indexes, logs, and checklists.

The framework should behave like a personal knowledge and task operating system: evidence-first, queryable, low-friction to capture, strict during ingest, and useful months later.

## Source Legend

- `User-originated`: direction, constraint, or requirement explicitly raised by the user in prior framework design discussion.
- `AI-proposed`: improvement suggested by the AI for future iteration.
- `Mixed`: user direction plus AI refinement or implementation detail.

## Current User-Originated Design Direction

| Area | Source | Current direction | Status |
| --- | --- | --- | --- |
| Inbox vs ingest | User-originated | `inbox` / `暂存` is capture-only. It should not archive sources or organize wiki pages. Explicit `ingest` / `入库` / `沉淀到 wiki` is required for durable processing. | Implemented |
| Inbox aggregation | User-originated | Multiple inbox fragments should be inventoried and grouped by compatible type/date/topic before source creation. Do not create one source per fragment by default. | Implemented |
| Diary classification | User-originated | Diary must be explicit through `diary` / `日记` markers or direct user instruction. Do not infer diary from emotion, first-person wording, routine, or "today". | Implemented |
| URL capture | User-originated | During inbox capture, save only URL, capture time, and user context. Do not fetch or summarize until explicit ingest. | Implemented |
| URL ingest | User-originated | During ingest, classify links by content form and primary subject. A URL may be chat, article, media, project note, Q&A, reflection, learning, etc. Do not treat every link as tech learning. | Implemented |
| URL preservation | User-originated | Do not store full linked content by default. Preserve metadata, core extraction, selected evidence anchors, coverage, and fetch status. | Implemented |
| Important content | User-originated | `important`, `importent`, `重要`, and `非常重要` should preserve core content more carefully, especially chats and decisions. Very large important content should still avoid full archival and use a 500 Chinese character core extraction plus anchors. | Implemented |
| Learning progress | User-originated | Skill-tree material must distinguish active study, saved-for-later, not-started, skimmed, practiced, applied, and validated states. Objective facts do not need this classification. | Implemented |
| Todo workflow | User-originated | The wiki should be usable as a serious personal todo system. Direct todo commands should not go through inbox or ingest. | Implemented |
| Task granularity | User-originated | Tiny one-off actions should not automatically create canonical task pages. Multiple related todos can map to one parent task checklist. | Implemented |
| Long-term task evidence | User-originated | Some long-term tasks and their execution history should be counted into `sources/`, especially when they represent durable life/project/learning evidence rather than lightweight operational state. | Implemented |
| Query behavior | User-originated | Later query should use local evidence packages first and avoid repeatedly fetching live URLs unless explicitly asked or local evidence is missing. | Implemented |

## AI-Proposed Improvement Areas

### 1. Personal Knowledge And Identity Graph

| Idea | Source | Why it helps | Possible implementation |
| --- | --- | --- | --- |
| Entity registry and alias table | AI-proposed | Prevents duplicate people, projects, concepts, and events. Improves retrieval when names change or aliases appear. | Add `wiki/indexes/entities.md` or `system/indexes/entities.json` generated from frontmatter aliases and wikilinks. |
| Event timeline index | AI-proposed | Makes "what happened over time" queries faster and more reliable. | Add generated `wiki/indexes/timeline.md` grouped by month, event type, people, project, and source. |
| Personal claims ledger | AI-proposed | Separates "the user is X" from evidence. Useful for answering "我是一个什么人" without overclaiming. | Add a `wiki/reflections/claims.md` page with claim, evidence, confidence, first seen, last updated, and counter-evidence. |
| Theme evolution pages | AI-proposed | Long-running themes like career, health, learning, relationships should show change over time instead of static summaries. | Add `## Timeline`, `## Current Pattern`, `## Evidence`, `## Open Questions`, and `## Changed My Mind` sections to major theme pages. |
| Relationship context model | AI-proposed | Helps answer people/relationship questions without mixing facts, emotions, and inferred dynamics. | Extend people pages with `relationship_context`, `last_interaction`, `known_from`, `evidence`, and privacy notes. |
| Decision log | AI-proposed | Important life/project decisions often disappear inside diaries. | Add `wiki/decisions/` or `wiki/events/decisions.md` with decision, options, reason, date, related people/projects, and outcome review date. |

### 2. Task And Todo System

| Idea | Source | Why it helps | Possible implementation |
| --- | --- | --- | --- |
| Generated task indexes | AI-proposed | Faster lookup by date, area, status, and priority without turning Markdown into a database. | Generate `wiki/tasks/by-status.md`, `wiki/tasks/by-area.md`, and `wiki/tasks/by-date/YYYY-MM.md` from task frontmatter. |
| Stale task review | AI-proposed | Prevents open tasks from becoming invisible debt. | Add lint rule: open tasks older than N days without update go to Review Queue. |
| Lightweight todo aging | AI-proposed | Lightweight items should not live forever in `todo.md`. | Add policy: lightweight todos older than N days are completed, dropped, promoted to canonical task, or reviewed. |
| Recurring routines | AI-proposed | Personal management needs routines without duplicating task pages manually. | Add `wiki/tasks/routines.md` with recurrence, next due date, and generated dashboard entries. |
| Task dependency fields | AI-proposed | Waiting/blocked states need clear cause and unblock condition. | Extend task template with optional `blocked_by`, `waiting_on`, and `unblock_condition`. |
| Task report template | AI-proposed | Makes weekly planning and review consistent. | Add `system/templates/task-report.md` and report workflow for today/weekly/overdue/waiting. |
| Long-term task source records | User-originated | Long-term tasks can become important evidence of habits, projects, learning, and life changes. If execution history only lives in task pages, future agents may miss it when rebuilding or querying from sources. | Implemented as the Task Evidence Gate: source-worthy long-term task goals, check-ins, execution logs, failures, blockers, reviews, and outcomes create or update `sources/tasks/`; lightweight task state stays out of sources. |

### 3. Learning And Skill Tree

| Idea | Source | Why it helps | Possible implementation |
| --- | --- | --- | --- |
| Skill map per domain | AI-proposed | "点亮技能树" needs visible nodes and prerequisites, not only chronological notes. | Add `wiki/learning/{domain}/skill-map.md` with nodes, prerequisites, current state, evidence, and next practice. |
| Mastery rubric | AI-proposed | Prevents arbitrary status jumps like `understood` or `validated`. | Define rubric: saved -> skimmed -> studied -> practiced -> applied -> validated, with evidence required for each. |
| Weak spot index | AI-proposed | Helps answer "我某领域薄弱点是什么". | Generate `wiki/learning/weak-spots.md` from Q&A gaps, failed exercises, open questions, and low-confidence concept pages. |
| Review scheduling | AI-proposed | Learning becomes durable only with spaced review. | Add `review_due`, `last_reviewed`, and `review_interval` to learning paths and important concept pages. |
| Practice evidence links | AI-proposed | Skill progress should be backed by actual work. | Link concepts to exercises, code snippets, projects, interview prep, or validated use cases. |
| Saved-for-later triage | AI-proposed | Prevents saved links from becoming an infinite backlog. | Add recurring report: saved links older than N days -> keep, drop, promote to active study, or archive-only. |

### 4. Retrieval And Query Efficiency

| Idea | Source | Why it helps | Possible implementation |
| --- | --- | --- | --- |
| Generated query indexes | AI-proposed | Avoids scanning the whole wiki for common questions. | Generate indexes for people, events, projects, tasks, learning topics, sources, and reports. |
| Context packs | AI-proposed | Gives agents a small curated bundle for common query types. | Add `system/context-packs/` with routing files like `identity.md`, `learning-report.md`, `task-review.md`, `career.md`. |
| Source evidence manifest | AI-proposed | Makes source lookup faster and avoids re-fetching links. | Generate `sources/manifest.md` or `sources/manifest.json` with type, title, date, URL, coverage, status, and target pages. |
| Alias resolver | AI-proposed | Improves lookup when the user uses nickname, typo, Chinese/English names, or shorthand. | Add `system/indexes/aliases.md` generated from frontmatter aliases and canonical filenames. |
| Query confidence levels | AI-proposed | Prevents AI from presenting weak inferred answers as fact. | Add response convention: `Supported by source`, `User-stated`, `Inference`, `Needs evidence`. |
| Report source map | AI-proposed | Reports should be audit-friendly and reproducible. | Every persisted report should include pages read, source evidence, skipped areas, uncertainty, and follow-up tasks. |

### 5. Capture And Ingest Usability

| Idea | Source | Why it helps | Possible implementation |
| --- | --- | --- | --- |
| Capture templates by intent | AI-proposed | Lowers friction while preserving classification quality. | Add templates for diary, learning, URL, chat, project idea, decision, reflection, and task. |
| Inbox dashboard | AI-proposed | Helps the user see pending material before ingest. | Add `inbox/INDEX.md` or generated report with pending files, type guesses, age, and suggested grouping. |
| Ingest dry run | AI-proposed | Gives visibility before mutating many files. | Add an optional "plan only" phase: inventory, grouping, target pages, expected files, risks. |
| Sensitive content handling | AI-proposed | Personal wiki can contain private relationships, health, money, or work info. | Add `sensitivity: private | sensitive | public-ok` and rules for reports/export. |
| Import quality tiers | AI-proposed | Not all imported content deserves the same processing depth. | Use tiers: archive-only, extract-core, full-ingest, needs-review. |

### 6. Quality, Automation, And Maintenance

| Idea | Source | Why it helps | Possible implementation |
| --- | --- | --- | --- |
| Automated lint script | AI-proposed | Manual checklist is good but easy to skip. | Add script to check frontmatter, broken wikilinks, invalid statuses, source paths, and task/dashboard consistency. |
| Generated indexes instead of manual indexes | AI-proposed | Reduces drift between canonical pages and navigation pages. | Build lightweight scripts that regenerate task, source, alias, timeline, and learning indexes. |
| Schema versioning | AI-proposed | Future migrations need to know which pages follow which version. | Add `schema_version` to page templates or maintain `system/schema-changelog.md`. |
| Decision and change log for framework | AI-proposed | Separates framework evolution from personal knowledge. | Keep this file plus monthly log entries; optionally add `system/framework-decisions.md`. |
| Test fixtures | AI-proposed | Makes future model behavior easier to validate. | Add example input/output fixtures for inbox capture, URL ingest, task granularity, learning progress, and report generation. |
| Commit discipline | AI-proposed | The framework is code-like; changes need auditability. | Commit schema/process changes separately from content ingest when possible. |

## Recommended Roadmap

### P0: Make The Current System Reliable

- Add an automated lint script for wikilinks, source paths, frontmatter, task status, task dashboard consistency, and learning progress fields.
- Add generated source manifest and task indexes.
- Add task stale review and lightweight todo aging policy.
- Maintain the Task Evidence Gate for long-term task goals and execution history, including periodic review cadence and grouping behavior.
- Add report templates for task review and learning review.

### P1: Improve Personal Understanding

- Add entity/alias index.
- Add event timeline index.
- Add personal claims ledger for "我是一个什么人" style questions.
- Add theme evolution sections to major themes.
- Add decision log for important life/project decisions.

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
- What review cadence should source-backed long-term tasks use by default, and when should routine check-ins be sampled instead of fully archived?
- Should personal claims be centralized in one ledger or remain distributed across themes/reflections with a generated index?
- What review cadence should be default for tasks, learning, links, and personal themes?

## How To Use This File

- Treat `User-originated` items as user constraints unless explicitly revised later.
- Treat `AI-proposed` items as backlog suggestions, not binding rules.
- When an idea is accepted, move it into the relevant schema, resolver, checklist, template, or domain `AGENTS.md`.
- After implementation, update the active monthly log and mark the item as implemented or superseded.
