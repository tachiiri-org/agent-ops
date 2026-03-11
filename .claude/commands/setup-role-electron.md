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

1. Read `CLAUDE.md`
2. Read `principles/core.md`
3. Read `profiles/core.md`
4. Read `principles/roles/electron.md`
5. Verify the target directory exists locally
6. Verify working tree is clean before reconciliation
7. Verify Codex and Serena availability
8. Activate the project in Serena
9. Inspect the role baseline as `present`, `missing`, or `drifted`
10. Ensure `main` and `dev` branch bootstrap exists; compose with `setup-dev-github` only when the repository bootstrap is missing
11. Apply the tool modules listed above and collect their reported status
12. Require composition with:
   - `setup-runtime-electron`
13. Optionally compose with:
   - `setup-idp-auth0` when the Electron app directly integrates with Auth0
14. Reconcile only the Electron baseline that is still missing or safely drifted:
   - minimal main and renderer entrypoints
   - a minimal window that renders a basic screen
   - no application features beyond scaffold
15. Reconcile GitHub repository policy for this role when safe:
   - ensure the repository is PR-based
   - ensure `dev` is protected for CI-gated auto-merge
   - ensure required checks include `typecheck`, `lint`, `test`, and `build`
   - ensure required checks include `ui-check` when Playwright is adopted
   - ensure auto-merge is enabled after the Electron CI gate passes
   - report any policy drift that cannot be fixed safely without repo-specific confirmation
16. Run the repository's standard validation commands
17. Summarize which modules were already aligned, which were fixed, and which still need human follow-up

## Constraints

- Do not embed runtime-packaging assumptions into this role command
- Do not embed provider-specific setup into this role command
- Do not expose local OS or credential access directly to renderer code
- Do not use npm
- Treat this command as the operator-facing reconcile entrypoint for Electron repository setup
