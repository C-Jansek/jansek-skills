---
name: specify
description: Mould a raw idea into an issue ready to pick up by a human or agent.
disable-model-invocation: true
---

A raw idea comes in. Before it can be implemented, the following must be made clear in order:

1. What is the goal of this change?
2. How will this change interface with the rest of the application?
3. How will we verify the change succeeded?

We store this information in the configured issue tracker. If there is none configured, ask the user.

### Goal of the change

Find out the goal of the change by /grilling the user.
This can be fixing a bug in the system, filling an additional need the user has, refactoring existing functionality etc.

### Define the interface

Define the interface together with the user.
Start asking them to skets the rough interface they already have in mind.

Then finalize the interface with them using /grilling. The interface consists of:

- Modeling any data structure(s) that need to be added/changed
- Modeling any modules and public entrypoints to the modules that need to be added/changed.

### Define acceptance criteria

Define the acceptance criteria together with the user, based on the goal of the change and the interfaces you defined.
Make a proposal and then refine it together with the user.

The proposal can include:
- Automated tests along the interface boundaries
- User flows derived from the goal of the change (automated, tested by agent, tested manually by human)

### Store an artifact

Use the configured issue tracker for the project to store the information such that it can later be picked up by either
a fully autonomous agent (assign `ready-for-agent`) or by a human, perhaps with an agent (assign `ready-for-human`).
Assign it to an agent if it is a clear, compact change. Otherwise, explain why you assigned it to a human.