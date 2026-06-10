---
type: source
source_type: article
title: Feishu agent workflow and distributed agent architecture links
origin: inbox URLs
created: 2026-06-11
captured: 2026-06-11 00:50:47 +0800
status: ingested
delivery: url
original_payload: url-only
raw_preservation: evidence-package
content_form: article
original_url:
  - https://my.feishu.cn/wiki/ToaRw8BAUiAyFFkR3EAc05atnsg
  - https://my.feishu.cn/docx/L6kmdHxPAoJi90x0UWucCnvKnEh
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
tags: [agent, loop-engineering, workflow, distributed-agent, harness]
---

# Feishu agent workflow and distributed agent architecture links

## Raw Material

### Fragment f001

- Original inbox path: `inbox/2026-06-11-feishu-links.md`
- Original order: 1
- Captured: 2026-06-11 00:50:47 +0800

```text
https://my.feishu.cn/wiki/ToaRw8BAUiAyFFkR3EAc05atnsg
https://my.feishu.cn/docx/L6kmdHxPAoJi90x0UWucCnvKnEh
```

## URL Evidence Package

### Link A

- URL: https://my.feishu.cn/wiki/ToaRw8BAUiAyFFkR3EAc05atnsg
- Title: Harness 101：Loop Engineering—从 ReAct 到 Orchestration
- Document ID: OqrvdOfuhoaIf6xqplNcFYWbndh
- Revision ID: 799
- Accessed: 2026-06-11
- Fetch status: fetched via Feishu document API
- Archive policy: bounded extraction only; full external article text is not archived.

Anchors observed:

- 前言
- 从 ReAct 到 Orchestration
- Skill 与 Dynamic Workflow 的分水岭
- 一段深度研究 Workflow
- agent() 的两个参数
- 哪些是代码，哪些是模型
- Workflow 的解剖
- 让人留在 Loop 里
- 再看一个例子：视频生成
- 总结

Core extraction:

- The article frames "Loop Engineering" as a shift from one-shot prompting and ReAct-style interactive loops to model-generated, deterministic workflow scripts.
- Skills leave more runtime structure to the model; workflows encode structure in executable code and call language models through explicit functions such as `agent()` and validation points such as `assert()`.
- The proposed benefits are stability, reuse, observability, cheaper runtime models, and clearer human-in-the-loop intervention points.

### Link B

- URL: https://my.feishu.cn/docx/L6kmdHxPAoJi90x0UWucCnvKnEh
- Title: 章鱼给 AI Agent 的一课：真正的智能，不只住在“大脑”里
- Document ID: L6kmdHxPAoJi90x0UWucCnvKnEh
- Revision ID: 275
- Accessed: 2026-06-11
- Fetch status: fetched via Feishu document API
- Archive policy: bounded extraction only; full external article text is not archived.

Anchors observed:

- TLDR
- 章鱼不是“九个脑子”
- 吸盘不是“按钮”
- 章鱼腕会“自己做动作”
- 中央脑依然重要
- Agent 不缺“大脑”，缺的是“身体”
- 什么是“章鱼式 Agent”
- 结语
- 延伸阅读

Core extraction:

- The article uses octopus cognition as an analogy for agent system design: a central model should not micromanage every low-level action.
- A stronger agent system separates central planning, strategy, and arbitration from local executors that handle sensing, retries, validation, and tool-specific action.
- Skills can be understood as reusable action programs carried by semi-autonomous executors rather than as pure prompt fragments.

## Why Captured

These links connect to the user's ongoing agent-development learning and personal LLM-wiki work. They are saved references, not yet mastery evidence.

## Potential Targets

- [[agent-development-learning]]
- [[llm-wiki-pattern]]
- [[loop-engineering]]
- [[octopus-style-agent]]

## Notes

- Keep derived claims tied to this evidence package or the original URLs.
- Do not treat this source as proof that the user has implemented these patterns.
