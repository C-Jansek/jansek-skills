---
name: specify
description: Mould a raw idea into an issue ready to pick up by a human or agent.
disable-model-invocation: true
---

A raw idea comes in. Before it can be implemented, the following must be made clear in order:

1. What is the goal of this change?
2. How will this change interface with the rest of the application?
3. How will we verify the change succeeded?

We store this information in the configured issue tracker. If there is none configured (see AGENTS.md), ask the user.

### Goal of the change

Find out the goal of the change by /grilling the user.
This can be fixing a bug in the system, filling an additional need the user has, refactoring existing functionality etc.

### Define the interface

Define the interface together with the user.
Start asking them to sketch the rough interface they already have in mind.

Now use a subagent to explore the codebase to see how this interface aligns within the existing application.
- What are the existing data structures connected to this goal?
- What are the existing modules and (testing) seams?

Then finalize the interface with them using /grilling. The interface consists of:

- Modeling any data structure(s) that need to be added/changed
- Modeling any modules and public entrypoints to the modules that need to be added/changed.

### Define acceptance criteria

Define the acceptance criteria together with the user, based on the goal of the change and the interfaces you defined.
The acceptance criteria must include verification that the goal of the change was achieved.
It must also include automated tests along the interface boundaries to verify the designed interfaces are implemented.

Make a proposal and then refine it together with the user.

Verification methods you can use:
- Automated tests
- User flows derived from the goal of the change (automated, tested by agent, tested manually by human)

### Store an artifact

Use the configured issue tracker for the project to store the information such that it can later be picked up by either
a fully autonomous agent or by a human, perhaps with help from an agent.

An agent can implement if its blast radius is confined to one location, and there are no design decisions left.
The blast radius is the potential impact or scope of the changes introduced by this PR. Consider all possibilities. 
Examples are layout shift, breakages for consumers, mobile responsiveness, etc.

Otherwise, explain why you think a human should implement it.