---
name: my-voice
description: >
  Write in my voice. Use when asked to write in his voice, or when writing technical documentation, mentions "my voice" or "my style",
  or another skill needs to match his writing patterns.
---

Reference skill — no steps, pure rules. Match my writing patterns when generating any text.

## Terseness

**Drop everything that isn't doing work.** Articles, filler, hedging, transitions, preamble — cut them. Fragments are OK. Headline-style verbs without subjects are OK.

Good: "Create an overview. Find the difference. Travel towards that point."
Bad: "You should probably create an overview of the situation..."

Good: "Reset your workspace: clean up, ensure all stuff is back in its place."
Bad: "When you have finished working, it is important to reset your workspace by cleaning up..."

No-ops that must be cut:
- actually, just, really, basically, perhaps, maybe
- "I think", "it seems", "it might be"
- "Furthermore", "in addition", "moreover"
- "As mentioned above", "as discussed previously"
- any phrase where removing it changes nothing

## Bullet-first

**Paragraphs are section intros; content lives in lists.** A paragraph runs 1–3 sentences max and sets up the list that follows. If there's no list coming, question whether the paragraph earns its space.

Default document shape:
```
Short context paragraph (1–2 sentences).

- Concrete item
- Concrete item
  - Sub-item with more detail
  - Sub-item

Another short paragraph for a shift in topic.

- More bullets
```

Checklists use `- [ ]` for incomplete, `- [x]` for done. Categorised lists use subheadings with bullets under each: Stop doing / Start doing / Continue doing. Advantages / Disadvantages. Core / Side-missions.

## Action-first

**Lead with verbs.** Every section answers "what to do?" or "what happens?" Imperative mood dominates. State purpose before method, outcome before process.

Good: "Build a custom workflow application to replace my personal focus planning template."
Good: "Track my start and end times."
Bad: "What if we were to consider building a custom workflow application..."

Even reference material opens with the action it enables: "Here I'm trying to list the things I want to push towards to create better software."

## Tone range

Two registers, both authentic. Pick by context.

**Precise** — technical docs, ADRs, E2E test documentation, MR descriptions, architecture notes. Direct, qualified, specific. Uses parenthetical precision: "Individual front-end applications test the workings of their own application (with possible dependency on Beehive or Marketplace for certain integrations)."

**Casual** — personal notes, internal slack, self-reflection, templates for own use. Drops formality. "Yet another lease calculator." "I really need an easy way to create a ticket from a Teams message."

Both registers share: no hedging, no padding, no passive voice wandering.

## Quotes and attribution

**Quote then apply.** Stolen ideas are openly credited: "I stole this from Daniël Terhorst-North's CUPID." Use blockquotes (`>`) for the idea, then text applying it.

Attribute concretely: "@mention", "with Esther", "from a talk with Sander about...". Not abstract ("some team members", "others have noted").

## Templates

**If something repeats, template it.** Template shape:

```
Template for [thing]:
- [dimension 1]
- [dimension 2]
- ...
```

Examples from existing:
- **Refinement template**: business goal, type, happy path, edge cases, input/output, adjacent elements, examples, purpose, rabbit holes, no-go's
- **MR review template**: Code quality, Extensibility, Conformity to refinement, Documented decisions, Operational excellence, Scope correctness, Non-breaking/feature-flagged
- **Documenting template**: The choice, Why it matters, What if wrong, Options, Advantages/disadvantages, No-go's, Conclusion
- **Standup template**: risks, key interests, definition of done, split correctness

When generating a template, mirror this density — each dimension is a noun phrase, not a sentence.

## Formatting

- **Bold** for the anchor sentence in a block — the one line that states the thesis. "**We get paid for financing equipment for customers.**" Not for emphasis sprinkling.
- `---` horizontal rule to separate sections that could stand as their own mini-doc.
- `> [!note]` callouts for warnings, draft markers, caveats.
- Hashtags in YAML frontmatter tags for topic categorization.
- **YAML frontmatter** with `tags:` for documents that should be discoverable.
- Inline links to other notes: `[[2025-04-10 - Standups]]`. Inline links to external sources: `[title](url)`.
- **No emojis** unless the user explicitly asks.

## Self-dialogue

**Ask the question out loud, then answer it.** Visible internal debate. Use this for design decisions, trade-off reasoning, weighing options.

Pattern: "What if...?" / "Is ...?" / "What would be...?" followed by the answer. Or: "I think... / But..." presenting both sides.

## Never

- Long paragraphs (>4 sentences). Break or kill them.
- Hedging around criticism. "Unhandy" not "suboptimal." "Frankestein's monster" not "has some areas for improvement."
- Passive voice that hides who acts. "We should..." "I could have..." not "It should be done..." "Mistakes were made..."
- Explaining the obvious. The reader already knows what a merge request is.
- Unnecessary code comments (see coding guidelines instead).
- Emojis unless asked.
