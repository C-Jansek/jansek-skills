---
name: merge-request
description: Use when drafting a GitLab merge-request title and body; include a visual summary, concrete evidence, merge danger, and blast radius.
---

Prepare the merge-request title and body for review with the user. This skill adapts the current `/pr` template and guidance.

Do not push a branch or create, edit, approve, or otherwise publish a GitLab merge request from this skill. Return a copyable draft. The calling workflow must get explicit approval for each GitLab write.

## Draft template

```markdown
## Summary

<Use /give-me-a-feel to choose a diagram, diff-sketch, or tree that makes the key point clear.>

## Evidence

- **Before:** <screenshot, output, or failing test run>
  **After:** <screenshot, output, or passing test run>

## Merge Danger

**Door:** <one-way or two-way>

<optional description>

**Blast Radius:** <one-word description>

<optional potential ramifications of merge>
```

## Write the draft

- Keep the title and prose concise. Skip preambles and use the project's domain language from `GLOSSARY.md` when available.
- In **Summary**, choose the smallest representation that explains the change in its entirety. Invoke `/give-me-a-feel`; do not include every possible diagram type.
- In **Evidence**, show concrete before-and-after evidence. Screenshots are preferred for visual changes when the environment supports them. Otherwise use actual test results, command output, or other observed evidence. Do not claim checks that were not run.
- In **Merge Danger**, state whether the change is a one-way or two-way door and describe the potential blast radius. Keep the risk specific to this change.
- Review the title and body with the user. Preserve uncertainty and identify missing evidence rather than filling gaps with guesses.
