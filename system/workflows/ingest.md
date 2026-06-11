# Workflow: Ingest

Use only when the user explicitly asks to process `inbox/`, says `ingest`, `入库`, `沉淀`, `沉淀到 wiki`, or `记录到 wiki`.

## Read

- `AGENTS.md`
- `wiki/index.md`
- `system/resolver.md`
- `system/evals/ingest-checklist.md`
- `system/policies/source-preservation.md`
- `system/policies/url-evidence.md` when URLs are present
- `system/policies/learning-progress.md` for skill-tree or learning material
- `system/policies/task-impact.md` for diary, learning, project, reflection, event, article, or chat sources that may affect tasks
- nearest target-domain `AGENTS.md`
- `system/templates/ingest-plan.md` for complex or multi-domain ingest

## Phases

1. Intake: identify inputs, preserve source evidence, and stop if required source preservation cannot be satisfied.
2. URL Handling: for URL-backed inputs, separate reading/fetching, source archival, and compiled wiki updates according to `system/policies/url-evidence.md`.
3. Route: choose source type, target domains, templates, and existing pages to update.
4. Enrich: extract durable entities, relationships, questions, timeline entries, open loops, and task signals.
5. Write: update compiled pages and indexes through domain schemas.
6. Task Impact Pass: update affected task pages, `todo.md`, and `wiki/tasks/任务.md` when source evidence clearly supports it.
7. Citation fixing: ensure source paths exist and claims are marked as sourced, user-stated, inference, or needs evidence.
8. Maintenance: check links, frontmatter, aliases, duplicates, status, indexes, and processed inbox cleanup.
9. Log: update the active monthly log.

## Rules

- Explicit Ingest is required before writing `sources/` or compiled `wiki/` pages.
- User-provided durable material must be preserved verbatim in `sources/` before compiled pages are written.
- Inbox ingest inventories and groups compatible fragments before source creation.
- Do not merge different source types by convenience.
- URL-backed Ingest attempts to read accessible linked content for understanding, but full source archival depends on ownership, source type, size, and explicit user intent.
- URL-only third-party or external submissions use bounded local evidence packages by default, not full linked text.
- User-owned durable material delivered by URL must be preserved as raw source material when accessible before compiled pages are written.
- If user-owned durable material cannot be fetched or preserved, keep the URL/context as `needs-review` and do not compile personal facts from it.
- Learning progress updates require supported learning intent/state classification.
- Prefer updating existing pages over creating duplicates.
- Every non-trivial compiled claim needs a source path, explicit user statement, `Inference`, or `Needs evidence`.

## Output

Return:

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
tasks_created:
tasks_updated:
links_added:
questions_added:
citations_fixed:
maintenance_done:
open_questions:
needs_user_review:
next_actions:
```
