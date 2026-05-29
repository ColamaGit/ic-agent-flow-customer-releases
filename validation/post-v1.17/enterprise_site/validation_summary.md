# Validation Summary — v1.17.0 / enterprise_site

**bundle_id**: `runtime-bundle-tw-20260529043609`
**variant**: `enterprise_site`
**semantic_version**: `v1.17.0`
**validated_at**: `2026-05-30T01:42:12+08:00`

## Verification Results

| Check | Result |
|---|---|
| Bundle directory exists | PASS |
| tar.gz binary present | PASS |
| enterprise_site.manifest.json | PASS |
| enterprise_site.checksums.json | PASS |
| publish_manifest.json | PASS |
| publish_audit_record.json | PASS |
| Binary sha256 integrity (src→dst) | PASS (`78e0d489...`) |
| Denylist scan (workspace/tests/.env) | PASS (clean) |
| verify_release_bundle.sh | **PASS** |

## Evidence

- `releases/runtime-bundle-tw-20260529043609/publish_audit_record.json`
  - `binary_integrity_verified: true`
  - `git_commit_performed: true` → `e607c5f`
  - `git_push_performed: true` → `ec79e3d`
- `scripts/verify_release_bundle.sh runtime-bundle-tw-20260529043609` → `[PASS] layout=flat`

## Key Changes from v1.6.0

- Silicon Feedback Actionable Remediation Panel (v1.15)
- Console Bootstrap machine-readable plan (v1.10)
- Package Build Registry preservation (v1.10)
- Full 3-variant release (replaces enterprise-site-only partial 20260527)
