---
name: llm-wiki
description: >
  Operate a local Markdown-first LLM-wiki knowledge base. Use this skill whenever
  the user mentions llm_wiki, llm-wiki, knowledge base, inbox,
  todo, 待办, "给我记一个 todo", ingest, query my wiki, lint/check wiki,
  migrate old notes, Obsidian notes, "沉淀到 wiki", "入库", "处理 inbox",
  "记录到我的知识库", or provides a new
  learning note/diary/article/idea with an explicit ingest request. Plain
  `inbox` / `暂存` requests are capture-only. This skill bootstraps
  fresh Codex sessions by locating the wiki root, reading its local operating
  files, and running Task Capture / Update, Query, Ingest, Lint,
  Setup/Migration, or Report workflows.
  It also covers Obsidian browsing, graph, MOC, and visual map maintenance for
  this wiki.
  Shortcut commands: /wiki-todo, /wiki-ingest, /wiki-query, /wiki-lint,
  /wiki-migrate, /wiki-report.
---

# LLM Wiki

This skill operates a local LLM-wiki framework instance. It exists so the user does not need to paste a bootstrap prompt in every new Codex session.

The installed bootstrap skill is intentionally shorter than the local workflow spec. After locating the wiki root, treat `system/skills/llm-wiki/SKILL.md` plus the local `AGENTS.md` files as the canonical operating instructions.

## Contract

- Default wiki root is `/root/llm_wiki`.
- If the current working directory already contains `system/skills/llm-wiki/SKILL.md`, use the current directory as the wiki root.
- Do not ask the user to paste startup instructions. This skill is the startup instruction.
- Before mutating the wiki, read the local operating files listed below.
- Preserve raw material in `sources/` and compiled knowledge in `wiki/` only after explicit Ingest.
- For user-provided pasted text, uploaded file content, imported notes, inbox captures, diary, learning notes, chat excerpts, reflections, project notes, and other durable material, source preservation is a hard verbatim gate: save the exact original payload under `sources/` before writing compiled `wiki/` pages.
- Treat `inbox/` as a temporary capture queue: an `inbox` or `暂存` command writes only to `inbox/` and must not create `sources/` or compiled `wiki/` pages. After an inbox item is explicitly ingested and archived under `sources/`, remove the processed inbox file.
- Treat `todo` / `待办` / `给我记一个 todo` as Task Capture / Update: route through the local Task Granularity Gate, write the task system rather than `inbox/`, and create `wiki/tasks/` pages only for serious tracked tasks. Then apply the local Task Evidence Gate: source-worthy long-term task goals and execution history must also be preserved under `sources/tasks/`, while lightweight task state must stay out of `sources/`. Canonical tasks also maintain local progress caches in task pages, `todo.md`, and `wiki/tasks/任务.md`; task-progress queries should read those snapshots before deep-reading task pages or linked domains. Ingest must run the local Task Impact Pass so diary, learning, project, and event sources update affected tasks and backlink compiled pages to related tasks.
- Update the active monthly log under `wiki/logs/YYYY-MM.md` after meaningful mutations.
- Keep `wiki/log.md` as the short log index.
- For mutating work, run the relevant audit checklist under `system/evals/`.
- For Obsidian or graph navigation work, read `system/obsidian.md`, `wiki/首页.md`, and `wiki/maps/AGENTS.md`.
- Query is read-only. Ingest, Lint, Setup/Migration, and persisted Reports may mutate files.

## Bootstrap

When the skill triggers:

1. Locate the wiki root:
   - Prefer current working directory if it has `AGENTS.md` and `system/skills/llm-wiki/SKILL.md`.
   - Otherwise use `/root/llm_wiki` if it exists.
2. Read, in order:
   - `AGENTS.md`
- `system/skills/llm-wiki/SKILL.md`
- `system/lifecycle.md`
- `system/schema.md`
- `system/resolver.md`
- `wiki/index.md`
3. Then resolve the user's intent and run the matching workflow.

## Workflow Selection

Use the local `system/resolver.md` as the source of truth.

- `/wiki-inbox` or `inbox`: capture new material only under `inbox/`; do not organize knowledge.
- `/wiki-todo` or `todo`: create, update, complete, schedule, or review tasks through `todo.md` and `wiki/tasks/`, using the local Task Granularity Gate.
- `/wiki-ingest`: process pasted content or `inbox/` as new material; clear processed inbox files after archiving them to `sources/`.
- `/wiki-query`: answer from existing wiki only; read-only.
- `/wiki-lint`: run health checks for links, citations, stale pages, duplicates, and schema.
- `/wiki-migrate`: run stock setup/migration; must start with inventory, mapping, and sample import.
- `/wiki-report`: generate a persisted or conversational report depending on the user's request.

- **Query**: user asks a question about existing wiki knowledge. Read-only.
- **Inbox Capture**: user invokes `inbox`, `暂存`, or gives material without explicitly asking for Ingest. Write only to `inbox/`.
- **Task Capture / Update**: user invokes `todo`, `待办`, "给我记一个 todo", or asks to complete, schedule, drop, block, or update a task. Read `wiki/tasks/AGENTS.md` and `system/evals/task-checklist.md`; use the local Task Granularity Gate to decide between a lightweight `todo.md` item, a canonical `wiki/tasks/` page, a subtask/checklist item, or no task. For canonical tasks and task updates, also use the Task Evidence Gate to decide whether to create or update `sources/tasks/`, and refresh task progress snapshots when progress changes.
- **Ingest**: user explicitly asks to process `inbox/`, or says "ingest", "沉淀", "入库", "记录到 wiki".
- **Lint**: user asks to check health, links, citations, stale pages, duplicates, or schema.
- **Setup / Migration**: user wants to import historical notes, old Obsidian vaults, diaries, folders, or large batches. Must run inventory, mapping, sample import, sample validation, full import, rebuild, health check, and migration report.
- **Report**: user asks for briefing, pulse, task report, weekly review, learning review, health report, or migration report.

## Ingest Minimum Bar

For new material:

1. Preserve the raw note under `sources/` unless it is already archived.
2. For user-provided material, the source must preserve wording, line breaks, order, and fragment boundaries verbatim in `## Raw Material`; do not summarize, translate, normalize, clean up, omit, or rewrite inside that raw block.
3. Direct lightweight todos or small task commands unrelated to durable personal growth, knowledge, projects, events, or sources are exempt from source archival and stay in the task system. Source-worthy long-term task evidence is not exempt; preserve it under `sources/tasks/` according to the local Task Evidence Gate.
4. URL-only submissions are not full original text. Save URL/context and create the local bounded evidence package unless full archival is justified or explicitly requested.
5. For skill-tree and learning-progress material, classify `learning_intent`, `learning_state`, `counts_as_progress`, `priority`, and `progress_evidence` before updating learning paths or tech mastery status. Do not apply these fields to objective facts such as diary events, people, relationships, or factual life notes unless the material explicitly records learning or practice.
6. Saved-only links, future-reference material, not-started topics, and skimmed material should not count as learning progress. They may be preserved as sources or added to a learning path's `Saved For Later`, but must not update `Recently Learned` or raise tech status to `understood`, `applied`, or `validated`.
7. Classify as `diary` only with an explicit `diary` / `日记` marker such as `Type: diary`, `source_type: diary`, a diary-marked title/filename, or direct user wording. Do not infer diary from emotions, daily routine, first-person style, or "today" alone.
8. For `inbox/` inputs, inventory all pending fragments and group compatible fragments before writing `sources/`; do not create one source per fragment by default.
9. Group only within compatible boundaries: same explicit source type, same natural date or topic, and compatible origin/context. Preserve fragment IDs, capture timestamps, original inbox paths, and verbatim fragment bodies.
10. Never merge different source types just because they arrived together. Keep `diary` and `learning` separate unless the user explicitly instructs otherwise.
11. Read `system/evals/ingest-checklist.md`.
12. Use `system/resolver.md` and nearest domain `AGENTS.md` files to choose target pages.
13. Check existing pages and aliases before creating durable pages.
14. For complex or multi-domain ingest, sketch the route with `system/templates/ingest-plan.md`.
15. Enrich durable entities, relationships, timeline entries, concepts, Q&A, aliases, and review tasks.
16. Fix citations enough that future agents can trace claims.
17. If the input came from `inbox/`, remove the processed inbox file after the source archive and wiki updates are verified.
18. Run the relevant maintenance checks and complete the ingest checklist.
19. Update the active monthly log under `wiki/logs/YYYY-MM.md`.
20. Return an auditable summary.

## Migration Minimum Bar

For stock or historical import:

1. Inventory sources.
2. Design mapping from old structure to this wiki.
3. Import 5-10 representative samples.
4. Validate samples before bulk work.
5. Only then run full import.
6. Rebuild derived structures.
7. Run health check.
8. Write a migration report.

Do not skip sample validation.

## Output Format

For mutating workflows, end with:

```text
workflow:
wiki_root:
inputs:
files_read:
files_created:
files_updated:
sources_created_or_used:
pages_created:
pages_updated:
links_added:
citations_fixed:
maintenance_done:
open_questions:
needs_user_review:
next_actions:
```

For Query, end with:

```text
answer:
pages_consulted:
source_evidence:
uncertainties:
suggested_followups:
```

## Anti-Patterns

- Do not require the user to paste `START_HERE.md`.
- Do not treat generic model knowledge as the user's knowledge unless the user supplied, accepted, or applied it.
- Do not rewrite raw notes in place.
- Do not full-import historical data before sample validation.
- Do not silently mutate the wiki without a monthly log entry.
- Do not create many domain-specific skills when one local wiki skill plus directory `AGENTS.md` files is enough.
