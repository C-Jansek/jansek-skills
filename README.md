# Jansek Skills

Agent skills for my personal (engineering) workflow.
Feel free to copy any of the aspects you see here, it is under an MIT license.

Skills might be added, changed or removed at any moment as they continue to evolve.

Enjoy!

> Inspired by [Shape Up](https://basecamp.com/shape-up) by Ryan Singer.
>
> Inspired and built on top of [mattpocock/skills](https://github.com/mattpocock/skills) by Matt Pocock.
>
> Inspired by [pstack by poteto](https://github.com/cursor/plugins/tree/main/pstack), which is part of the Cursor official plugins.

## Skill types

### User-invoked skills

Processes used multiple times are placed in user-invoked skills.
The user explicitly asks the agent to use these skills, the agent cannot do it on its own.
These skills do not load into the memory of the agent by default.

### Principle skills

Principle skills describe a broader applicable principle and are referenced by other skills.
They are not that useful on their own.
Therefore, the description of those skills includes:

> "Use when another skill or the user explicitly directs you to use this skill."

### Model-invoked skills

Model-invoked skills also include processes or elements to keep in mind, like user-invoked skills.
Processes that do not need to be invoked by the model should be user-invoked skills.
The difference is that the model-invoked processes are only the reusable parts.

## Install

> Ensure you have installed [mattpocock/skills](https://github.com/mattpocock/skills), as this project depends on it.

Clone the repo, then symlink skills to your user skills directory:

```bash
./scripts/link-skills.sh
```

Skills land in `~/.agents/skills/`. Run again after pulling new skills. It will not remove old skills.

## Development
### Structure

- `skills/` — user-invokable agent skills (one subdirectory per skill)
- `scripts/` — automation scripts

### Creating a new skill

To create a new skill, you can bootstrap the new SKILL.md file and the openai.yml config file:

```bash
./scripts/new-skill.sh name-of-skill
```

The name of the skill will be prefilled, but you still need to add the description to both files.
