---
type: source
source_type: article
title: Karpathy LLM Wiki gist
origin: inbox URL
created: 2026-06-11
captured: 2026-06-11 00:36:11 +0800
status: ingested
delivery: url
original_payload: url-only
raw_preservation: evidence-package
content_form: gist
original_url: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
accessed: 2026-06-11
fetch_status: fetched
archive_policy: excerpted
coverage: partial
importance: normal
learning_intent: future-reference
learning_state: saved
counts_as_progress: false
priority: medium
progress_evidence: user-saved-url
tags:
  - llm-wiki
  - knowledge-management
  - obsidian
  - agent
---

# Karpathy LLM Wiki gist

## Raw Material

### Fragment f001

- Original inbox path: `inbox/2026-06-11-karpathy-gist.md`
- Original order: 1
- Captured: 2026-06-11 00:36:11 +0800

```text
https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
```

## URL / Origin

- Original URL: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
- Accessed: 2026-06-11
- Fetch status: fetched
- Archive policy: excerpted
- Coverage: partial, bounded evidence package only
- Gist metadata observed: author `karpathy`, file `llm-wiki.md`, created 2026-04-04.

## AI Core Extraction

Karpathy's gist describes an LLM-maintained personal wiki pattern. Its central distinction is between raw immutable sources and a compiled, interlinked wiki layer that the LLM updates over time. Instead of re-deriving knowledge from raw chunks on every query, the agent ingests new sources, updates entity/topic pages, records contradictions, and maintains indexes/logs. The pattern treats Obsidian or a Markdown directory as the human browsing surface, while the LLM acts as the maintainer.

## Evidence Excerpts / Anchors

- Title anchor: `LLM Wiki`
- Short description: "A pattern for building personal knowledge bases using LLMs."
- Section anchors observed: `The core idea`, `Architecture`, `Operations`, `Indexing and logging`, `Optional: CLI tools`, `Tips and tricks`, `Why this works`, `Note`.
- Supported claims:
  - The pattern has three layers: raw sources, wiki, and schema/instructions.
  - Ingest updates the wiki and log after new source material arrives.
  - Query reads the compiled wiki first and can produce new filed outputs.
  - Lint periodically checks contradictions, stale claims, orphan pages, missing cross-references, and gaps.

## Why It Was Captured

The user's local LLM-wiki is implementing the same broad pattern: source preservation, compiled Markdown pages, domain rules, index pages, log entries, and agent-maintained maintenance workflows.

## Learning / Skill Progress

- Learning intent: future-reference
- Learning state: saved
- Counts as progress: false
- Priority: medium
- Progress evidence: user saved the URL for later ingest; this source alone does not prove new study, practice, or mastery.

## Potential Wiki Targets

- `wiki/projects/personal-llm-wiki.md`
- `wiki/tech/llm/llm-wiki-pattern.md`
- `wiki/learning/agent-development/agent-development-learning.md`
