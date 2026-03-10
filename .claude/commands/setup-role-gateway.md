# setup-role-gateway command

## Tool Modules

- Required:
  - `setup-tool-bun`
  - `setup-tool-typescript`
  - `setup-tool-eslint`
  - `setup-tool-prettier`
  - `setup-tool-vitest`

## Workflow

1. Run the repository bootstrap flow for the target path
2. Read `CLAUDE.md`
3. Read `principles/core.md`
4. Read `profiles/core.md`
5. Read `principles/roles/gateway.md`
6. Verify working tree is clean
7. Ensure `main` and `dev` branch setup exists and switch to a feature branch
8. Verify GitHub auth status
9. Verify Codex and Serena availability
10. Activate the project in Serena
11. Apply the gateway baseline scaffold only:
   - a minimal health endpoint
   - a minimal operation-routing entrypoint
   - no provider-specific logic
12. Apply the tool modules listed above
13. Require composition with:
   - `setup-runtime-cloudflare-workers` when the gateway runs on Workers
14. Run the repository's standard validation commands
15. Commit the scaffold
16. Create a pull request targeting `dev`

## Constraints

- Do not embed runtime-specific assumptions into this role command
- Do not embed provider-specific setup into this role command
- Do not implement provider-specific logic in gateway scaffold
- Do not use npm
