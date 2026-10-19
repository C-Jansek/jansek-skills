---
name: jansek-mode
description: "Router skill to handle all kinds of user requests according to playbooks."
disable-model-invocation: true
---

Router skill to execute a playbook, chosen based on the specific request from the user.

### Playbooks

| Task                 | Playbook                                                 | Use when                                                    |
|----------------------|----------------------------------------------------------|-------------------------------------------------------------|
| Create or edit skill | ./skills/jansek-mode/references/playbooks/write-skill.md | User want to create a new skill, or edit an existing skill. |

When no playbook matches, stop here and tell the user.

When using subagents or providing context to other agents, mention it is part of a /jansek-mode request and mention the
current playbook.
This provides the other agent with the required context.
