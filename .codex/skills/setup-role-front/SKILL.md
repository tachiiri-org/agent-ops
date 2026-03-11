---
name: setup-role-front
description: Reconcile a frontend repository to the expected role baseline, composed with runtime and optional identity modules.
---

# setup-role-front command

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
4. Read `principles/roles/front.md`
5. Verify the target directory exists locally
6. Verify working tree is clean before reconciliation
7. Verify Codex and Serena availability
8. Activate the project in Serena
9. Inspect the role baseline as `present`, `missing`, or `drifted`
10. Ensure `main` and `dev` branch bootstrap exists; compose with `setup-dev-github` only when the repository bootstrap is missing
11. Apply the required tool modules listed above and collect their reported status
12. Require composition with:
   - `setup-runtime-cloudflare-pages` when the frontend runs on Pages
13. Optionally compose with:
   - `setup-idp-auth0` when the frontend owns login initiation details
14. Reconcile only the minimum role baseline that is still missing or safely drifted:
   - a minimal page
   - explicit loading and error-state placeholders
   - no application features beyond scaffold
15. Reconcile GitHub repository policy for this role when safe:
   - ensure the repository is PR-based
   - ensure `dev` is protected when the repo uses Pages preview auto-merge
   - ensure required checks include `Preview PR` plus `typecheck`, `lint`, `test`, and `build`
   - ensure required checks include `ui-check` when Playwright is adopted
   - ensure auto-merge is enabled when the repo adopts the Pages preview gate
16. Report any unsafe drift that should not be overwritten automatically
17. Run the repository's standard validation commands
18. Summarize which modules were already aligned, which were fixed, and which still need human follow-up

## Constraints

- Do not embed runtime-specific assumptions into this role command
- Do not embed provider-specific integration setup into this role command
- Do not implement business logic in UI
- Do not use npm
- Treat this command as the operator-facing reconcile entrypoint for frontend repository setup
