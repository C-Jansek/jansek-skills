# Jansek Skills

Agent skills for my personal (engineering) workflow.

Inspired by [Shape Up](https://basecamp.com/shape-up) by Ryan Singer.

Inspired and built on top of [mattpocock/skills](https://github.com/mattpocock/skills) by Matt Pocock (especially /wayfinder).

## Install

Clone the repo, then symlink skills to your user skills directory:

```bash
./scripts/link-skills.sh
```

Skills land in `~/.agents/skills/`. Run again after pulling new skills.

## Structure

- `skills/` — user-invokable agent skills (one subdirectory per skill)
- `scripts/` — automation scripts
