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
2. Route: choose source type, target domains, templates, and existing pages to update.
3. Enrich: extract durable entities, relationships, questions, timeline entries, open loops, and task signals.
4. Write: update compiled pages and indexes through domain schemas.
5. Task Impact Pass: update affected task pages, `todo.md`, and `wiki/tasks/任务.md` when source evidence clearly supports it.
6. Citation fixing: ensure source paths exist and claims are marked as sourced, user-stated, inference, or needs evidence.
7. Maintenance: check links, frontmatter, aliases, duplicates, status, indexes, and processed inbox cleanup.
8. Log: update the active monthly log.

## Rules

- Explicit Ingest is required before writing `sources/` or compiled `wiki/` pages.
- User-provided durable material must be preserved verbatim in `sources/` before compiled pages are written.
- Inbox ingest inventories and groups compatible fragments before source creation.
- Do not merge different source types by convenience.
- URL-only submissions use bounded local evidence packages by default, not full linked text.
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

