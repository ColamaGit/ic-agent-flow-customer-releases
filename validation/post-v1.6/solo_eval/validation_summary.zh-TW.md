# 驗證摘要 — v1.6.0 / solo_eval

**bundle_id**：`runtime-bundle-tw-20260429140332`
**variant**：`solo_eval`
**語意版本**：`v1.6.0`
**驗證時間**：`2026-04-29（UTC+8）`

## 驗證結果

| 檢查項目 | 結果 |
|---------|------|
| Bundle 目錄存在 | PASS |
| tar.gz binary 存在 | PASS |
| solo_eval 清單存在 | PASS |
| solo_eval checksum 存在 | PASS |
| 否定清單掃描（workspace/tests/.env） | PASS（無違禁內容） |
| 解壓前文件存在 | PASS |
| verify_release_bundle.sh | **PASS** |

## 驗證證據

- `releases/runtime-bundle-tw-20260429140332/`
- `scripts/verify_release_bundle.sh runtime-bundle-tw-20260429140332` → `PASS`

## 能力邊界（v1.6.0）

- 完整受治理 EDA 執行鏈（V1–V4、H1–H3、H5、H9、H10、H6、H7、H8）
- 單人本機評估模式
- 操作員主控台（單人模式）
- 規格接收與架構流程
- 就緒性關卡報告
- 本機部署設定檔（`airgap-local`）
- **solo_eval 不含：** 多人 RBAC、企業級審批法定人數、矽晶回饋面板、套件建置登記表

## 備註

- 此為**非正式生產基準**類型，不適用於正式晶片簽核。
- 已被 v1.17.0（`runtime-bundle-tw-20260529043609`）取代，建議升版。
- 現行生效發布版請見 [RELEASE_INDEX.zh-TW.md](../../RELEASE_INDEX.zh-TW.md)。
