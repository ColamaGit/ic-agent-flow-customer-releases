# Validation Summary — v1.6.0 / team_project

**bundle_id**: `runtime-bundle-tw-20260429140332`
**variant**: `team_project`
**semantic_version**: `v1.6.0`
**validated_at**: `2026-04-29 (UTC+8)`

## Verification Results

| Check | Result |
|-------|--------|
| Bundle directory exists | PASS |
| tar.gz binary present | PASS |
| team_project manifest present | PASS |
| team_project checksums present | PASS |
| Denylist scan (workspace/tests/.env) | PASS (clean) |
| Pre-extraction docs present | PASS |
| verify_release_bundle.sh | **PASS** |

## Evidence

- `releases/runtime-bundle-tw-20260429140332/`
- `scripts/verify_release_bundle.sh runtime-bundle-tw-20260429140332` → `PASS`

## Capability Boundary (v1.6.0)

- Full governed EDA execution chain (V1–V4, H1–H3, H5, H9, H10, H6, H7, H8)
- Multi-user collaboration mode with RBAC baseline
- Shared run evidence and team-level decision tracking
- Operator console (multi-user)
- Spec intake and architecture flow
- Readiness gate reporting
- **Not included in team_project:** enterprise approval quorum, Silicon Feedback panel, Package Build Registry, Vault/K8s secret binding

## Notes

- Superseded by v1.17.0 (`runtime-bundle-tw-20260529043609`). Upgrade recommended.
- See [RELEASE_INDEX.md](../../RELEASE_INDEX.md) for the current active release.
