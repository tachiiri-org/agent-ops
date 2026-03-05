#!/usr/bin/env bash
# bootstrap-python.sh — pre-launch automation for Python batch projects
# Usage: bootstrap-python.sh [TARGET_REPO_PATH]
# Runs non-interactive setup steps before Claude is launched.

set -euo pipefail

TARGET="${1:-$PWD}"

cd "$TARGET"

echo "[bootstrap] target: $TARGET"

# Step: fetch and pull latest from remote
BRANCH="$(git symbolic-ref --short HEAD 2>/dev/null || echo '')"
if [[ -n "$BRANCH" ]]; then
  echo "[bootstrap] fetching origin"
  git fetch origin
else
  echo "[bootstrap] not on a branch, skipping git fetch"
fi

# Step: ensure uv is installed
if ! command -v uv &>/dev/null; then
  echo "[bootstrap] uv not found, installing"
  curl -LsSf https://astral.sh/uv/install.sh | sh
  # reload PATH for current session
  export PATH="$HOME/.local/bin:$PATH"
fi

# Step: create virtual environment if missing
if [[ ! -d .venv ]]; then
  echo "[bootstrap] creating venv"
  uv venv
fi

# Step: ensure required dev dependencies are present
echo "[bootstrap] ensuring dev dependencies"
uv add --dev ruff pyright pytest

# Step: sync dependencies
echo "[bootstrap] syncing dependencies with uv"
uv sync

echo "[bootstrap] done"
