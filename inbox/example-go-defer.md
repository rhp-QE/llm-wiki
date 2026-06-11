# Example: Go defer 投递样例

这是一个投递格式示例，不是正式个人知识。

```text
/wiki ingest
今天学了 Go 的 defer：
1. defer 会在函数返回前执行
2. 多个 defer 是后进先出
3. defer 的参数会在注册时求值

例子：
func main() {
  i := 0
  defer fmt.Println(i)
  i++
}

输出是 0。

来源：https://example.com/go-defer
我的疑问：defer 和 return 的执行顺序到底是什么？
```
