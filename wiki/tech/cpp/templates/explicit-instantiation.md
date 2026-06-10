---
type: syntax
title: C++ template explicit instantiation
aliases:
  - C++ 显式实例化
  - C++ 模板显式实例化
  - C++ 模板显示实例化
  - explicit template instantiation
language: cpp
status: learning
tags:
  - cpp
  - templates
  - compilation
created: 2026-06-09
updated: 2026-06-09
---

# C++ template explicit instantiation

## Compiled Truth

User-stated learning: C++ 模板的显式实例化可以把模板实现放到 `.cc` 文件内，减少 `.h` 文件膨胀。

Source: `sources/learning/cpp/2026-06-09-cpp-template-explicit-instantiation.md`

Evidence boundary: the source records the learning point. The caveats and example below are agent-added background and should be validated in a real C++ build before treating them as applied project knowledge.

## Why It Matters

Template implementations are often kept in headers because the compiler needs the definition when instantiating templates for concrete types. Explicit instantiation is useful when the supported set of template arguments is known ahead of time: the `.cc` file owns those concrete instantiations, while the header can stay smaller.

## Examples

Header declares the template:

```cpp
// add.h
#pragma once

template <typename T>
T add(T lhs, T rhs);
```

Implementation and explicit instantiation live in the `.cc` file:

```cpp
// add.cc
#include "add.h"

template <typename T>
T add(T lhs, T rhs) {
  return lhs + rhs;
}

template int add<int>(int, int);
template double add<double>(double, double);
```

With this shape, callers can use `add<int>` and `add<double>` without seeing the template body in the header. A call such as `add<std::string>` would need its own explicit instantiation or the definition must be available to the calling translation unit.

## Common Pitfalls

- Treating a hidden `.cc` template definition as if it supports arbitrary template arguments.
- Forgetting the explicit instantiation definition, which typically shows up as a linker error.
- Moving implementations out of headers before knowing which concrete template arguments need to be supported.
- Confusing explicit instantiation definitions with `extern template`, which suppresses implicit instantiation but does not create code by itself.

## Related Concepts

- [[wiki/learning/cpp/cpp-learning|C++ Learning]]
- [[cpp-template-explicit-instantiation-cc]]

## Q&A

- [[cpp-template-explicit-instantiation-cc]]

## Sources

- `sources/learning/cpp/2026-06-09-cpp-template-explicit-instantiation.md`
