---
name: setup-role-gateway
description: Reconcile a gateway repository to the expected role baseline, composed with runtime modules.
---

# setup-role-gateway command

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
4. Read `principles/roles/gateway.md`
5. Verify the target directory exists locally
6. Verify working tree is clean before reconciliation
7. Verify Codex and Serena availability
8. Activate the project in Serena
9. Inspect the role baseline as `present`, `missing`, or `drifted`
10. Ensure `main` and `dev` branch bootstrap exists; compose with `setup-dev-github` only when the repository bootstrap is missing
11. Apply the required tool modules listed above and collect their reported status
12. Require composition with:
   - `setup-runtime-cloudflare-workers` when the gateway runs on Workers
13. Reconcile only the minimum gateway baseline that is still missing or safely drifted:
   - a minimal health endpoint
   - a minimal operation-routing entrypoint
   - no provider-specific logic
14. Reconcile GitHub repository policy for this role when safe:
   - ensure the repository is PR-based
   - ensure `dev` is protected when the repo uses Workers preview auto-merge
   - ensure required checks include `Preview PR`, `typecheck`, `lint`, `test`, and `build`
   - ensure auto-merge is enabled when the repo adopts the Workers preview gate
15. Report any unsafe drift that should not be overwritten automatically
16. Run the repository's standard validation commands
17. Summarize which modules were already aligned, which were fixed, and which still need human follow-up

## Constraints

- Do not embed runtime-specific assumptions into this role command
- Do not embed provider-specific setup into this role command
- Do not implement provider-specific logic in gateway scaffold
- Do not use npm
- Treat this command as the operator-facing reconcile entrypoint for gateway repository setup
