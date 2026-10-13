---
name: process-review-comments
description: "Implement actionable code changes from merge request comments in separate commits, and report outstanding discussions."
disable-model-invocation: true
---

The user provides a link to a merge request. If not, stop and ask which merge request to process.

Read `/glab` before using GitLab CLI or API commands. 
Do not push any changes or perform any write action to GitLab.
Inspect the merge request and identify its source branch and unresolved review discussions.
If there are no unresolved comments, inform the user and stop.

If the working tree is not clean, stop and report this before switching branches.
Otherwise, check out the merge request's source branch and inspect the changed code and files related to its comments.

For each unresolved comment that clearly requests a code change, use a separate `/implementation` invocation.
Pass only that comment as the work item, along with its permalink, surrounding diff, and any directly related code context.
Process comments sequentially so each one's commits remain separate from the others.

Do not reply to, resolve, or reopen discussion threads.
Leave questions, clarifications, and discussion-only comments for the user.
At the end, report each such outstanding comment in this format:

> Outstanding discussion comment by [reviewer] about [content] ([link to comment]).

Report the commits created for code-change comments separately, including their hashes. 
Also list any outstanding discussion comments using the format above.
