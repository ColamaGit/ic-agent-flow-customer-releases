# Releases Changelog（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `releases/CHANGELOG.md`
> source_sha256: `0d667509cc8018acbd27f3065633b5b2ad408e353727fcda8f7c4ac3d28726b5`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# Releases Changelog

此檔提供 customer/guest 的 release 差異總覽，避免逐檔比對。

## Entry: runtime-bundle-tw-20260429140332

- `active_version`: `v1.6.0`
- `previous_bundle`: `runtime-bundle-tw-20260429100301`
- `released_at`: `2026-04-29 (UTC+8)`
- `change_type`: `non-breaking`（runtime/docs/pointer alignment）

### What Changed

1. 新增 production run 結構說明能力（run-local explainer）：
   - `RUN_STRUCTURE_EXPLAINED.md` 由 runtime pipeline 自動生成。
2. customer-releases 同步新 bundle，並更新：
   - `releases/version-pointers/v1.6.0.json`
   - `releases/version-pointers/LATEST.json`
   - `RELEASE_INDEX.md` ACTIVE row
3. docs/activation/profiles/schemas 已從 placeholder 收斂為可讀最小正式內容。
4. `briefings/` 新增 guest/customer 閱讀入口文件集。

### Variant Impact

- `solo_eval`: docs + runtime contract + new bundle payload
- `team_project`: docs + runtime contract + new bundle payload
- `enterprise_site`: docs + runtime contract + new bundle payload

### Evidence Refs

- `releases/runtime-bundle-tw-20260429140332/customer_release_staging_manifest.json`
- `releases/runtime-bundle-tw-20260429140332/<variant>/*.manifest.json`
- `releases/runtime-bundle-tw-20260429140332/<variant>/*.checksums.json`
- `scripts/verify_release_bundle.sh runtime-bundle-tw-20260429140332` → `PASS`

### Migration Action

1. 重新執行 bundle gate 驗證。
2. 重新跑 preflight + smoke scenario。
3. 若使用 automated pointer consumer，僅需讀 `version-pointers/LATEST.json`。

