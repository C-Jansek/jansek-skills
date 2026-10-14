---
name: principle-context-not-control
description: "Principle: engineer the environment to promote good behavior over micromanaging. Use when another skill or the user explicitly directs you to use this skill."
---

### Goal

Engineer the environment (context) such that the easy way to do something is also the best way to do something.

Built on the idea that humans and agents prefer to do things lazily.

### Solution

This goes both ways:

- Make wanted ways to do something easy
- Make unwanted ways to do something impossible or at least difficult

Making wanted ways easy is the best way.
Preferably through deterministic tools, such as strict typing systems.
If not available deterministically, generators, style-guides, skills and documentation can be used instead.

Making unwanted ways impossible is always done through deterministic checks.
For example, by setting up linters, formatters or tests.
Preferably with an instruction of what to do instead.

Making unwanted ways difficult can be done by indeterministic checks,
For example, style-guides, skills, documentation instructions.
Preferably with an instruction of what to do instead.

### Priorities

Reach for them in this order:

1. Make wanted ways to do something easy (deterministically)
2. Make unwanted ways to do something impossible (deterministically)
3. Make wanted ways to do something easy (indeterministically)
4. Make unwanted ways to do something difficult (indeterministically)
