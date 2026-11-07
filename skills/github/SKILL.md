---
name: github
description: "Use for GitHub issues, comments on issues or merge requests, pushing branches, or merge request links."
---

# GitHub

Use `gh` for issues and comments, and `git` to push branches. A merge request is a GitHub pull request. The user creates merge requests from a link you provide.

## Token

The environment configures `gh` with a restricted token. Use `gh` as configured and treat the token as opaque. If a command fails for permissions, report the failure and stop. The rules below apply whatever the token permits.

## Repository

Find the repository with `gh repo view --json nameWithOwner --jq .nameWithOwner`. Find the default branch with `git symbolic-ref --short refs/remotes/origin/HEAD`.

## Allowed

- Issues: list, view, create, edit, label, comment, close, and reopen.
- Comments on merge requests, through `gh api` on the `repos/OWNER/REPO/issues/` endpoints.
- Editing your own comments, never other people's.
- Pushing feature branches, with approval.

## Not allowed

- Merging, approving, reviewing, or closing merge requests.
- Creating merge requests with `gh` or the API.
- Any `gh pr` command, and any `pulls/` API endpoint.
- Force-pushing, or pushing to the default branch.

## Issues and comments

Write multi-line bodies to a file in the system temporary directory (`$TMPDIR`), never in the repository. Pass the file with `--body-file`, or with `-F body=@FILE` for `gh api`.

```sh
gh issue list --state open
gh issue view NUMBER
gh issue create --title "TITLE" --body-file FILE
gh issue edit NUMBER --body-file FILE
gh issue comment NUMBER --body-file FILE
gh api repos/OWNER/REPO/issues/NUMBER/comments -F body=@FILE
```

Attribute every issue, comment, and merge request description with the `commit-attribution` skill.

## Editing your own comments

Find your comment, confirm its author is your login, then edit it:

```sh
gh api user --jq .login
gh api --paginate repos/OWNER/REPO/issues/NUMBER/comments --jq '.[] | {id, user: .user.login, body}'
gh api -X PATCH repos/OWNER/REPO/issues/comments/COMMENT_ID -F body=@FILE
```

## Merge requests

1. Work on a feature branch, not the default branch.
2. Commit the changes.
3. Get approval, then push: `git push -u origin BRANCH`.
4. Draft the title and description with the `merge-request` skill.
5. Build the compare link and post it in your reply. The user opens it, reviews, and submits.

```sh
jq -rn --arg t "TITLE" --arg b "$(cat FILE)" \
  '"https://github.com/OWNER/REPO/compare/BASE...BRANCH?expand=1&title=\($t|@uri)&body=\($b|@uri)"'
```

Keep the link under about 4,000 characters. This is a conservative limit, not a verified one. If the link is longer, shorten the description in the link and put the full text in a file for the user to paste into the form.

## Approval

Every write to GitHub needs explicit approval for that exact operation: pushes, issues, comments, edits, and closes. Describe the operation, target, and content first, then wait. Approval for one operation does not cover another. Read-only commands need no approval.
