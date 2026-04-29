# ic-agent-flow Customer Releases

[EN](./README.md) | [繁中](./README.zh-TW.md)

這是 customer-facing release registry，不是開發 source repo。

## What is ic-agent-flow

`ic-agent-flow` 是一套以治理與證據鏈為核心的 IC 設計流程 runtime。  
它把自然語言需求、設計規格、架構圖、RTL/EDA 執行、readiness 報告串成可追溯的決策流程。

## What ic-agent-flow can do now

目前主線能力（對外可用面）包含：

- PRD v1.0：`intake -> spec -> graph -> validation -> freeze -> plan`
- PRD v0.9：`H0/H1/H2/H4/H3` 開源 EDA 鏈與 readiness 證據輸出
- PRD v1.3：controlled release / silicon contract 邊界
- PRD v1.5/v1.6：customer package variants + controlled distribution / IP boundary

能力摘要請以本 repo `briefings/` 目錄為準（customer-facing 版本）。
若需最新版 capability brief，請由維運窗口同步到本 repo，不依賴 private source repo 連結。

## Expected Results After Normal Run

正常執行後，應取得：

1. 上游真值物件（spec/graph/validation/freeze/plan）
2. EDA 執行 artifacts（raw/normalized/evidence）
3. readiness 報告與 gate verdict
4. 可審計的 manifest / checksum / lineage 紀錄

## Open-Source EDA Toolchain References

`H0/H1/H2/H4/H3` 候選工具連結請見：
- [docs/eda-toolchain-candidates-reference.md](./docs/eda-toolchain-candidates-reference.md)

## Guest/Customer Reading Pack

本 repo 已提供 `briefings/` 作為 guest/client/customer 的閱讀入口（白皮書、簡報、說明索引）。

## Quick Start

1. 先看 [RELEASE_INDEX.md](./RELEASE_INDEX.md) 找到目前有效 bundle。
2. 依 variant 選擇 package：`solo_eval` / `team_project` / `enterprise_site`。
3. 先讀 package 旁的 `README.md` 與 `deployment/docs/*`，再解壓安裝。
4. 執行 `scripts/verify_release_bundle.sh <bundle_id>` 驗證 release 完整性。

## Release Truth

- payload root: `releases/runtime-bundle-tw-*`
- semantic pointers: `releases/version-pointers/*.json`
- latest pointer: `releases/version-pointers/LATEST.json` (to be maintained)
