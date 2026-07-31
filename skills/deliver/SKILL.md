---
name: deliver
description: Take a shaped Pitch and deliver it — get one piece done, map scopes as they emerge, build uphill through unknowns then downhill through implementation.
disable-model-invocation: true
---

A Pitch is in hand — shaped, bounded, de-risked. Delivering means building one vertical slice at a time, discovering scopes through the work itself. Scopes are not pre-planned; they emerge as you walk the territory. The scope map is the living artifact — always up to date, always the first thing read.

This skill delegates implementation to `/implement`, design probes to `/prototype`, and fact-finding to `/research`. The human stays in the lead: the agent proposes, the human decides.

## Assign projects, not tasks

The Pitch is the team's whole project. The scope map emerges through building — scopes are discovered, not imagined up front. Trust the process: imagined tasks graduate to discovered only through real work. The agent never splits the Pitch into a master task list; it helps the user carve scopes as patterns emerge.

## Refer by name

Every Pitch, scope map, and ticket is an issue with a title. Refer by name, never by bare id, number, or slug.

## The scope map

The scope map is a single issue, labelled `scope-map`, child of the Pitch. It is the living index — always current, always loaded first.

### Map body

```markdown
## Appetite

<time budget, carried from the Pitch.>

## Codebase context

<from first session: key files to read, relevant patterns, integration points, orientation notes. Updated whenever new context is discovered.>

## Scopes

<!-- one subheading per scope. Each scope carries an uphill/downhill marker. -->
<!-- Tickets are markdown checklist items. Prefixes: (none)=discovered, ?=imagined, ~=nice-to-have. -->
<!-- When a task has a child ticket, replace the inline text with a linked name. -->

### <Scope name> <!-- uphill -->

- [ ] <discovered task>
- [ ] ? <imagined task>
- [ ] ~ <nice-to-have>
- [<child ticket title>](link)
```

### Scopes

A **scope** is a theme — a meaningful part of the project that can be finished independently. It contains implementation, research, and prototype tasks. Scopes are carved from discovered-task clusters, not invented ahead of time. The map's `## Scopes` section lists them as subheadings.

When a scope's boundaries shift or new scopes form, edit the map's scopes in place. Redraw, rename, reorganize.

### Tickets

Each checklist item in a scope graduates to a **child ticket** (of the map) when it accumulates enough detail to stand alone. Before that, it lives inline. Ticket types:

- **Implementation** — downhill work. Delegate to `/implement`.
- **Research** — reading, investigating, fact-finding. Resolve with `/research`.
- **Prototype** — throwaway code to answer a design question. Resolve with `/prototype`.

### Prefixes

- (none) — **Discovered task**. Verified through building. Ready to pick up.
- `?` — **Imagined task**. Suspected, not verified. Only pickable when no discovered tasks remain.
- `~` — **Nice-to-have**. Always last. Cut when appetite presses.

Priority: discovered before imagined before nice-to-haves.

## Uphill and downhill

Every scope moves through two phases:

- **Uphill**: unknowns exist. Design decisions unmade. Questions unresolved. Work is research, prototypes, clarifying imagined tasks. Discovery happens here.
- **Downhill**: unknowns resolved. Designs settled. Work is execution — implementation, polish, small edits.

A scope's heading in the map carries `<!-- uphill -->` or `<!-- downhill -->`. The phase shifts when unknowns clear — update it on the map.

## Appetite

The agent reminds, the human manages. When adding tasks: is this discovered or just nice-to-have? When picking a task: will this fit within the appetite? The agent never estimates duration.

## Invocation

### First session (from a Pitch without a scope map)

User invokes with a Pitch (issue URL or name).

1. **Read the Pitch.** Load the Pitch body. Do not read child research tickets. Completion: Pitch understood.

2. **Codebase reconnaissance.** Explore the codebase. Find where the Pitch would land — relevant files, existing patterns, abstractions to reuse, integration points. Completion: key files and patterns identified.

3. **Create the scope map.** Create a child issue of the Pitch, labelled `scope-map`. Write the `## Appetite` (from the Pitch) and `## Codebase context` sections — file pointers, conventions, orientation notes. Completion: scope map created, context section filled.

4. **Report context to user.** Present reconnaissance findings. Point to specific files to read, patterns to understand. Ask: "Context loaded — ready to continue?" Completion: user confirms.

5. **Brain-dump imagined tasks.** User lists everything they think needs building. Agent helps surface missing areas. All tasks start as `?` imagined, listed under a temporary unscoped section on the map. Completion: user says the list is sufficient.

6. **Carve the first scope.** Grill the user: what's core (central to the Pitch), small, novel (never built before, unknown)? Carve the first scope from the imagined tasks. Create its subheading under `## Scopes`. Move relevant tasks under it. Completion: first scope heading exists, tasks assigned, user confirms.

7. **Begin uphill work.** Start working the first scope. Research, prototypes, clarifying unknowns. Update tasks as discoveries happen — some imagined tasks become discovered, new discovered tasks appear. Completion: scope transitions to downhill as unknowns clear.

### Subsequent session (from an existing scope map)

User invokes with a scope map (issue URL or name).

1. **Load the scope map.** Read it. What's done? What's uphill? What's downhill? Completion: map state understood.

2. **Pick the next task.** Scan discovered tasks (unprefixed, unchecked). Propose one based on: core (central to the Pitch), small (finishable this session), novel (eliminates uncertainty). If multiple candidates, present them for the user to choose. If no discovered tasks remain and imagined tasks exist, the user must confirm graduation before one is picked. Completion: user picks a task.

3. **Work the task.** If it warrants a child ticket (enough detail), create it — a child issue of the scope map. Delegate: `/implement` for building, `/research` for facts, `/prototype` for design questions. Completion: task done — checklist item checked, or child ticket closed with resolution.

4. **Update the scope map.** After task completion:
   - Check the item in the scope map
   - Record newly discovered tasks (unprefixed)
   - When task clusters form, propose carving a new scope — challenge the user, let them challenge you
   - Update scope phase markers if the balance shifts
   - Remind about appetite when adding tasks
   
   Completion: map is current, nothing missed.

5. **Repeat or stop.** User decides: pick another task, or end the session.
