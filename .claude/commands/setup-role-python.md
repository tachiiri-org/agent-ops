# setup-role-python command

## Tool Modules

- Required:
  - `setup-tool-uv`
  - `setup-tool-ruff`
  - `setup-tool-pyright`
  - `setup-tool-pytest`

## Workflow

1. Run the repository bootstrap flow for the target path
2. Read `CLAUDE.md`
3. Read `principles/core.md`
4. Read `profiles/core.md`
5. Read `principles/roles/python.md`
6. Verify working tree is clean
7. Ensure `main` and `dev` branch setup exists and switch to a feature branch
8. Verify GitHub auth status
9. Verify `uv` is installed and `.venv` exists
10. Verify Codex and Serena availability
11. Activate the project in Serena
12. Apply the Python engine baseline scaffold only:
   - `launcher.py`
   - `src/{name}/__init__.py`
   - `src/{name}/__main__.py`
   - no application features beyond scaffold
13. Apply the tool modules listed above
14. Add release metadata placeholders required for the engine launcher flow
15. Add minimal dependency and script placeholders required for the engine scaffold
16. Run the repository's standard validation commands
17. Commit the scaffold
18. Create a pull request targeting `dev`

## Constraints

- Do not embed non-Python runtime concerns into this role command
- Do not start development work
- Do not use pip directly; use `uv`
