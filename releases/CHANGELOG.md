# Releases Changelog

Customer-facing release delta summary.

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
