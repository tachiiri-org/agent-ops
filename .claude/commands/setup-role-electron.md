# setup-role-electron command

## Tool Modules

- Required:
  - `setup-tool-bun`
  - `setup-tool-typescript`
  - `setup-tool-eslint`
  - `setup-tool-prettier`
  - `setup-tool-vitest`
- Optional:
  - `setup-tool-playwright`

## Workflow

1. Run the repository bootstrap flow for the target path
2. Read `CLAUDE.md`
3. Read `principles/core.md`
4. Read `profiles/core.md`
5. Read `principles/roles/electron.md`
6. Verify working tree is clean
7. Ensure `main` and `dev` branch setup exists and switch to a feature branch
8. Verify GitHub auth status
9. Verify Codex and Serena availability
10. Activate the project in Serena
11. Apply the Electron baseline scaffold only:
   - minimal main and renderer entrypoints
   - a minimal window that renders a basic screen
   - no application features beyond scaffold
12. Apply the tool modules listed above
13. Require composition with:
   - `setup-runtime-electron`
14. Optionally compose with:
   - `setup-idp-auth0` when the Electron app directly integrates with Auth0
15. Run the repository's standard validation commands
16. Commit the scaffold

## Constraints

- Do not embed runtime-packaging assumptions into this role command
- Do not embed provider-specific setup into this role command
- Do not expose local OS or credential access directly to renderer code
- Do not use npm
