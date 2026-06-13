# 企業站點驗證計畫 — v1.6.0

**variant**：`enterprise_site`
**語意版本**：`v1.6.0`
**適用日期**：`2026-04-29（UTC+8）`

## 目的

本文件定義客戶在其站點宣告 `enterprise_site` 生產就緒之前必須完成的驗證計畫。

本計畫涵蓋從套件接收到站點啟動決策的所有步驟。

---

## 第一階段 — 套件驗證

| 步驟 | 操作 | 預期結果 |
|------|------|---------|
| 1.1 | 執行 `scripts/verify_release_bundle.sh runtime-bundle-tw-20260429140332` | `[PASS]` |
| 1.2 | 確認三種類型的 tar.gz 檔案均存在 | 全部存在 |
| 1.3 | 確認 checksum 與清單相符 | 相符 |
| 1.4 | 確認無違禁內容（workspace/tests/.env） | 乾淨 |

---

## 第二階段 — 環境資格審查

| 步驟 | 操作 | 預期結果 |
|------|------|---------|
| 2.1 | 對照執行期先決條件驗證作業系統與 Python 版本 | 相容 |
| 2.2 | 驗證 EDA 工具路徑與版本（Verilator、Yosys、OpenROAD、KLayout、Netgen 等） | 全部找到且版本相容 |
| 2.3 | 驗證網路隔離與氣隙要求（如適用） | 符合政策 |
| 2.4 | 驗證機密管理器連線（Vault 或 K8s） | 可存取 |

---

## 第三階段 — 配置

| 步驟 | 操作 | 預期結果 |
|------|------|---------|
| 3.1 | 使用 `profiles/enterprise_site/eda_toolchain.template.yaml` 綁定 EDA 工具鏈 | 綁定紀錄建立 |
| 3.2 | 配置機密資料綁定（Vault 或 K8s 範本） | 機密資料參照驗證通過 |
| 3.3 | 配置 RBAC 角色與審批法定人數成員 | 角色已指派 |
| 3.4 | 視需要套用站點政策覆蓋層 | 政策已套用 |

---

## 第四階段 — 啟動清單

完成 `activation-packs/enterprise_site/preflight_checklist.zh-TW.md` 中的所有項目。

預期結果：`preflight: PASS` 或 `preflight: PASS_WITH_WARNINGS`

---

## 第五階段 — 冒煙測試

完成 `activation-packs/enterprise_site/smoke_scenario.zh-TW.md` 中的冒煙情境。

預期結果：所有情境步驟完成，無紅燈關卡裁決。

---

## 第六階段 — 稽核就緒

完成 `activation-packs/enterprise_site/audit_readiness_checklist.zh-TW.md`。

預期結果：所有稽核就緒項目均已確認。

---

## 第七階段 — 啟動決策

人工授權人員審查第一至第六階段的所有結果，並記錄啟動決策。

---

## 備註

- 本驗證計畫適用於 v1.6.0。v1.17.0 請見 `validation/post-v1.17/enterprise_site/`。
- 建議升版至 v1.17.0，以取得矽晶回饋、主控台啟動關卡、套件建置登記表。
