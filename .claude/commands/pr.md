# pr command

## Steps

1. Read `principles/domains/ops-governance.md`
2. Read `principles/domains/compatibility-and-change.md`
3. If the project is a Cloudflare runtime repository, read the matching runtime profile before checking release expectations
4. Create `.gitignore` if no `.gitignore` is committed
5. Create and switch to a feature branch if on `main` or `dev`
6. Stage unstaged files
7. Commit with detailed change description
8. Push branch to remote
9. Create PR targeting `dev` and output the URL
10. If the project adopts auto-merge for `feature` to `dev`, state which role-defined required checks will gate that auto-merge
11. If the project is a Cloudflare Pages or Workers repository, state that CI will publish a preview URL on the PR before auto-merge completes
12. If the project is a Cloudflare Pages or Workers repository, output the staging URL that CI is expected to deploy after merge to `dev`; make it explicit that deployment has not completed yet

## Constraints

- don't commit with no `.gitignore`
- don't push to main branch directly
- don't push to dev branch directly
- don't run preview or staging deploys from `pr`; CI handles them for the roles that adopt those gates
- don't merge the PR directly from `pr`; auto-merge may complete later after required checks pass
- don't present the staging URL as already deployed when `pr` finishes
