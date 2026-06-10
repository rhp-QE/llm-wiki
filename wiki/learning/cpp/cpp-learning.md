---
type: learning_path
title: C++ Learning
domain: cpp
status: learning
focus: unknown
priority: unknown
created: 2026-06-09
updated: 2026-06-10
---

# C++ Learning

## Goal

Build practical C++ language and compilation-model knowledge that helps with real implementation decisions.

## Current Focus

Focus priority is not explicitly stated. Existing evidence records one studied C++ template topic.

## Current Level

Early tracked learning signal. Current source evidence records one C++ template topic: explicit instantiation.

## Map

- Templates and instantiation
- Translation units, headers, and linking
- Ownership of implementation between `.h` and `.cc`
- Compile-time cost and header hygiene

## Saved For Later

- None recorded.

## Recently Learned

- C++ 模板的显式实例化可以把实现放到 `.cc` 文件里，从而减少 `.h` 膨胀。见 [[explicit-instantiation|C++ template explicit instantiation]].

## Weak Spots

- Exact syntax difference between explicit instantiation definitions and `extern template`.
- How missing explicit instantiations surface during compilation or linking.
- When header-only templates are still the simpler engineering choice.

## Review Queue

- Explain why templates are commonly implemented in headers.
- Explain what concrete type set must be known before moving a template implementation into `.cc`.
- Predict what happens when code uses a template argument that was not explicitly instantiated.

## Practice Tasks

- Write a tiny template function split across `add.h` and `add.cc`, then explicitly instantiate `int` and `double`.
- Try calling the same template with an uninstantiated type and record the compiler or linker behavior.

## Linked Knowledge

- [[explicit-instantiation|C++ template explicit instantiation]]
- [[cpp-template-explicit-instantiation-cc]]

## Sources

- `sources/learning/cpp/2026-06-09-cpp-template-explicit-instantiation.md`
