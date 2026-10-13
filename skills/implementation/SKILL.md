---
name: implementation
description: "Implement one fully specified ticket or actionable code-review comment, including review, verification, and commits."
---

Handle exactly one fully specified work item per invocation.
A work item may be a ticket, a code change requested by a merge request review comment, or equivalent bounded work.

If the work item's goal or acceptance criteria are unclear, stop and report what is missing to the caller before changing code.

Before starting, capture the current commit as the fixed point for review and ensure the working tree is clean.
If it is not clean, stop and report this to the caller.

Use `/tdd` where possible, at pre-agreed seams.
Run typechecking and focused tests regularly, then run the full test suite once after the work and any review fixes are complete.

Implement the work item using this cycle:

1. Implementor: Use a subagent to implement the work item and commit its changes with `/commit`.
2. Reviewer: Use a subagent to run `/code-review` on the changes since the captured fixed point, passing the full work item as the spec. The reviewer must fix any findings and commit those fixes.
3. Verifier: Use a subagent to verify the acceptance criteria one by one.
   - If all criteria are met, verify the working tree is clean and the full test suite passes.
   - If any criterion is unmet, return to step 1 with the unmet criteria and existing progress.

Return the work item's outcome and the commit hashes to the caller. Keep all commits from this invocation scoped to this work item.
