---
type: qa
question: C++ 模板显式实例化怎样把实现放到 .cc 文件里？
topics:
  - cpp
  - templates
  - explicit-instantiation
status: partial
created: 2026-06-09
updated: 2026-06-09
---

# C++ 模板显式实例化怎样把实现放到 .cc 文件里？

## Question

C++ 模板显式实例化怎样把实现放到 `.cc` 文件里，并避免 `.h` 膨胀？

## Short Answer

把模板声明留在头文件，把模板定义放进 `.cc`，然后在 `.cc` 里为需要支持的具体类型写显式实例化定义。这样调用方不需要在头文件里看到完整实现，但只能直接使用已经实例化过的类型组合。

## Explanation

普通模板通常需要在使用点看到定义，因为编译器要根据具体类型生成代码。显式实例化把这一步集中到某个 `.cc` 文件中：那个文件包含模板定义，并明确要求编译器生成某些具体实例。

This answer is marked `partial` because the source is a short learning note, not a validated project example.

## Example

```cpp
// add.cc
template <typename T>
T add(T lhs, T rhs) {
  return lhs + rhs;
}

template int add<int>(int, int);
```

## Related Pages

- [[explicit-instantiation|C++ template explicit instantiation]]
- [[wiki/learning/cpp/index|C++ Learning]]

## Sources

- `sources/learning/cpp/2026-06-09-cpp-template-explicit-instantiation.md`
