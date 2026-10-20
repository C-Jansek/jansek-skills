# Implement a feature

Take one existing work item through specification, implementation, joint review, acceptance checks, and a jointly prepared GitLab merge request.
Use the named skills for their procedures; this playbook connects them and defines the approval gates.

## Invocation

The user provides an existing issue or work-item URL.
Handle one bounded work item.

## Process
### Specify

Invoke `/specify` with the issue and repository context.
Stop and ask the user to approve the specification and acceptance criteria before implementation.
Present any proposed issue-tracker write operation and wait for explicit approval.

### Implement

Invoke `/implementation` with the issue, agreed specification and criteria, and relevant codebase context.
Let it capture its fixed point and keep its built-in review and test verification.
If it cannot complete, resolve the blocker with the user before proceeding.

### Joint review

After implementation completes, invoke `/joint-code-review` with the issue/specification, local diff, and implementation results.
Stop and get the user's explicit approval before proceeding.
Route agreed findings through `/implementation`, then repeat this step on the updated diff.

### Acceptance

Invoke `/acceptance-criteria` with the agreed criteria and actual changes.
Pass its flows to `/verify-acceptance-criteria`.
Review the outcome with the user.
If criteria failed or remain unchecked, agree whether to fix and reverify or carry them as explicit limitations before preparing the MR.

### MR draft

Invoke `/merge-request` with the issue, final diff, test results, and acceptance outcomes.
Review the draft with the user.

## GitLab approval gates

Before every GitLab write, explain the exact operation, target, and change and wait for explicit approval.
Get separate approval before pushing the branch and before creating the draft MR.
Approval for one operation does not authorize another.
If an operation is not approved, leave it undone and report what remains.

## Outcome

Report the implementation result, review and acceptance outcomes, and MR status.
Distinguish local drafts from changes actually pushed or created in GitLab.
