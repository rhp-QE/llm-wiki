---
type: concept
title: Loop Engineering
aliases:
  - loop-engineering
  - Dynamic Workflow
  - agent workflow orchestration
language:
status: learning
learning_state: saved
progress_evidence:
  - sources/articles/2026-06-11-agent-workflow-feishu-links.md
tags:
  - llm
  - agent
  - workflow
  - orchestration
created: 2026-06-11
updated: 2026-06-11
---

# Loop Engineering

## Compiled Truth

Loop Engineering is a saved agent-design reference about moving stable repeated tasks from model-improvised ReAct loops toward explicit workflow orchestration.

The captured Feishu article frames Dynamic Workflow as model-generated or model-assisted code that fixes phase order, loops, branches, logging, validation, and stop/resume behavior, while reserving LLM calls for judgment-heavy substeps.

## Why It Matters

For agent products, the distinction matters because natural-language skills are flexible but can be unstable at runtime. A workflow can make repeated work more observable, resumable, and cheaper to execute when the structure is known.

For the user's [[personal-llm-wiki]], this suggests a possible evolution path: recurring ingest, lint, task update, and report flows could eventually become explicit workflow scripts instead of only instruction-following skills.

## Examples

- Current state: the local llm-wiki uses skill instructions and checklists to guide agents through ingest.
- Possible future workflow: inventory inbox, group fragments, archive sources, update compiled pages, run checks, clear processed inbox, and write the monthly log as a deterministic sequence with explicit validation points.

## Mastery Evidence

- Saved reference only: `sources/articles/2026-06-11-agent-workflow-feishu-links.md`
- Learning state: saved.
- Counts as progress: false in the source evidence.
- Needs evidence before marking this page as `understood`, `applied`, or `validated`.

## Common Pitfalls

- Prematurely turning every task into a workflow before the repeated shape is known.
- Hiding model judgment inside opaque scripts without logs or intervention points.
- Calling something a workflow when it is only a prompt checklist.
- Treating saved article content as proof of implementation.

## Related Concepts

- [[llm-wiki-pattern]]
- [[octopus-style-agent]]
- [[personal-llm-wiki]]
- [[wiki/learning/agent-development/agent-development-learning|Agent Development Learning]]

## Q&A

Q: When should a skill become a workflow?

A: When the task repeats, has a stable phase order, and benefits from explicit state, validation, logs, and stop/resume points.

Q: What should remain with the model?

A: Judgment-heavy steps such as classification, synthesis, conflict handling, and final explanation can remain model calls inside the workflow.

## Sources

- `sources/articles/2026-06-11-agent-workflow-feishu-links.md`
