---
name: commit-attribution
description: Attribute changes to AI agent
---

When AI tools contribute to development, proper attribution helps track the evolving role of AI in the development process. Contributions should include an Assisted-by tag in the following format:

`Assisted-by: <agent harness> (<agent model>)`

Example: `Assisted-by: opencode (GLM-5.3-Flash)`

Read the harness and model from the **current** agent runtime at commit time — do not hardcode or copy from an earlier commit.
