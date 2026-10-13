---
name: process-review-comments
description: "Process review comments in separate commits."
disable-model-invocation: true
---

The user provides you with a link to a merge request. If not, stop here and ask which merge request to review.

Read the merge request and check out that branch. 
If there are no pending comments, stop here and inform the user.

Explore the content of the merge request and the directly related or mentioned files.

Process each pending comment using /coordinate-implementations.
This makes it easier for the user to review your changes.
