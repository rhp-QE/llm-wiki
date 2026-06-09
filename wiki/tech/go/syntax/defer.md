---
type: syntax
title: Go defer
aliases:
  - defer
  - Go deferred call
language: go
status: example
tags:
  - go
  - syntax
  - control-flow
created: 2026-06-09
updated: 2026-06-09
---

# Go defer

This is an example compiled page generated from the example inbox note. Replace `status: example` after real study material is ingested.

## Compiled Truth

`defer` schedules a function call to run when the surrounding function is about to return. Multiple deferred calls run in last-in, first-out order.

The arguments to a deferred function call are evaluated when the `defer` statement is executed, not when the deferred call later runs.

Source: `sources/learning/go/2026-06-09-go-defer-example.md`

## Why It Matters

`defer` is commonly used for cleanup, unlocking, closing files, tracing, and recovery-related patterns. Misunderstanding evaluation timing can cause surprising output or stale values.

## Examples

```go
func main() {
  i := 0
  defer fmt.Println(i)
  i++
}
```

The deferred call receives `i` as an argument when the `defer` statement is executed, so this prints `0`.

## Common Pitfalls

- Assuming deferred call arguments are evaluated at the end of the function.
- Assuming multiple deferred calls run in written order.
- Forgetting that named return values can still be modified by deferred functions.

## Related Concepts

- [[go-defer-return-order]]
- [[wiki/learning/go/index|Go Learning]]

## Q&A

- [[go-defer-return-order]]

## Sources

- `sources/learning/go/2026-06-09-go-defer-example.md`
