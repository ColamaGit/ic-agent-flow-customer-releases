# 驗證摘要 — v1.6.0 / team_project

**bundle_id**：`runtime-bundle-tw-20260429140332`
**variant**：`team_project`
**語意版本**：`v1.6.0`
**驗證時間**：`2026-04-29（UTC+8）`

## 驗證結果

| 檢查項目 | 結果 |
|---------|------|
| Bundle 目錄存在 | PASS |
| tar.gz binary 存在 | PASS |
| team_project 清單存在 | PASS |
| team_project checksum 存在 | PASS |
| 否定清單掃描（workspace/tests/.env） | PASS（無違禁內容） |
| 解壓前文件存在 | PASS |
| verify_release_bundle.sh | **PASS** |

## 驗證證據

- `releases/runtime-bundle-tw-20260429140332/`
- `scripts/verify_release_bundle.sh runtime-bundle-tw-20260429140332` → `PASS`

## 能力邊界（v1.6.0）

- 完整受治理 EDA 執行鏈（V1–V4、H1–H3、H5、H9、H10、H6、H7、H8）
- 多人協作模式，含 RBAC 基準
- 共享執行證據與團隊層級決策追蹤
- 操作員主控台（多人模式）
- 規格接收與架構流程
- 就緒性關卡報告
- **team_project 不含：** 企業級審批法定人數、矽晶回饋面板、套件建置登記表、Vault/K8s 機密資料綁定

## 備註

- 已被 v1.17.0（`runtime-bundle-tw-20260529043609`）取代，建議升版。
- 現行生效發布版請見 [RELEASE_INDEX.zh-TW.md](../../RELEASE_INDEX.zh-TW.md)。
