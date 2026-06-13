# 啟動流程摘要

[EN](./03-activation-flow-summary.md) | [zh-TW](./03-activation-flow-summary.zh-TW.md)

1. 選擇 bundle 與套件類型
2. 驗證清單/checksum
3. 綁定 EDA 工具鏈與後端機密資料
4. 執行預飛測試（preflight）
5. 執行冒煙情境（smoke）
6. 產出啟動決策（`PASS` / `PASS_WITH_WARNINGS` / `BLOCKED`）

當完整性、預飛測試或聲稱-證據對齊失敗時，套用失敗關閉原則（fail-closed）。
