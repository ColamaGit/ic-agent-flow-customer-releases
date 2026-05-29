# Releases Changelog

Customer-facing release delta summary.

## Entry: runtime-bundle-tw-20260529043609

- active_version: `v1.17.0`
- previous_bundle: `runtime-bundle-tw-20260429140332` (v1.6.0)
- released_at: `2026-05-30 (UTC+8)`
- change_type: `non-breaking`

### What Changed

1. Silicon Feedback Actionable Remediation Panel (v1.15 UI hardening):
   - Dynamic blocker chain display in `SiliconFeedback.tsx`.
   - Remediation action items now surfaced per-authority with ECO decision context.
2. Console Bootstrap Gate (v1.10):
   - Machine-readable AI agent bootstrap plan (`customer_environment_and_console_bootstrap_plan.json`).
   - Hardened deployment documentation for operator activation flow.
3. Package Build Registry Preservation (v1.10):
   - Generator merge logic in `build_distribution_bundle.py` preserves historical backfilled rows.
   - Regression guard for `customer_package_folders_index.json` and `package_build_index.json`.
4. Reference Docs Catalog updated (`reference_docs.catalog.v1.json`).
5. Full 3-variant release (enterprise_site + solo_eval + team_project), replacing enterprise-site-only partial `20260527`.
6. Updated governance records: `releases/version-pointers/v1.17.0.json`, `LATEST.json`, `RELEASE_INDEX.md`.

### Variant Impact

- `solo_eval`: docs + runtime contract + new payload
- `team_project`: docs + runtime contract + new payload
- `enterprise_site`: docs + runtime contract + new payload

### Evidence Refs

- `releases/runtime-bundle-tw-20260529043609/publish_manifest.json`
- `releases/runtime-bundle-tw-20260529043609/publish_audit_record.json` — binary sha256 match: PASS
- `releases/runtime-bundle-tw-20260529043609/*.checksums.json` (per variant)

### Migration Action

1. Automated consumers read `version-pointers/LATEST.json` → now points to `v1.17.0`.
2. Re-run bundle gate verification against `runtime-bundle-tw-20260529043609`.
3. Previous `v1.6.0` remains accessible at `releases/runtime-bundle-tw-20260429140332/` (LEGACY).

---

## Entry: runtime-bundle-tw-20260429140332

- active_version: `v1.6.0`
- previous_bundle: `runtime-bundle-tw-20260429100301`
- released_at: `2026-04-29 (UTC+8)`
- change_type: `non-breaking`

### What Changed

1. Added auto-generated run-local explainer capability:
   - `RUN_STRUCTURE_EXPLAINED.md` from runtime pipeline.
2. Synced new bundle and updated:
   - `releases/version-pointers/v1.6.0.json`
   - `releases/version-pointers/LATEST.json`
   - `RELEASE_INDEX.md` active row
3. Upgraded docs/activation/profiles/schemas from placeholders to minimal formal content.
4. Added `briefings/` guest/customer reading set.

### Variant Impact

- `solo_eval`: docs + runtime contract + new payload
- `team_project`: docs + runtime contract + new payload
- `enterprise_site`: docs + runtime contract + new payload

### Evidence Refs

- `releases/runtime-bundle-tw-20260429140332/customer_release_staging_manifest.json`
- `releases/runtime-bundle-tw-20260429140332/<variant>/*.manifest.json`
- `releases/runtime-bundle-tw-20260429140332/<variant>/*.checksums.json`
- `scripts/verify_release_bundle.sh runtime-bundle-tw-20260429140332` => `PASS`

### Migration Action

1. Re-run bundle gate verification.
2. Re-run preflight + smoke scenario.
3. Automated consumers should read `version-pointers/LATEST.json`.
