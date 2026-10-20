# Write playbook

Read  `./skills/jansek-mode/SKILL.md` and `./skills/jansek-mode/README.md` for context.

Ask the user what the name is of the playbook they want to create or edit, unless it is already provided.

If the user is creating a new playbook from scratch, perform the actions under [Creating a playbook](#creating-a-playbook) first.
If the user is editing a playbook, go straight to [Editing a playbook](#editing-a-playbook).

## Creating a playbook

Create a new file `./skills/jansek-mode/references/playbooks/[name-of-playbook].md`. 
Replace `[name-of-playbook]` with the name (lowercase, hyphenated).
Continue with editing a playbook.

## Editing a playbook

The playbook exists in `./skills/jansek-mode/references/playbooks/[name-of-playbook].md` from the repo root.

The edits are made in two phases. 

Phase one: make the exact change the user requested (do not provide feedback yet).

1. Ask the user to describe the change they want to make in their own words, unless already provided.
2. Restate the changes in your own words.
3. Use /grilling to make sure you understand the intended change. Continue once the user confirms you understand.
4. Make the edit for the user.

Phase two: critique, harden and complete the change.

1. Use /review-skill to present review findings and discuss the changes the user proposed.
2. When you and the user arrive at a shared understanding, make the edit for the user according to /writing-for-agents.
3. Playbook name
    - Analyze the name of the playbook. 
    - If it is no longer fitting the playbook after the edit, propose a new name to the user.
    - Await confirmation before renaming the playbook.
4. Update the guiding documentation if necessary
    - `./skills/jansek-mode/README.md` add or update the playbook reference list.
    - `./skills/jansek-mode/SKILL.md` add or update the playbook reference list, along with its usage.
5. List and explain the full changes for the user and let them confirm these are correct. If not, return to 2.1.

The playbook completed once the proposed changes are made, reviewed, confirmed by the user.

Propose to commit the changes using /commit.
