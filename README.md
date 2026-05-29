# ic-agent-flow Customer Releases

[EN](./README.md) | [zh-TW](./README.zh-TW.md)

This repository is the customer-facing release registry for `ic-agent-flow`.
It is not the source development repository.

## What is ic-agent-flow

`ic-agent-flow` is a governance-first IC design flow runtime.
It turns requirement/spec/graph/EDA execution/readiness outputs into auditable, replayable evidence chains.

## Current Capability (Customer Surface)

- PRD v1.0: `intake -> spec -> graph -> validation -> freeze -> plan`
- PRD v0.9: governed open-source EDA chain (`H0/H1/H2/H4/H3`)
- PRD v1.3: controlled release / contract boundary
- PRD v1.5/v1.6: package variants + controlled distribution / IP boundary
- PRD v1.10/v1.15: **v1.17.0** — Silicon Feedback Remediation Panel, Console Bootstrap Gate, Package Build Registry preservation

## Active Release

| Version | Bundle | Status |
|---|---|---|
| **v1.17.0** | `runtime-bundle-tw-20260529043609` | ✅ ACTIVE |
| v1.6.0 | `runtime-bundle-tw-20260429140332` | LEGACY |

See [RELEASE_INDEX.md](./RELEASE_INDEX.md) and `releases/version-pointers/LATEST.json` for authoritative pointers.

## Expected Results After a Normal Run

1. Upstream truth objects (spec/graph/validation/freeze/plan)
2. EDA artifacts (raw/normalized/evidence)
3. Readiness report and gate verdict
4. Auditable manifest/checksum/lineage records

## Open-Source EDA Toolchain References

See: [docs/eda-toolchain-candidates-reference.md](./docs/eda-toolchain-candidates-reference.md)

## Guest/Customer Reading Pack

See: `briefings/`

## Quick Start

1. Check [RELEASE_INDEX.md](./RELEASE_INDEX.md) for the active bundle.
2. Select a variant: `solo_eval`, `team_project`, or `enterprise_site`.
3. Read variant `README.md` and `deployment/docs/*` before extraction.
4. Run `scripts/verify_release_bundle.sh <bundle_id>`.

## Release Truth

- payload root: `releases/runtime-bundle-tw-*`
- semantic pointers: `releases/version-pointers/*.json`
- latest pointer: `releases/version-pointers/LATEST.json`
