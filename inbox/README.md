# Inbox

Drop low-friction notes here before they are processed.

Good inbox items can be messy. Prefer capture over formatting.

When the user invokes `inbox`, `暂存`, or asks to put material here, only save the material in `inbox/`. Do not archive it to `sources/`, do not organize `wiki/`, and do not enrich it until the user explicitly calls `ingest`, `入库`, `沉淀到 wiki`, or `处理 inbox`.

`inbox/` is not an archive. After an item is ingested, its raw material must be preserved under `sources/`, and the processed inbox file must be removed. For user-provided material, the later source must preserve the original inbox payload verbatim in `## Raw Material`; grouping may add fragment headings and metadata, but must not rewrite fragment bodies. A clean inbox should contain only unprocessed drops plus `README.md` and templates.

Useful fields when available:

- Date
- Source or URL
- Type: use `diary` / `日记` only when you want the later Ingest to treat the fragment as diary
- Importance: use `important`, `importent`, `重要`, or `非常重要` when the later Ingest should preserve core information more carefully
- Topic
- What you learned
- What confused you
- Why it matters to you

For URL-only captures, save only the URL, capture time, and any user-provided context. Do not fetch, summarize, classify, or route the URL until explicit Ingest.

Diary classification is explicit. Later Ingest must not infer diary from emotion, daily routine, first-person writing, or "today" alone. Use `Type: diary`, `日记`, or a diary-marked title/filename when the fragment is meant to be diary.

Example:

```markdown
# 2026-06-09 Go defer

今天学了 Go 的 defer：

- defer 在函数返回前执行。
- 多个 defer 后进先出。
- defer 参数在注册时求值。

来源：https://example.com/go-defer
疑问：defer 和 return 的执行顺序到底是什么？
```

Ask the agent:

```text
inbox
{raw fragment}
```

This only captures the fragment.

To process the queue later, ask:

```text
处理 inbox，按 llm-wiki ingest 入库。
```

During later Ingest, the agent must inventory and group compatible inbox fragments before creating sources. It should not create one source per small fragment by default. Group only when source type, date/topic, and origin/context are compatible, and preserve fragment IDs plus original inbox paths. Do not merge diary with learning or any other source type.

For later URL Ingest, the URL is only the delivery/origin. A URL-only capture is not the full original article/chat/page. The agent must inspect or preserve linked evidence when possible, then classify by content form and primary subject. Links may become article, chat, media, learning, note, project, Q&A, reflection, or other sources; do not assume every link is tech learning. The later source should usually be a bounded evidence package, not the full linked text.

If a URL or chat is marked important, later Ingest should preserve the core information carefully. If URL-linked or fetched content is very large, the fallback is not full archival: keep a 500 Chinese character core extraction plus evidence anchors. If the user pasted the chat/article content itself into inbox, preserve that pasted payload verbatim under `sources/`.
