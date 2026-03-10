# setup-role-adapter command

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
5. Read `principles/roles/adapter.md`
6. Verify working tree is clean
7. Ensure `main` and `dev` branch setup exists and switch to a feature branch
8. Verify GitHub auth status
9. Verify Codex and Serena availability
10. Activate the project in Serena
11. Apply the adapter baseline scaffold only:
   - a minimal health endpoint
   - a minimal provider-boundary entrypoint
   - no provider-specific implementation beyond scaffold
12. Apply the tool modules listed above
13. Require composition with:
   - `setup-runtime-cloudflare-workers` when the adapter runs on Workers
14. Optionally compose with:
   - `setup-provider-github`
   - `setup-provider-google-drive`
   - `setup-provider-r2`
15. Run the repository's standard validation commands
16. Commit the scaffold
17. Create a pull request targeting `dev`

## Constraints

- Do not embed runtime-specific assumptions into this role command
- Do not embed specific provider setup into this role command
- Do not bypass adapter execution-boundary responsibilities
- Do not use npm
