# pr command

## Steps

1. Read `principles/domains/ops-governance.md`
2. Read `principles/domains/compatibility-and-change.md`
3. If project is a TS Worker repository, read `profiles/runtime/cloudflare-workers.md` before any staging deploy decision
4. Create `.gitignore` if no `.gitignore` is committed
5. Create and switch to a feature branch if on `main` or `dev`
6. Stage unstaged files
7. Commit with detailed change description
8. Push branch to remote
9. Create PR targeting `dev` and output the URL
10. If project is a TS Worker repository (`wrangler.toml` or `wrangler.jsonc` exists), run `bun run deploy:dev` and output the URL

## Constraints

- don't commit with no `.gitignore`
- don't push to main branch directly
- don't push to dev branch directly
