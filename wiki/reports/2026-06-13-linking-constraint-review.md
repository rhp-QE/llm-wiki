---
type: report
report_type: health_check
title: Linking Constraint Review
period: 2026-06-13
status: final
created: 2026-06-13
updated: 2026-06-13
sources: []
---

# Linking Constraint Review

## Executive Summary

The framework previously allowed source references to remain as plain code paths while requiring relative Markdown links mainly for compiled wiki pages. That made some associated documents non-clickable in Obsidian, VS Code, and Markdown viewers. The rule is now tightened: associated local Markdown documents should use standard relative Markdown links (`[label](relative/path.md)`) by default.

## Scope

- User feedback during personal-info ingest and Obsidian navigation review.
- Framework link rules for wiki pages, source pages, index pages, maps, reports, and `Sources` sections.

## What Changed / What Was Checked

- Updated root and system link rules to make standard Markdown links the default for associated documents.
- Clarified that source evidence links should be clickable when they point to local Markdown files.
- Kept `[[...]]` as a non-default Obsidian-only exception because it is less portable and can be path-ambiguous.
- Preserved code-form paths for audit inventories, command examples, literal directory ownership notes, and non-navigational file references.

## Key Findings

- Standard Markdown links are sufficient for Obsidian navigation and are also portable to VS Code and GitHub-style viewers.
- Plain code paths such as ``sources/...`` are useful for audit lists but poor for knowledge navigation.
- The previous wording over-optimized for avoiding wikilink problems but under-specified that source references should still be clickable.
- Same-subject, same-day source fragments should be grouped into one source with fragment metadata rather than split into multiple source files.
- Current-state facts should carry an effective/captured date, especially when the claim can become stale.

## Issues

- Framework rules used "source paths" language in several places, which encouraged non-clickable source citations.
- The distinction between audit file inventories and navigational knowledge links was not explicit.
- Lint expectations did not clearly require source evidence links to be clickable.

## Next Actions

- During future ingest, convert wiki-to-source and source-to-wiki references into relative Markdown links.
- Keep raw material verbatim; put fragment timing and routing metadata outside `## Raw Material`.
- Consider adding an automated lint rule that flags code-form local Markdown paths inside `## Sources` and relationship sections when a Markdown link would be expected.

## Evidence

- [Root operating guide](../../AGENTS.md)
- [Conventions](../../system/conventions.md)
- [Schema](../../system/schema.md)
- [Obsidian integration](../../system/obsidian.md)
- [Maintenance manual](../../system/maintenance.md)
- [Ingest checklist](../../system/evals/ingest-checklist.md)
- [Lint checklist](../../system/evals/lint-checklist.md)
- [Sources rules](../../sources/AGENTS.md)
- [Indexes rules](../indexes/AGENTS.md)
