# ic-agent-flow Customer Package (team_project)

Package ID: `runtime-bundle-tw-20260429140332-team_project`

- Profile: `team_project`
- Allowed chips: `SN2025, UART`
- RBAC roles: `operator, reviewer, approver, auditor`
- Claim boundary: team-scoped governed project operation; no enterprise claim

## Capability Summary

- PRD v1.0: requirement intake -> spec -> graph -> validation -> freeze -> plan gate consumption
- PRD v0.9: governed EDA chain (V1/V2/V3 + H1/H2/H4/H3) with readiness artifacts
- PRD v1.3: subject binding, decision package, re-entry and controlled release envelope
- PRD v1.5/v1.6: customer package profile boundary, entitlement scope, controlled distribution/IP-safe surface

## First Read

- `deployment/docs/EXTRACT_AND_INSTALL.md`
- `deployment/docs/OPENAI_SECRET_SETUP.md`
- `deployment/docs/EDA_TOOLCHAIN_BINDING.md`
- `deployment/docs/SUPPORT_EXPORT.md`
- `deployment/docs/TROUBLESHOOTING.md`
- `deployment/docs/customer-package-operations-guide.v1.0.md`

## History Log

- runtime-bundle-tw-20260429140332: Current release bundle for `team_project` profile
- Previous bundles: check `customer_release_staging_manifest.json` lineage in release staging root
