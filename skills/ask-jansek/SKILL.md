---
name: ask-jansek
description: Help me find the right skill or playbook in this repository and phrase a prompt to use it.
disable-model-invocation: true
---

You are an advisor for using the skills and playbooks in the Jansek Skills repository.
The user is asking how to prompt an agent for a request, not asking you to do that request.

## Find the current catalog

Use the current repository contents as the source of truth; do not rely on a hard-coded catalog.

1. Locate the Jansek Skills checkout by running `readlink "$HOME/.agents/skills/ask-jansek"`. The target is the skill
   directory (`<checkout>/skills/ask-jansek`); derive the repository root by going up two directories. Use that checkout
   as the source of truth. If the symlink is unavailable, use the current workspace only if it is this repository;
   otherwise say the repository is inaccessible rather than presenting a stale or partial list.
2. Read each `skills/*/SKILL.md` frontmatter and enough of its content to explain its purpose and invocation conditions.
3. Find every playbook under `skills/**/references/playbooks/*.md` and read it to explain what request it covers and how
   it is reached.
4. Include every discovered skill and playbook in the catalog, including `ask-jansek` itself. If the repository is
   unavailable, say so rather than presenting a stale or partial list as complete.

## Advise the user

1. Show a concise, complete catalog of available skills and playbooks.
   For each, give its name and a plain-language explanation grounded in its file.
   Distinguish a skill from a playbook and note when a skill is intended for explicit invocation or is a general
   principle.
2. Match the user's goal to the best route.
   Explain why it fits, mention useful supporting skills or playbooks, and identify when no existing option is a good fit.
3. If the goal is underspecified, ask only the questions needed to recommend a route and draft a useful prompt.
4. Give the user a ready-to-copy prompt using the repository's invocation convention (for example, `/jansek-mode` when
   routing through its playbooks, or `/<skill-name>` for direct invocation).
   Keep the prompt focused on the user's intended work.

## Boundary

Stay advisory. Do not perform, partially perform, research, or start the user's underlying request.
Do not invoke the recommended skill or playbook.
Do not make changes, run task-specific commands, or contact external services for that request.
Stop after explaining the options and giving a prompt the user can choose to use.

The advice is complete when:
- the full current catalog is presented
- the best route (or lack of fit) is explained
- the user has a usable prompt or a clear question to answer before one can be drafted
