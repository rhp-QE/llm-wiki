# Knowledge Lifecycle

This document defines the operating lifecycle for this personal LLM-wiki. It is the shared model for agents, skills, cron jobs, and manual maintenance.

There are two core scenarios:

1. Incremental scenario: daily operation after the wiki is running.
2. Stock scenario: setup, migration, or batch import of historical material.

## Incremental Scenario

Incremental work handles new user input, new notes, new links, scheduled checks, and everyday questions.

```text
user input / cron trigger
  -> Resolver
  -> query OR ingest
  -> enrichment
  -> citation fixing
  -> maintenance
  -> report
```

### Entry Points

- User input: pasted note, question, link, file, learning fragment, idea, diary entry.
- Cron trigger: daily review, weekly lint, unread source review, pulse, task report.

### Resolver

Resolver decides the intent and route:

- `query`: read-only answer from existing wiki.
- `ingest`: receive and process new material.
- `maintenance`: check or repair wiki health.
- `report`: produce a consumable output from existing knowledge.

The resolver should prefer read-only `query` when the user only asks a question. It should choose `ingest` when the user provides new material or asks to record, capture, sync, import, or沉淀 something.

### Query

Query is read-only.

Rules:

- Do not mutate `sources/`, `wiki/`, or `system/`.
- Read `wiki/index.md` first.
- Deep-read only the most relevant domain pages.
- If the answer reveals missing knowledge, suggest an ingest or lint follow-up.

### Ingest

Ingest receives new material.

Rules:

- Preserve raw material under `sources/`.
- Update compiled pages under `wiki/`.
- Log the operation in `wiki/log.md`.
- Never treat an unsourced model guess as user knowledge.

### Enrichment

Enrichment turns raw material into knowledge structure.

Enrich with:

- Entities: people, projects, concepts, tools, places, organizations.
- Relationships: person-event, concept-concept, theme-event, model-example.
- Timeline entries.
- Durable questions.
- Aliases.
- Open threads and review tasks.

### Citation Fixing

Citation fixing makes evidence traceable.

Check:

- Source path exists.
- Claims point to a source, user statement, or explicit inference marker.
- Citation style is consistent enough to be found later.
- Quotes are not overused; prefer source pointers and summaries.

### Maintenance

Maintenance keeps the wiki healthy.

Check:

- Broken links.
- Orphan pages.
- Duplicate entities.
- Missing frontmatter.
- Stale status.
- Pages without source evidence.
- Index pages that do not mention new durable pages.

### Report

Reports are consumable outputs, not raw knowledge.

Examples:

- Briefing.
- Pulse.
- Task report.
- Migration report.
- Weekly review.
- Learning review.

Reports should include what was checked, what changed, what matters, and what the user should do next.

## Stock Scenario

Stock work handles initialization, migration, or one-time import of historical material.

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

### 1. Inventory Sources

Identify:

- Source systems or folders.
- File types.
- Volume.
- Date ranges.
- Quality issues.
- Sensitive areas.
- Existing structure.

### 2. Design Mapping

Map old structure to this wiki:

- Source material -> `sources/`.
- Durable concepts -> `wiki/tech/`, `wiki/themes/`, `wiki/models/`, etc.
- People -> `wiki/people/`.
- Events -> `wiki/events/`.
- Reusable Q&A -> `wiki/qa/`.
- Projects and ideas -> `wiki/projects/` or `wiki/writing/`.
- Reports -> `wiki/reports/`.

Record ambiguous mapping decisions in the migration report.

### 3. Sample Import

Before bulk work, import 5-10 representative samples.

Samples should cover different types, not just easy files.

### 4. Sample Validation

Validate:

- Mapping correctness.
- Page structure.
- Citation quality.
- Link quality.
- Entity merging and aliases.
- Whether the output feels like the user's wiki rather than a generic taxonomy.

### 5. Full Import

Only after sample validation:

- Process in batches.
- Track counts.
- Preserve failures.
- Avoid silent skips.

### 6. Rebuild Derived Structures

After full import, rebuild:

- Index pages.
- Backlinks.
- Alias tables.
- Timeline pages.
- Review queues.
- Summary pages.
- Reports.

### 7. Health Check

Run `system/evals/lint-checklist.md`.

Check import completeness, broken links, orphan pages, missing citations, duplicate entities, stale pages, and schema drift.

### 8. Migration Report

Output a report covering:

- Scope.
- Source inventory.
- Mapping decisions.
- Sample results.
- Full import counts.
- Failures and skipped items.
- Health check results.
- Recommended next actions.

## Key Difference

- Incremental scenario: daily query, ingest, enrichment, maintenance, and report.
- Stock scenario: inventory, mapping, sample validation, full migration, derived rebuild, health check, and migration report.
