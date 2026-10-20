---
name: joint-code-review
description: Use when the user wants to review local code changes or a GitLab merge request together, first understanding the change's shape and then examining important details.
---

Review code with the user, not instead of the user. Support both local changes delivered by this agent and a GitLab merge request prepared by another engineer.

## Establish context

Ask for or locate the change under review and its intent: the issue, specification, acceptance criteria, base commit or branch, and relevant checks. For a GitLab merge request, read `/glab` before using GitLab CLI or API commands. Keep GitLab inspection read-only: do not push, comment, approve, resolve discussions, or change merge-request state.

For local changes, identify the exact diff and fixed point. Do not modify the working tree during review. If the scope or expected behavior is unclear, surface the question before judging the code.

## Review together

Use `/give-me-a-feel` to present a compact view of what changed: choose a diagram, call tree, component tree, file tree, or focused diff that helps the user orient themselves.

Work through two passes:

1. **Intent and shape:** Does the change solve the stated problem? Do the boundaries, responsibilities, and integration points make sense? Are important design decisions visible and consistent with the specification?
2. **Implementation details:** Inspect behavior, edge cases, error handling, tests, compatibility, and operational risks. Focus on actionable issues, especially ones deterministic checks do not cover; do not pad the review with preferences.

Invite the user to question the change and examine the code with you. Distinguish confirmed defects from questions or risks. Support each finding with a file and line or relevant MR diff location, its impact, and a concrete explanation.

## Outcome

Summarize:

- Findings the user and agent agree are actionable, ordered by importance
- Questions or risks that remain unresolved
- Areas reviewed and checks or evidence considered
- The user's decision about next steps

Do not implement findings or write to GitLab as part of this skill. If the user wants changes, hand the agreed bounded work to `/implementation`. If reviewing an MR, leave all discussions and MR state unchanged.
