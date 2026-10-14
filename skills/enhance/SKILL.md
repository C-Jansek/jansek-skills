---
name: enhance
description: "Improve engineering tools by learning from earlier agent sessions"
disable-model-invocation: true
---

I want to let an agent make the right choice on its own, instead of me having to micromanage it.

What could I have done differently in this agent by giving it more context upfront (like linting, docs, skills)?

### Process

Go back through the provided session(s) and look for moments where:

- The user stepped in because the agent wasn't behaving as expected
- The agent later corrected itself because it was missing context to make a decision correctly.
- An approach had to be retried because the agent was missing a specific repository or domain constraint that existed
  before the task.
    - Count it only when the transcript shows the constraint and that loading it upfront could have prevented the retry.
    - Exclude normal exploration and changed requirements.

#### Session retrieval

If no sessions were provided, inspect prior OpenCode sessions for the current repository:

1. Determine the repository root with git rev-parse --show-toplevel.
2. Run opencode session list --format json.
    - Keep only sessions whose directory matches that root, sort by updated descending, and select up to five.
    - Exclude the session running this skill if its ID is available.

Then export and review each selected session with opencode export <sessionID>.

If the CLI is unavailable or there are no matching prior sessions, ask the user to provide or select sessions.
Do not search other projects.

#### Issue resolution

Use /principle-context-not-control to determine how to alleviate these issues.

#### Conclusion

Provide the user with an overview of the issues found, the root cause of the issue (cite the session transcript),
and a recommendation for a resolution. End the overview with the issues which you were unsure about.
If no issues are spotted, report that to the user.
