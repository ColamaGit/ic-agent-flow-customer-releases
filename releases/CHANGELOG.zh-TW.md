# Releases Changelog

客戶端版本變更摘要。

## 版本條目：runtime-bundle-tw-20260529043609

- 現行版本：`v1.17.0`
- 前次版本：`runtime-bundle-tw-20260429140332`（v1.6.0）
- 發佈日期：`2026-05-30（UTC+8）`
- 變更類型：`non-breaking`（非破壞性）

### 變更內容

1. Silicon Feedback 可執行修復面板（v1.15 UI 強化）：
   - `SiliconFeedback.tsx` 新增動態 blocker chain 顯示。
   - 每個 Authority 的修復行動項目與 ECO 決策情境同步呈現。
2. Console Bootstrap Gate（v1.10）：
   - 機器可讀 AI Agent Bootstrap Plan（`customer_environment_and_console_bootstrap_plan.json`）。
   - 強化操作員啟動流程的部署文件。
3. Package Build Registry 歷史記錄保護（v1.10）：
   - `build_distribution_bundle.py` 加入合併邏輯，確保歷史回填記錄不被覆蓋。
   - 針對 `customer_package_folders_index.json` 與 `package_build_index.json` 的回歸防護。
4. 參考文件目錄更新（`reference_docs.catalog.v1.json`）。
5. 完整三 variant 發佈（enterprise_site + solo_eval + team_project），取代先前僅 enterprise_site 的部分暫存包（20260527）。
6. 治理文件更新：`releases/version-pointers/v1.17.0.json`、`LATEST.json`、`RELEASE_INDEX.md`。

### Variant 影響範圍

- `solo_eval`：文件 + runtime 合約 + 新 payload
- `team_project`：文件 + runtime 合約 + 新 payload
- `enterprise_site`：文件 + runtime 合約 + 新 payload

### 驗證證據

- `releases/runtime-bundle-tw-20260529043609/publish_manifest.json`
- `releases/runtime-bundle-tw-20260529043609/publish_audit_record.json`— binary sha256 比對：PASS
- `releases/runtime-bundle-tw-20260529043609/*.checksums.json`（各 variant）

### 升版行動

1. 自動化消費者讀取 `version-pointers/LATEST.json` → 現已指向 `v1.17.0`。
2. 對 `runtime-bundle-tw-20260529043609` 重新執行 bundle gate 驗證。
3. 前一版本 `v1.6.0` 仍可存取於 `releases/runtime-bundle-tw-20260429140332/`（狀態：LEGACY）。

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
