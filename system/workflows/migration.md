# Workflow: Setup / Migration

Use for initialization, historical imports, old vault migration, many files, or source systems that need mapping.

## Read

- `AGENTS.md`
- `wiki/index.md`
- `system/lifecycle.md`
- `system/templates/migration-report.md`
- `system/evals/lint-checklist.md`
- `system/policies/source-preservation.md`
- `system/policies/url-evidence.md` when links are included
- nearest target-domain `AGENTS.md` files for sample import

## Required Phases

1. Inventory sources.
2. Design mapping.
3. Import 5-10 representative samples.
4. Validate samples.
5. Full import only after sample validation.
6. Rebuild derived structures.
7. Run health check.
8. Write migration report.

## Rules

- Do not full-import before sample validation.
- Report counts, skipped files, failures, ambiguous mappings, and low-confidence choices.
- Preserve raw source payloads according to source preservation policy.
- Process in batches after validation.
- Ask for user review when subjective classification choices affect many pages.

## Output

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

