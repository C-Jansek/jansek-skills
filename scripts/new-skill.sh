#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="$(cd "$(dirname "$0")/../skills" && pwd)"
if [ ! -d "$SKILLS_DIR" ]; then
  echo "Error: skills directory not found at $SKILLS_DIR" >&2
  exit 1
fi

NEW_SKILL_NAME=$1
NEW_SKILL_NAME_LOWER=$(echo "$NEW_SKILL_NAME" | tr '[:upper:]' '[:lower:]')
NEW_SKILL_NAME_UPPER="$(tr '[:lower:]' '[:upper:]' <<< "${NEW_SKILL_NAME_LOWER:0:1}")${NEW_SKILL_NAME_LOWER:1}"
NEW_SKILL_SENTENCE="${NEW_SKILL_NAME_UPPER//-/ }"
NEW_SKILLS_DIR="$SKILLS_DIR/$NEW_SKILL_NAME_LOWER"
NEW_SKILL_FILE_PATH="$NEW_SKILLS_DIR/SKILL.md"
if [ -f "$NEW_SKILL_FILE_PATH" ]; then
  echo "Error: skill at $NEW_SKILL_FILE_PATH already exists" >&2
  exit 1
fi

mkdir -p "$NEW_SKILLS_DIR"

SKILL_TEXT="---
name: ${NEW_SKILL_NAME_LOWER}
description: \"\"
---
"
echo "$SKILL_TEXT" > "$NEW_SKILL_FILE_PATH"

NEW_SKILL_AGENTS_DIR="$NEW_SKILLS_DIR/agents"
NEW_SKILL_OPENAI_PATH="$NEW_SKILLS_DIR/agents/openai.yaml"
mkdir -p "$NEW_SKILL_AGENTS_DIR"

OPENAI_TEXT="interface:
  display_name: \"$NEW_SKILL_SENTENCE\"
  short_description: \"\"
policy:
  allow_implicit_invocation: true"
echo "$OPENAI_TEXT" > "$NEW_SKILL_OPENAI_PATH"