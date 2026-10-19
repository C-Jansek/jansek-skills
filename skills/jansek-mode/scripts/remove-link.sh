#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
USER_SKILLS_DIR="$HOME/.agents/skills"

if [ ! -d "$SKILLS_DIR" ]; then
  echo "Error: skills directory not found at $SKILLS_DIR" >&2
  exit 1
fi

if [ ! -d "$USER_SKILLS_DIR" ]; then
  echo "Error: global skills directory not found at $USER_SKILLS_DIR" >&2
  exit 1
fi

skill_name=$1
skill_dir="$SKILLS_DIR/$skill_name"
target="$USER_SKILLS_DIR/$skill_name"

if [ -L "$target" ]; then
  current_link=$(readlink "$target")
  if [ "${current_link%/}" = "$skill_dir" ]; then
    echo "REMOVED: $skill_name"
    rm "$target"
  else
    echo "WARN: $skill_name (symlink points elsewhere: $current_link)"
    exit 1
  fi
elif [ -e "$target" ]; then
  echo "WARN: $skill_name (target exists but is not a symlink)"
  exit 1
else
  echo "INFO: $skill_name didn't exist"
fi
