---
name: review-skill
description: "Review a handwritten skill provided by the user."
disable-model-invocation: true
---

Read the provided skill file along with referenced files influencing its behavior.
Critique it using /writing-for-agents. Verify that the skill adheres to the rules in /writing-for-agents. 
Display prioritized findings with references to line numbers to the user.

The user will update the skill to resolve findings. Return findings only, do not edit the files.
Report when no findings remain.

If the user's intent with the skill is unclear, ask questions using /grilling to discover the intent.
