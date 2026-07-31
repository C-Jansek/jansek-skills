#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="$(cd "$(dirname "$0")/../skills" && pwd)"
USER_SKILLS_DIR="$HOME/.agents/skills"

if [ ! -d "$SKILLS_DIR" ]; then
  echo "Error: skills directory not found at $SKILLS_DIR" >&2
  exit 1
fi

mkdir -p "$USER_SKILLS_DIR"

linked=0
skipped=0
warned=0

for skill_dir in "$SKILLS_DIR"/*/; do
  [ -d "$skill_dir" ] || continue
  skill_dir="${skill_dir%/}"
  skill_name=$(basename "$skill_dir")

  if [ ! -f "$skill_dir/SKILL.md" ]; then
    echo "SKIP: $skill_name (no SKILL.md)"
    continue
  fi

  target="$USER_SKILLS_DIR/$skill_name"

  if [ -L "$target" ]; then
    current_link=$(readlink "$target")
    if [ "${current_link%/}" = "$skill_dir" ]; then
      echo "OK: $skill_name (already linked)"
      skipped=$((skipped + 1))
    else
      echo "WARN: $skill_name (symlink points elsewhere: $current_link)"
      warned=$((warned + 1))
    fi
  elif [ -e "$target" ]; then
    echo "WARN: $skill_name (target exists but is not a symlink)"
    warned=$((warned + 1))
  else
    ln -s "$skill_dir" "$target"
    echo "LINKED: $skill_name"
    linked=$((linked + 1))
  fi
done

echo ""
echo "Done: $linked linked, $skipped already ok, $warned warnings"
