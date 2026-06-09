---
type: source
source_type: learning
title: Go defer learning example
origin: inbox/example-go-defer.md
created: 2026-06-09
captured: 2026-06-09
status: example
rating:
tags:
  - go
  - defer
  - example
---

# Go defer learning example

This is an example source showing how a raw learning note should be preserved before compiled pages are updated.

## Raw Material

今天学了 Go 的 defer：

1. defer 会在函数返回前执行。
2. 多个 defer 是后进先出。
3. defer 的参数会在注册时求值。

例子：

```go
func main() {
  i := 0
  defer fmt.Println(i)
  i++
}
```

输出是 `0`。

## Question

defer 和 return 的执行顺序到底是什么？
