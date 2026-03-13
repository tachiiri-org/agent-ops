# ubunts.md

Python local-engine runtime for repositories and services that run local processing or launcher workloads on Python.

## Scope

- Python runtime and environment constraints for local engines
- process and dependency expectations tied to local Python execution
- concrete CI and validation expectations shared by Python engine repositories

## Applies When

- A repository role runs as a local Python engine.
- A repository adopts the Python toolchain defined under `../tools/`.

## Baseline

- Keep role responsibilities in `../roles/batch.md`.
- Keep shared Python language and toolchain selection in the matching profiles under `../tools/`.
- Use this file only for Python-runtime-specific constraints.

## Delivery and Merge Gate

- Own `feature -> dev` delivery automation for repositories that run as local Python engines.
- Treat validation workflows, required checks, and `dev` merge-gate policy as runtime concerns.
- Keep local-engine execution isolated from UI and network-edge policy; runtime setup does not expand repository role boundaries.
- Keep Python dependency sync, validation workflow, and merge-gate naming explicit rather than inferred from generic Python adoption.
- Let `setup-runtime-python` own:
  - Python validation workflow definitions
  - the `validate-python` required check
  - `dev` branch-protection and auto-merge readiness

## Runtime Constraints

- Keep Python execution local-service style rather than browser- or network-edge style.
- Keep virtual-environment management explicit through the selected Python package-management tool.
- Keep entrypoints, package layout, and tool configuration explicit rather than inferred from incidental file layout.

## Delivery Constraints

- Keep the validation workflow responsible for the Python validation surface defined by the selected profiles under `../tools/`.
- Keep `dev` merge-gate policy aligned with the runtime-owned `validate-python` check.
- Do not treat ad hoc local execution as the repository's authoritative validation surface.

## Repo-local Requirements

- Each repository or shared concrete spec that adopts this runtime must define:
  - launcher and entrypoint behavior
  - package import root
  - Python version baseline
  - local-engine dependency surface

## Non-goals

- UI responsibilities
- cloud-edge delivery semantics
- provider-specific integration policy
