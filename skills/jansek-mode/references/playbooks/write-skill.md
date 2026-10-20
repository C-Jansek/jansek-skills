# Write skill playbook

Ask the user what the name is of the skill they want to create or edit, unless it is already provided.

Use this skill to edit skills that are part of the `jansek-skills` repository.
If the skill the user asks you to edit already exists and is not part of `jansek-skills`, stop here and inform the user.

If the user is creating a new skill from scratch, perform the actions under [Creating a skill](#creating-a-skill) first.
If the user is editing a skill, go straight to [Editing a skill](#editing-a-skill).

## Creating a skill

Run `./skills/jansek-mode/scripts/new-skill.sh [name-of-skill]`. 
Replace `[name-of-skill]` with the name (lowercase, hyphenated).

The skill is created in `./skills/[name-of-skill]/SKILL.md` from the repo root.
Continue with editing a skill.

## Editing a skill

The skill exists in `./skills/[name-of-skill]/SKILL.md` from the repo root.

The edits are made in two phases.

Phase one: make the exact change the user requested (do not provide feedback yet).

1. Ask the user to describe the change they want to make in their own words, unless already provided.
2. Restate the changes in your own words.
3. Use /grilling to make sure you understand the intended change. Continue once the user confirms you understand.
4. Make the edit for the user.

Phase two: critique, harden and complete the change.

1. Use /review-skill to present review findings and discuss the changes the user proposed.
2. When you and the user arrive at a shared understanding, make the edit for the user according to /writing-for-agents.
3. Skill name
    - Analyze the name of the skill. 
    - If it is no longer fitting the skill after the edit, propose a new name to the user.
    - Await confirmation before renaming the skill.
4. If the skill is new or renamed, propose to link the skills:
    - `./skills/jansek-mode/scripts/link-skills.sh`. 
5. If the skill was renamed and relinked, propose to remove the old symlink:
       - `./skills/jansek-mode/scripts/remove-link.sh [old-name-of-skill]`.
6. List and explain the full changes for the user and let them confirm these are correct. If not, return to 2.1.

The playbook completed once the proposed changes are made, reviewed, confirmed by the user.

Propose to commit the changes using /commit.
