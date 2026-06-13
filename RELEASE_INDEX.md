# Release Index

[EN](./RELEASE_INDEX.md) | [zh-TW](./RELEASE_INDEX.zh-TW.md)

Customer-facing release discovery table. All `bundle_id` timestamps use `Asia/Taipei (UTC+8)`.

> **How to use this table:** Find the ACTIVE row, note the `bundle_id`, then navigate to the `artifact_uri` path to access the release package files.

---

## Release Table

| Version | Bundle ID | Release Date (UTC+8) | Variants | Artifact Path | Checksums | Manifest | Changelog | Status |
|---------|-----------|----------------------|----------|---------------|-----------|----------|-----------|--------|
| **v1.17.0** | `runtime-bundle-tw-20260529043609` | 2026-05-30 | solo_eval / team_project / enterprise_site | `releases/runtime-bundle-tw-20260529043609/` | `releases/runtime-bundle-tw-20260529043609/*.checksums.json` | `releases/runtime-bundle-tw-20260529043609/publish_manifest.json` | [CHANGELOG.md](./releases/CHANGELOG.md) | ✅ **ACTIVE** |
| v1.6.0 | `runtime-bundle-tw-20260429140332` | 2026-04-29 | solo_eval / team_project / enterprise_site | `releases/runtime-bundle-tw-20260429140332/` | `releases/runtime-bundle-tw-20260429140332/*/*.checksums.json` | `releases/runtime-bundle-tw-20260429140332/customer_release_staging_manifest.json` | [CHANGELOG.md](./releases/CHANGELOG.md) | LEGACY |

---

## Version Pointer Mapping

| Pointer File | Points To |
|-------------|-----------|
| `releases/version-pointers/LATEST.json` | Current active bundle (machine-readable entrypoint) |
| `releases/version-pointers/v1.17.0.json` | `runtime-bundle-tw-20260529043609` |
| `releases/version-pointers/v1.6.0.json` | `runtime-bundle-tw-20260429140332` |

**One-copy payload roots:**
- Latest: `releases/runtime-bundle-tw-20260529043609/`
- Legacy: `releases/runtime-bundle-tw-20260429140332/`

---

## Before You Use a Release

1. Identify the ACTIVE release row above
2. Verify the package integrity: `scripts/verify_release_bundle.sh <bundle_id>`
3. Read the variant-specific README inside the bundle before extraction
4. See [PACKAGE_VARIANTS.md](./PACKAGE_VARIANTS.md) to choose the right variant

---

## What Changed in v1.17.0

See [releases/CHANGELOG.md](./releases/CHANGELOG.md) for the full changelog.

Key additions in v1.17.0:
- Silicon Feedback Remediation Panel
- Console Bootstrap Gate
- Package Build Registry with history preservation
- Machine-readable build index and release tracking
