---
name: shape
description: Shape a raw idea into a Pitch — a bet-ready document at the right level of abstraction: rough, solved, bounded.
disable-model-invocation: true
---

A raw idea has arrived — a feature request, a problem, a product concept. Shaping is finding the right level of abstraction: concrete enough that a team knows what to build, yet rough enough they have room to work out the details themselves. This skill produces a **Pitch** — the frozen handoff to `/deliver`.

The Pitch is not a spec. It is deliberately incomplete: it defines the problem, sketches a solution at fat-marker fidelity, patches visible rabbit holes, declares what's out of bounds, and sets the appetite. It leaves room for the team to discover scopes and tasks through building.

## Shape, don't build

The shape skill produces a Pitch, not working software. Research backs decisions with evidence; nothing is implemented. The pull to build — to prototype an interaction, to code a spike — is the signal the shaping is done and it's time to hand off to `/deliver`.

## Refer by name

Every Pitch and ticket is an issue with a title. Refer by name, never by bare id, number, or slug. The id and URL ride inside the name, never stand in for it.

## The Pitch

The Pitch is a single issue on the issue tracker, labelled `pitch`. It is the canonical artifact — frozen once handed off to `/deliver`.

### Pitch body

```markdown
## Problem

<the raw idea, the baseline, the specific pain point. A single story that shows why the status quo doesn't work.>

## Solution

<fat-marker sketch of the solution — breadboards for flows, annotated sketches for visual concepts, a list of key elements. Rough, solved, bounded. Not wireframes.>

## Rabbit holes

<details worth calling out to avoid problems. Technical unknowns patched. Design decisions made now to prevent the team getting stuck.>

## No-gos

<what's intentionally excluded. Functionality or use cases we're not covering to fit the appetite or make the problem tractable.>

## Appetite

<time budget. Small batch (1-2 weeks) or big batch (full cycle). Set *last*, after the Pitch is written.>
```

Each section earns its place: the Problem anchors fitness tests; the Solution describes at the macro level; Rabbit holes and No-gos are the guard rails; the Appetite constrains what "good" means.

## Research tickets

Research backs Pitch decisions with evidence — market data, technical feasibility, user behavior. Research tickets are child issues of the Pitch, labelled `research`. The Pitch stands alone; research tickets are consulted only when a Pitch decision is questioned.

## Invocation

### Shape a raw idea

User invokes with a loose idea — an unshaped feature, problem, or product concept.

1. **Settle the problem.** Grill the user (`/grilling`): What's the raw idea? What's the baseline — what are users doing without this? What's the specific pain point? Narrow from "build a calendar" to "help me see free spaces." Use `/domain-modeling` for any fuzzy domain terms. Completion: problem statement written, user confirms it captures the need.

2. **Sketch the solution.** At fat-marker fidelity: breadboards for flows (places, affordances, connection arrows), fat marker sketches for visual concepts. Move fast, cover breadth. Output: a list of elements — the key components and connections. Not wireframes, not pixel-perfect mockups. Completion: solution sketch exists, user confirms the direction.

3. **Address rabbit holes and no-gos.** Walk the solution in slow motion. Where could a team get stuck? What are we assuming? Declare out of bounds. Cut back anything unnecessary. For fact-based questions a decision hangs on (market data, technical feasibility), spawn research sub-tickets under the Pitch. Completion: rabbit holes and no-gos sections written, research tickets created.

4. **Write the Pitch.** Assemble all five ingredients into a single issue labelled `pitch`. Link child research tickets from the Pitch as backing, not required reading. Completion: Pitch issue created, all sections filled.

5. **Set the appetite.** Last. Is this worth a small batch or a big batch? The appetite constrains what "good" means — the solution is only "good" relative to the time budget. Completion: appetite written, user confirms.

6. **Stop.** The Pitch is a handoff. The `/deliver` skill takes it from here.
