# setup-python command

## Goals

1. Run `bootstrap-python.sh [TARGET_REPO_PATH]`
2. Read CLAUDE.md
3. Verify working tree is clean
4. Create a new branch and switch to it
5. Verify auth status of GitHub
6. Verify `uv` is installed and `.venv` exists
7. Verify availability of Codex via MCP
8. Verify availability of Serena via MCP; if unavailable output configuration instructions and stop; if available call `activate_project` with the current repository path
9. Call `activate_project` of Serena with the current repository path

## Memo

`bootstrap-python.sh [TARGET_REPO_PATH]` performs:

- Git fetch on the current branch
- Installs `uv` if not present (`~/.local/bin/uv`)
- Creates `.venv` with `uv venv` if missing
- Adds dev dependencies: `ruff`, `pyright`, `pytest`
- Syncs dependencies with `uv sync`

## Constraints

- Don't read application/source code files
- Don't start development work
- Don't use pip directly; use `uv` for all package operations
