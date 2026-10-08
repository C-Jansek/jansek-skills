---
name: coordinate-implementations
description: Implement one or multiple specified tickets through one coordinator agent.
disable-model-invocation: true
---

The user provides one or more specified tickets to implement to completion. Read the tickets.
If the tickets are not fully specified using /specify, stop here and raise this issue to the user.

If the working tree is not clean, stop here and raise this issue to the user.
Create a new branch from the main branch to pick up the tickets.

Find the blocking relationships between the tickets by their content.
Implement tickets one by one, always choosing a ticket not blocked (anymore) by another ticket.
If multiple tickets are unblocked, choose the smallest ticket first.

Tickets should never have cyclic blocking relationships, or depend on unimplemented tickets outside of the specified
tickets. If this is the case, stop here and raise the issue to the user.

Implementing a ticket means the following:

1. Implementor: Use a subagent to /implement the issue and /commit its changes.
2. Reviewer: Use a subagent to perform a /code-review on the commits from the implementor and fix any issues it finds.
    - The fixed point to review from is the last commit before the implementor agent started working.
    - Any issues must be fixed by the /code-review agent itself.
3. Verifier: Use a subagent to verify the acceptance criteria one by one.
    - If all the acceptance criteria are met, verify the working tree is clean, test suite passes, and the ticket is
      marked as completed.
    - If the acceptance criteria are unmet, restart at 1, keep the existing progress, but instruct the subagent to fix
      the unmet acceptance criteria.
4. Continue to the next ticket.

Check if all tickets are completed, marked as such, acceptance criteria are met, and the full test suite passes.
Then use /pr to create a pull request for the branch with all the changes.
