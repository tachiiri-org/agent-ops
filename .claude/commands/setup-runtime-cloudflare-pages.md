# setup-runtime-cloudflare-pages command

## Workflow

1. Read `profiles/runtime/cloudflare-pages.md`
2. Verify the repository is intended to run on Cloudflare Pages
3. Inspect Pages runtime state as `present`, `missing`, or `drifted`
4. Read `tooling/recommended-versions.json` for the stored `wrangler` baseline when reconciling runtime dependencies
5. Run `.claude/scripts/bootstrap-pages.sh [TARGET_REPO_PATH]` only when required runtime files or scripts are missing or drifted
6. Ensure baseline tooling and Pages runtime dependencies are present
7. Ensure `package.json` exposes `bun run deploy:preview` and `bun run deploy:staging` for Pages preview and staging deploys
8. Ensure `scripts/deploy-preview.sh` and `scripts/deploy-staging.sh` exist and own the Pages-specific deploy commands
9. Ensure `scripts/github/upsert-pr-comment.py` exists for CI URL reporting
10. Ensure `.github/workflows/preview-pr.yml` exists and deploys preview on `pull_request` to `dev`
11. Ensure `.github/workflows/deploy-staging.yml` exists and deploys on `push` to `dev`
12. Ensure `.github/workflows/release-pr.yml` exists and maintains the release PR on `push` to `dev`
13. Report the final runtime setup status so the consuming role command can summarize reconciliation
14. Keep Pages features and bindings explicit rather than implied by Pages adoption
15. Run the repository's standard validation commands

## Composes With

- `setup-role-front`

## Constraints

- Do not embed frontend business logic into this runtime command
- Do not imply non-essential Pages features by runtime setup alone
- Do not move staging deploy execution into the `pr` workflow
- Do not use npm
- Treat this command as an internal setup module that may be called repeatedly
