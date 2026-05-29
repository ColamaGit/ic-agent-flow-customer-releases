# 驗證摘要 — v1.17.0 / enterprise_site

**bundle_id**：`runtime-bundle-tw-20260529043609`
**variant**：`enterprise_site`
**語意版本**：`v1.17.0`
**驗證時間**：`2026-05-30T01:42:12+08:00`

## 驗證結果

| 檢查項目 | 結果 |
|---|---|
| Bundle 目錄存在 | PASS |
| tar.gz binary 存在 | PASS |
| enterprise_site.manifest.json | PASS |
| enterprise_site.checksums.json | PASS |
| publish_manifest.json | PASS |
| publish_audit_record.json | PASS |
| Binary sha256 完整性（src→dst）| PASS（`78e0d489...`）|
| 否定清單掃描（workspace/tests/.env）| PASS（無違禁內容）|
| verify_release_bundle.sh | **PASS** |

## 驗證證據

- `releases/runtime-bundle-tw-20260529043609/publish_audit_record.json`
  - `binary_integrity_verified: true`
  - `git_commit_performed: true` → `e607c5f`
  - `git_push_performed: true` → `ec79e3d`
- `scripts/verify_release_bundle.sh runtime-bundle-tw-20260529043609` → `[PASS] layout=flat`

## 相較 v1.6.0 的主要變更

- Silicon Feedback 可執行修復面板（v1.15）
- Console Bootstrap 機器可讀計畫（v1.10）
- Package Build Registry 歷史保護（v1.10）
- 完整三 variant 發佈（取代僅 enterprise_site 的部分暫存包 20260527）
