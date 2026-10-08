---
name: coordinate-implementations
description: Implement one or multiple specified tickets through one coordinator agent.
disable-model-invocation: true
---

The user provides one or more specified tickets to implement to completion. Read the tickets.
If the tickets are not fully specified using /specify, stop here and raise this issue to the user.

Create a new branch to pick up the tickets.

Find the blocking relationships between the tickets. 
Implement tickets one by one, always choosing a ticket not blocked (anymore) by another ticket.

Implementing a ticket means the following:
1. Use a subagent to /implement the issue and /commit its changes.
2. Use a subagent to perform a /code-review on the changes of the first agent, and fix any issues it finds.
3. Use a subagent to verify the acceptance criteria from the ticket are met. 
    - If not, restart at 1, keep the existing progress, but instruct the subagent to fix the unmet acceptance criteria. 
    - Also make sure all changes are committed, test suite passes, and the ticket is marked as completed.
4. Continue to the next ticket.

Once all tickets are picked up, use /pr to create a pull request for the branch with all the changes.
