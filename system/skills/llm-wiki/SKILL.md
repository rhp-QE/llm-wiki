---
name: llm-wiki
version: 1.1.0
description: >
  Operate the user's local personal LLM-wiki. Use this whenever the user asks to
  ingest notes, process inbox files, summarize or query the personal wiki, update
  knowledge pages, lint links/sources/schema, build a personal knowledge base, or
  turn scattered notes into durable Markdown pages. Also use this for setup,
  migration, sample import, full import, health checks, and wiki reports. This
  skill owns Resolver, Query, Ingest, Enrichment, Citation Fixing, Maintenance,
  Report, and Setup/Migration workflows for this repository.
triggers:
  - "处理 inbox"
  - "ingest"
  - "入库"
  - "沉淀到 wiki"
  - "查询我的 wiki"
  - "检查 wiki"
  - "lint"
  - "迁移旧笔记"
  - "初始化知识库"
  - "生成 wiki 报告"
tools:
  - read_file
  - search
  - edit_file
  - filesystem
  - shell
mutating: true
writes_pages: true
writes_to:
  - inbox/
  - sources/
  - wiki/
  - system/
---

# LLM Wiki Skill

This skill operates a Markdown-first personal knowledge system inspired by LLM-wiki practice: source material is preserved, compiled knowledge is written once and reused many times, and agents consume `index.md` plus linked pages through progressive loading.

## Contract

When using this skill:

- Preserve raw material in `sources/` or `inbox/`.
- Put compiled knowledge in `wiki/`.
- Follow `system/lifecycle.md` to distinguish incremental work from stock setup/migration.
- Read the relevant `AGENTS.md` before editing a domain.
- Maintain links, aliases, source references, and the active monthly log under `wiki/logs/YYYY-MM.md`.
- Maintain `wiki/home.md` and `wiki/maps/` when changes affect Obsidian navigation.
- Prefer a small, reviewable update over a broad rewrite.
- Use workflow gates and audit checklists for mutating work.
- For bulk historical material, run inventory, mapping, sample import, validation, full import, derived rebuild, health check, and migration report. Do not skip the sample validation step.

## File Boundaries

| Area | Role | Mutation policy |
| --- | --- | --- |
| `inbox/` | low-friction capture | may move or copy into sources after ingest |
| `sources/` | raw evidence | preserve content; add metadata only when useful |
| `wiki/` | compiled knowledge | update through domain schema |
| `system/` | rules, templates, evals | update only for process or schema changes |

## Workflow Gates

Before mutating files:

1. Use `system/resolver.md` to classify the workflow and target domains.
2. Read the nearest target-domain `AGENTS.md` files.
3. Check existing pages and aliases before creating durable pages.
4. For complex or multi-domain ingest, sketch the route with `system/templates/ingest-plan.md`.

After mutating files:

1. Run the relevant checklist from `system/evals/`.
2. Confirm introduced source paths and wikilinks are traceable.
3. Update the active monthly log under `wiki/logs/YYYY-MM.md`.
4. Return the workflow's auditable output fields.

## Phases

This skill has two lifecycle modes.

### Incremental Mode

Use for daily operation.

```text
user input / cron trigger
  -> Resolver
  -> query OR ingest
  -> enrichment
  -> citation fixing
  -> maintenance
  -> report
```

### Stock Mode

Use for initialization, migration, or large historical import.

```text
setup / migration
  -> inventory sources
  -> design mapping
  -> sample import
  -> sample validation
  -> full import
  -> rebuild derived structures
  -> health check
  -> migration report
```

## Workflow: Resolver

Use before choosing a workflow.

### Resolver Steps

1. Read `system/resolver.md`.
2. Determine whether the request is read-only, mutating, report-only, maintenance, or migration.
3. If read-only, use Query and do not mutate files.
4. If new material is present, use Ingest.
5. If many historical files or source systems are involved, use Setup/Migration.
6. If scheduled, decide whether the output should be a report, an ingest, a lint, or a skipped run.

## Workflow: Ingest

Use when the user gives new notes, asks to process `inbox/`, or says a topic should be "沉淀", "入库", or "记录到 wiki".

### Phases

1. **Intake**
   - Identify input files or pasted content.
   - Determine source type: diary, learning, article, book, chat, media, idea, or project.
   - Preserve the raw material under `sources/` unless it already lives there.
   - Read `system/evals/ingest-checklist.md`.

2. **Route**
   - Read `system/resolver.md`.
   - Choose target domains.
   - Read nearest domain `AGENTS.md`.
   - For complex or multi-domain ingest, prepare an ingest plan using `system/templates/ingest-plan.md`.

3. **Enrichment**
   - Pull durable facts, questions, examples, relationships, and open loops.
   - Identify aliases and existing pages before creating new pages.
   - Extract entities, relationships, timeline entries, durable Q&A, concepts, themes, and review tasks.

4. **Write**
   - Create or update compiled pages using templates.
   - Add `[[wikilink]]` relationships.
   - Update indexes and learning paths when relevant.
   - Prefer updating existing pages over creating duplicate pages.

5. **Citation fixing**
   - Ensure source paths exist.
   - Mark claims as sourced, user-stated, inferred, or needing evidence.
   - Normalize source references enough that future agents can trace them.

6. **Maintenance**
   - Check links, frontmatter, aliases, duplicates, orphan pages, and stale status.
   - Update indexes or derived pages when new durable knowledge was added.
   - Complete the ingest checklist and list any failed or not-applicable items.

7. **Report**
   - Summarize what was ingested, enriched, fixed, and left open.
   - Update the active monthly log under `wiki/logs/YYYY-MM.md`.

### Ingest Output

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
links_added:
questions_added:
citations_fixed:
maintenance_done:
open_questions:
needs_user_review:
next_actions:
```

## Workflow: Query

Use when the user asks to consume the wiki.

### Phases

1. Read `wiki/index.md`.
2. Select the smallest relevant domain set.
3. Read compiled pages first.
4. Read sources only when evidence, quotes, or ambiguity matter.
5. Answer with links or file references where useful.
6. If the answer reveals missing structure, suggest an ingest or lint follow-up.

### Query Output

Prefer a concise answer that says:

- What the wiki currently says
- What evidence supports it
- What is uncertain or missing
- Which pages were consulted

## Workflow: Lint

Use when checking health, after batch ingest, or before relying on the wiki for broad synthesis.

### Phases

1. Read `system/maintenance.md`.
2. Read `system/evals/lint-checklist.md`.
3. Run structure, link, source, duplicate, and staleness checks.
4. For recent ingest issues, cross-check `system/evals/ingest-checklist.md`.
5. Fix mechanical issues directly when safe.
6. List subjective issues for user review.
7. Update the active monthly log under `wiki/logs/YYYY-MM.md`.

### Lint Output

Return:

```text
checked:
fixed:
warnings:
needs_user_review:
recommended_next_actions:
```

## Workflow: Report

Use when the user asks for a briefing, pulse, task report, weekly review, learning review, or migration summary.

### Phases

1. Determine report type and audience.
2. Read the smallest relevant wiki subset.
3. Include what changed, what matters, and what action is recommended.
4. Link to source pages and compiled pages.
5. Write the report under `wiki/reports/` when the user wants it persisted.

## Workflow: Setup / Migration

Use for initialization, migration, or batch import of historical material.

### Phases

1. **Inventory sources**
   - List source folders, file types, approximate counts, date ranges, quality issues, and sensitive areas.

2. **Design mapping**
   - Map source structure to `sources/`, `wiki/` domains, page types, and metadata.
   - Record ambiguous mappings.

3. **Sample import**
   - Import 5-10 representative samples.
   - Cover different source types and edge cases.

4. **Sample validation**
   - Validate page structure, source references, links, aliases, relationships, and user fit.
   - Ask for user review when classification choices are subjective.

5. **Full import**
   - Process in batches only after sample validation.
   - Track counts, failures, skipped items, and changed files.

6. **Rebuild derived structures**
   - Rebuild indexes, backlinks, aliases, timelines, review queues, and report pages.

7. **Health check**
   - Run the lint checklist.
   - Fix mechanical issues and report subjective issues.

8. **Migration report**
   - Write a report using `system/templates/migration-report.md`.

### Migration Output

Return:

```text
source_inventory:
mapping_decisions:
sample_imported:
sample_validation:
full_import_counts:
derived_rebuild:
health_check:
failures:
needs_user_review:
migration_report:
```

## Output Format

Every mutating run must end with an auditable summary:

```text
workflow:
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

Read-only query runs should instead end with:

```text
answer:
pages_consulted:
source_evidence:
uncertainties:
suggested_followups:
```

## Anti-Patterns

- Do not dump summaries into `wiki/` without links or source references.
- Do not create one skill per domain unless repeated workflow complexity justifies it.
- Do not scan the entire wiki for ordinary queries; use progressive loading.
- Do not rewrite the user's raw notes into polished prose.
- Do not treat generic web knowledge as the user's knowledge unless the user consumed, accepted, or applied it.
- Do not run full migration before sample validation.
- Do not produce a report that hides skipped files, failures, or low-confidence mappings.
- Do not let cron jobs mutate the wiki silently without a log entry.

## Verification

Before declaring a mutating task complete, check:

- The active monthly log under `wiki/logs/YYYY-MM.md` has an entry.
- New pages have frontmatter.
- New pages have at least one source or explicit inference marker.
- New pages are discoverable from `wiki/index.md` or a domain README/index.
- Any open questions are visible.
