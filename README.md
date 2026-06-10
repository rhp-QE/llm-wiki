# Personal LLM Wiki

This repository is a local, Markdown-first personal knowledge system. It is designed for both human reading in Obsidian and agent operation through Codex or another coding agent.

The core idea is simple:

- `inbox/` receives low-friction notes and mobile drops.
- `sources/` stores original materials as read-only evidence.
- `wiki/` stores compiled knowledge pages that can be read, linked, queried, and maintained.
- `system/` stores the operating rules, templates, evals, and the local `llm-wiki` skill.

Start here:

1. Drop new material into `inbox/`.
2. Ask the agent: `处理 inbox，按 llm-wiki ingest 入库。`
3. Query through `wiki/index.md`, then deep-read linked pages.
4. Run lint periodically to check links, sources, duplicate entities, and stale pages.

Ingest is gated by `system/evals/ingest-checklist.md`: the agent should preserve sources, declare routing, check existing pages and aliases, follow domain schemas, fix citations, update links, and log the mutation.

Global Codex skill installed:

- Skill source in this repo: `system/codex-skills/llm-wiki/SKILL.md`
- Installed skill path: `/root/.codex/skills/llm-wiki/SKILL.md`

In a fresh Codex session, you should not need to paste a bootstrap prompt. Use natural requests such as:

```text
处理 inbox，按 llm-wiki ingest 入库。
```

```text
把下面这段内容沉淀到我的 llm_wiki。
```

Or use short command-style prompts:

```text
/wiki-ingest
```

```text
/wiki-query 复习 Go defer
```

```text
/wiki-lint
```

```text
/wiki-migrate 迁移这批旧笔记，先做小样本
```

```text
/wiki-report 生成本周学习报告
```

`START_HERE.md` remains as a manual fallback if the skill is unavailable in a future environment.

The intended operating loop is:

```text
Capture -> Ingest plan -> Preserve source -> Enrich -> Link -> Citation check -> Log -> Query -> Lint -> Refine
```

For daily incremental use, the lifecycle is:

```text
user input / cron -> Resolver -> query OR ingest -> enrichment -> citation fixing -> maintenance -> report
```

For historical setup or migration, the lifecycle is:

```text
setup / migration -> inventory -> mapping -> sample import -> validation -> full import -> rebuild -> health check -> migration report
```

This wiki currently contains the scaffolding and operating system. It does not yet contain your full personal notes. Add raw materials under `inbox/` or `sources/`, then run the ingest workflow.
