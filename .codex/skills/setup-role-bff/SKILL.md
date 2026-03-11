---
name: setup-role-bff
description: Reconcile a BFF repository to the expected role baseline, composed with runtime and optional identity modules.
---

# setup-role-bff command

## Purpose

- Preferred role-bundle name for BFF repository setup under the `setup-<axis>-<name>` taxonomy.
- Owns BFF-specific scaffold and responsibility boundaries.
- Composes with runtime and optional identity modules instead of embedding those concerns into the command name.

## Tool Modules

- Required:
  - `setup-tool-bun`
  - `setup-tool-typescript`
  - `setup-tool-eslint`
  - `setup-tool-prettier`
  - `setup-tool-vitest`

## Workflow

1. Read `CLAUDE.md`
2. Read `principles/core.md`
3. Read `profiles/core.md`
4. Read `principles/roles/bff.md`
5. Verify the target directory exists locally
6. Verify working tree is clean before reconciliation
7. Verify Codex and Serena availability
8. Activate the project in Serena
9. Inspect the role baseline as `present`, `missing`, or `drifted`
10. Ensure `main` and `dev` branch bootstrap exists; compose with `setup-dev-github` only when the repository bootstrap is missing
11. Apply the required tool modules listed above and collect their reported status
12. Require composition with:
   - `setup-runtime-cloudflare-workers` when the BFF runs on Workers
13. Optionally compose with:
   - `setup-idp-auth0` when the BFF directly integrates with Auth0
14. Reconcile only the minimum BFF baseline that is still missing or safely drifted:
   - a minimal health endpoint
   - a minimal internal-boundary entrypoint
   - no application features beyond scaffold
15. Reconcile GitHub repository policy for this role when safe:
   - ensure the repository is PR-based
   - ensure `dev` is protected when the repo uses Workers preview auto-merge
   - ensure required checks include `Preview PR`, `typecheck`, `lint`, `test`, and `build`
   - ensure auto-merge is enabled when the repo adopts the Workers preview gate
16. Report any unsafe drift that should not be overwritten automatically
17. Run the repository's standard validation commands
18. Summarize which modules were already aligned, which were fixed, and which still need human follow-up

## Constraints

- Do not embed runtime-specific assumptions into this role command
- Do not embed provider-specific integration setup into this role command
- Do not implement application behavior beyond a minimal BFF scaffold
- Do not use npm
- Treat this command as the operator-facing reconcile entrypoint for BFF repository setup
