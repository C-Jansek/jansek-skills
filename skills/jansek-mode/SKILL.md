---
name: jansek-mode
description: "Router skill to handle all kinds of user requests according to playbooks."
disable-model-invocation: true
---

Router skill to execute a playbook, chosen based on the specific request from the user.

### Playbooks

| Task                    | Playbook                                                       | Use when                                                                                                       |
|-------------------------|----------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| Create or edit skill    | ./skills/jansek-mode/references/playbooks/write-skill.md       | User want to create a new skill, or edit an existing skill.                                                    |
| Create or edit playbook | ./skills/jansek-mode/references/playbooks/write-playbook.md    | User want to create a new playbook, or edit an existing playbook.                                              |
| Implement a feature     | ./skills/jansek-mode/references/playbooks/implement-feature.md | User wants to collaboratively specify and implement one existing work item through a reviewed GitLab MR draft. |

When no playbook matches, stop here and tell the user.

When using subagents or providing context to other agents, mention it is part of a /jansek-mode request and mention the
current playbook.
This provides the other agent with the required context.

## External service approval gates (e.g. GitLab)

Before every external service write operation (like to GitLab), explain the exact operation, target, and change and wait for explicit approval.
Get separate approval before pushing a branch and before creating an MR or comment.
Approval for one operation does not authorize another.
If an operation is not approved, leave it undone and report what remains.
