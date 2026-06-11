# Link-Backed Source Template

Use this when an inbox item is a URL or a URL plus short user note. A URL is the delivery/origin, not the source type.

```markdown
---
type: source
source_type: article | book | chat | learning | media | note | idea | project | qa | reflection | other
delivery: url
original_payload: url-only | user-provided | fetched | manual
raw_preservation: evidence-package | verbatim | metadata-only
content_form: article | chat | thread | documentation | gist | newsletter | video | podcast | transcript | post | other
title:
author:
origin:
original_url:
created:
captured:
accessed:
fetch_status: fetched | partial | failed | manual
archive_policy: metadata-only | excerpted | full
coverage: full | partial | metadata-only
importance: normal | important | very-important
preservation_limit:
learning_intent: active-study | future-reference | background-reading | review | archive-only | unknown
learning_state: not-started | saved | skimmed | studied | practiced | applied | validated | unknown
counts_as_progress: true | false
priority: low | medium | high | unknown
progress_evidence: user-stated | source-note | exercise | project-use | repeated-use | assessment | inference | none
status: new | ingested | needs-review
tags: []
---

# {Title}

## User Context

Why the user saved this link, if provided.

## URL

Original URL:

## Evidence Package

Do not paste the full linked content by default. A URL-only submission is not the full original linked content. Preserve source metadata, user context, AI core extraction, key supported claims, selected short excerpts or anchors, and fetch status. If fetching failed, record the failure and keep the URL plus user-provided context.

If the user marked the source as important (`important`, `importent`, `非常重要`, `重要`, or equivalent), preserve core information carefully. If URL-linked or fetched content is very large, keep `archive_policy: excerpted` and use `preservation_limit: core-extraction-500-zh-chars` instead of full text. If the user pasted or uploaded the linked content itself, preserve that user-provided payload verbatim in `## Raw Material` or use `system/templates/source-note.md`.

## Content Form And Subject

- Content form:
- Primary subject:
- Candidate source type:
- Candidate wiki domains:

## Learning / Skill Progress

Use this section only if the link is part of a skill tree or learning workflow.

- Learning intent:
- Learning state:
- Counts as progress:
- Priority:
- Progress evidence:

Saved-for-later, not-started, and skimmed links do not count as learning progress. They may be added to `Saved For Later`, but not to `Recently Learned`.

## AI Core Extraction

Concise extraction of what matters, grounded in the evidence package.

For very large important content, this section must be capped at 500 Chinese characters.

## Extracted Claims

Only list claims that are supported by the fetched/source text or explicit user context.

## Evidence Excerpts / Anchors

Short excerpts, section headings, timestamps, message IDs, or anchors that support the extracted claims.

## Open Questions

## Potential Wiki Targets
```
