---
name: release
description: Prepare a release PR by ensuring dev is current and pushed, then open a PR from dev to main without deploying or merging.
---

# release command

## Goals

- Verify current branch is `dev` (switch to dev if not)
- Ensure `dev` is pushed to remote
- Create PR from `dev` targeting `main`
- Output PR URL

## Constraints

- Don't deploy
- Don't push directly to main
- Don't merge; only create the PR
