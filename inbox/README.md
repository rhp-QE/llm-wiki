# Inbox

Drop low-friction notes here before they are processed.

Good inbox items can be messy. Prefer capture over formatting.

Useful fields when available:

- Date
- Source or URL
- Topic
- What you learned
- What confused you
- Why it matters to you

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
处理 inbox，按 llm-wiki ingest 入库。
```
