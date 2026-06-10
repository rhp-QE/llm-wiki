# LLM Wiki Resolver

Use this file to decide which workflow and domain rules apply.

## Workflow Routing

| Intent | Workflow | Read |
| --- | --- | --- |
| "处理 inbox", "入库", "ingest", "沉淀这个" | Ingest | `system/skills/llm-wiki/SKILL.md`, target domain `AGENTS.md` |
| "分析我", "总结我", "复盘", "查一下我的 wiki" | Query | `wiki/index.md`, relevant pages |
| "检查 wiki", "lint", "断链", "重复实体" | Lint | `system/maintenance.md`, `system/evals/lint-checklist.md` |
| "迁移", "初始化", "导入旧笔记", "全量导入", "setup" | Setup / Migration | `system/lifecycle.md`, `system/templates/migration-report.md` |
| "生成报告", "briefing", "pulse", "task report", "周报" | Report | `system/lifecycle.md`, `wiki/reports/AGENTS.md` |
| "新增领域", "改 schema", "调整目录" | Schema change | `AGENTS.md`, `system/conventions.md`, existing domain rules |

## Domain Routing

| Signal | Domain |
| --- | --- |
| Person, nickname, family term, colleague, thinker | `wiki/people/` |
| Time-bound episode, decision, turning point | `wiki/events/` |
| Repeated life pattern or long-running concern | `wiki/themes/` |
| Thinking tool or bias | `wiki/models/` |
| Programming, tools, repos, architecture | `wiki/tech/` |
| Study progress, review, exercises | `wiki/learning/` |
| Article, script, content idea | `wiki/writing/` |
| Engineering practice from experience | `wiki/craft/` |
| Reusable question and answer | `wiki/qa/` |
| Principle, value, self-observation | `wiki/reflections/` |
| Ongoing initiative with state | `wiki/projects/` |
| Briefing, pulse, task report, migration report, health check output | `wiki/reports/` |

## Tie-Breaking

1. Prefer the primary subject, not the source format.
2. Prefer updating an existing page over creating a duplicate.
3. If one note touches multiple domains, archive once in `sources/`, then update multiple compiled pages.
4. If uncertain, create a `needs-review` note and list the ambiguity in `wiki/log.md`.

## Mutating Preflight

Before any ingest, schema change, migration sample, or query-derived update:

1. State the workflow and whether it is read-only or mutating.
2. State the source destination or confirm the source already exists.
3. State the target domains and nearest `AGENTS.md` files to read.
4. Check existing pages and aliases before creating new pages.
5. For complex or multi-domain ingest, use `system/templates/ingest-plan.md`.
6. For ingest, complete `system/evals/ingest-checklist.md` before final response.

## Incremental vs Stock

Use `Ingest` for a small number of new notes, links, or files.

Use `Setup / Migration` when:

- The user wants to initialize a wiki from old material.
- There are many historical files.
- Source folders or old systems need mapping.
- The task needs sample import before full import.
- The output should include a migration report.

Do not run full import before sample validation.
