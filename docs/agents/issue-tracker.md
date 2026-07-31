# Issue tracker: Local Markdown

Issues and pitches for this repo live as markdown files in `.scratch/`.

## Conventions

- One feature per directory: `.scratch/<feature-slug>/`
- The pitch is `.scratch/<feature-slug>/pitch.md`
- The scope map is `.scratch/<feature-slug>/scope-map.md`
- Issues are one file per ticket at `.scratch/<feature-slug>/issues/<NN>-<slug>.md`, numbered from `01` — never a single combined tickets file
- State is recorded as a `Status:` line near the top of each issue file (`claimed`, `resolved`, unclaimed or unstarted issues have no label)
- Comments and conversation history append to the bottom of the file under a `## Comments` heading

## When a skill says "publish to the issue tracker"

Create a new file under `.scratch/<feature-slug>/` (creating the directory if needed).

## When a skill says "fetch the relevant ticket"

Read the file at the referenced path. The user will normally pass the path or the issue number directly.

## Shape and deliver operations

Used by `/shape` and `/deliver`. The **Pitch** is the frozen handoff; the **scope map** is the living build artifact.

### Shaping (`/shape`)

- **Pitch**: `.scratch/<feature-slug>/pitch.md` — the five ingredients (Problem, Solution, Rabbit holes, No-gos, Appetite). Frozen once handed off.
- **Research ticket**: `.scratch/<feature-slug>/issues/NN-<slug>.md`, numbered from `01`, with the fact question in the body. A `Type: research` line near the top. Backs Pitch decisions; the Pitch stands alone without them.

### Delivering (`/deliver`)

- **Scope map**: `.scratch/<feature-slug>/scope-map.md` — the living index. Appetite, codebase context, and scopes listed as subheadings with markdown checklist items.
- **Scopes**: `### <scope name>` subheadings within the scope map. Each carries an `<!-- uphill -->` or `<!-- downhill -->` phase marker. Contains tasks as checklist items.
- **Tasks**: inline checklist items under a scope, prefixed for type: (none) = discovered, `?` = imagined, `~` = nice-to-have. Graduate to a child ticket file when detailed enough.
- **Child ticket**: `.scratch/<feature-slug>/issues/NN-<slug>.md`, numbered from `01`. A `Type:` line records `implementation`/`research`/`prototype`; a `Status:` line records `claimed`/`resolved`. When a task graduates to a child ticket, replace the inline checklist item with a linked name (`[<title>](path)`).
- **Claim**: set `Status: claimed` and save before any work.
- **Resolve**: append outcome under an `## Answer` heading, set `Status: resolved`. Then update the scope map: check the item, record newly discovered tasks, propose scope boundary changes, update phase markers.
