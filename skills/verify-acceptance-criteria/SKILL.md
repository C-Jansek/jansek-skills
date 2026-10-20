---
name: verify-acceptance-criteria
description: Use when a playbook or user asks to manually verify acceptance flows with the user, recording outcomes one flow at a time and handling selectively blocked checks.
---

Guide the user through the acceptance flows produced by `/acceptance-criteria`. This first version is interactive and manual: present one flow at a time, wait for the user's result, and keep an accurate record. Do not claim to have operated a browser or run a check that you did not perform.

## Start

1. Read the agreed acceptance criteria and the generated flow list.
2. Confirm the app, environment, and any setup needed for the first flow. Use only provided or verified links; do not guess URLs.
3. Track every flow as **passed**, **failed**, **skipped**, or **not run**. Record the user's result and relevant evidence or notes.

## Run flows

Present exactly one flow at a time, with its setup, numbered actions, and expected validations. Wait for the user to perform it and report the result before presenting the next flow.

- If it passes, record the result and continue.
- If it fails, record what failed and any evidence the user provides. Continue with flows that are independent of the failure.
- If you suspect a remaining flow depends on the same failed aspect, explain the dependency and identify only the flows that may be affected. Propose skipping those checks and ask the user what to do.
  - Skip affected flows only if the user agrees, and record why each was skipped.
  - Do not stop the entire acceptance check on your own. If the user explicitly agrees to stop, record the reason and all remaining flows as not run.
  - If the user does not agree to skip the affected flows, follow their direction, including trying those flows, and continue with independent flows.
- Do not infer a pass from a related flow or from an automated test. Record what was actually observed.

## Finish

Report counts and outcomes for passed, failed, skipped, and not-run flows. Include failure evidence, reasons for skips or stopping, and any manual checks that remain. Distinguish observed results from expectations.

[//]: # (This version is deliberately manual. Browser automation research remains open. When flow verification is automated, run every flow even when an earlier failure suggests a shared cause; record the observed failures rather than treating them as certain in advance. See `.thoughts/execution/ideas.md`.)
