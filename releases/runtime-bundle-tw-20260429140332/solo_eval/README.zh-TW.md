# ic-agent-flow Customer Package (solo_eval)（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `releases/runtime-bundle-tw-20260429140332/solo_eval/README.md`
> source_sha256: `da42a6268d93167b8af3496219b94f37ed69c635b282a2cd0961cb187476cd2f`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# ic-agent-flow Customer Package (solo_eval)

Package ID: `runtime-bundle-tw-20260429140332-solo_eval`

- Profile: `solo_eval`
- Allowed chips: `SN2025`
- RBAC roles: `evaluator`
- Claim boundary: single-user local evaluation; no team/enterprise claim

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

- runtime-bundle-tw-20260429140332: Current release bundle for `solo_eval` profile
- Previous bundles: check `customer_release_staging_manifest.json` lineage in release staging root

