---
name: coordinate-implementations
description: Implement specified tickets in dependency order on a new branch, then create a pull request.
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

Implement each ticket as one work item. Use a subagent to run `/implementation` for that ticket only; it owns implementation, review, acceptance-criteria verification, testing, and committing. Pass the ticket and its acceptance criteria as the work item. Do not combine tickets in one `/implementation` invocation.

Once `/implementation` reports the ticket complete, mark the ticket as completed and continue to the next unblocked ticket.

Check if all tickets are completed, marked as such, acceptance criteria are met, and the full test suite passes.
Then use /pr to create a pull request for the branch with all the changes.
