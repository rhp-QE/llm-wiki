---
type: qa
question: defer 和 return 的执行顺序是什么？
topics:
  - go
  - defer
  - return
status: example
created: 2026-06-09
updated: 2026-06-09
---

# defer 和 return 的执行顺序是什么？

This is an example Q&A page generated from the example Go defer note.

## Question

defer 和 return 的执行顺序到底是什么？

## Short Answer

In Go, return value preparation happens before deferred calls execute, and the actual function return happens after deferred calls finish. Deferred function call arguments are evaluated earlier, at the moment the `defer` statement is executed.

## Explanation

For a normal return, think of the flow as:

1. Evaluate return values or assign named return values.
2. Run deferred calls in LIFO order.
3. Return to the caller.

This distinction matters because a deferred closure can observe or modify named return values, while a deferred call with regular arguments captures those argument values when `defer` is registered.

## Example

```go
func main() {
  i := 0
  defer fmt.Println(i)
  i++
}
```

The deferred call's argument is evaluated when `defer fmt.Println(i)` runs, so it prints `0`.

## Related Pages

- [[defer]]
- [[wiki/learning/go/go-learning|Go Learning]]

## Sources

- `sources/learning/go/2026-06-09-go-defer-example.md`
