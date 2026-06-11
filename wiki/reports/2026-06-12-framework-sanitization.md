---
type: report
report_type: migration
title: Framework Sanitization Report
period: 2026-06-12
status: final
created: 2026-06-12
updated: 2026-06-12
sources: []
---

# Framework Sanitization Report

## Executive Summary

This branch was converted into a generic LLM-wiki framework seed. Real source material and compiled personal knowledge pages were removed from the working tree. Framework rules, schemas, templates, README files, Obsidian configuration, and empty task/navigation scaffolding were retained.

## Scope

- Removed real evidence files under `sources/`.
- Removed real compiled pages under `wiki/`.
- Reset task dashboard and task index to empty scaffold state.
- Reset navigation and logs so they do not point to removed real content.
- Kept operational rules and templates for future reuse.

## Source Inventory

- Real source files: removed.
- Source README and rules files: retained.
- Inbox templates: retained.

## Mapping Decisions

- Raw evidence belongs under `sources/` only after explicit ingest.
- Compiled knowledge belongs under `wiki/`.
- Operational rules and templates remain under `system/`.
- Task dashboard state remains in `todo.md` and `wiki/tasks/任务.md`.

## Sample Import

Not applicable. This run removed existing real content and prepared an empty framework seed.

## Sample Validation

Not applicable.

## Full Import Counts

No import was performed.

## Derived Structure Rebuild

- Rebuilt `wiki/index.md`.
- Rebuilt `wiki/首页.md`.
- Rebuilt `wiki/maps/地图.md`.
- Rebuilt `todo.md`.
- Rebuilt `wiki/tasks/任务.md`.
- Rebuilt `wiki/log.md` and `wiki/logs/2026-06.md`.

## Health Check

- The framework keeps required top-level domains, rules, templates, and checklists.
- Removed pages should no longer be linked from active entry points.
- A follow-up lint pass should be run before publishing or using this as a template.

## Failures And Skipped Items

- Git history was not rewritten in this working-tree sanitization. A normal branch still has parent commits. For public release, rebuild as an orphan branch or rewrite history before pushing.

## Needs User Review

- Decide whether to publish this as a normal branch or request a history-clean orphan branch.

## Recommended Next Actions

- Run lint.
- Commit the sanitized framework branch.
- If the branch will be public, rebuild it as an orphan/history-clean branch before pushing.
