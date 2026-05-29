# ic-agent-flow Customer Releases

[EN](./README.md) | [zh-TW](./README.zh-TW.md)

此儲存庫是 `ic-agent-flow` 對客戶公開的 release registry。  
它不是原始碼開發儲存庫。

## What is ic-agent-flow

`ic-agent-flow` 是一套以治理優先（governance-first）的 IC 設計流程 runtime。  
它把 requirement/spec/graph/EDA execution/readiness 產物串成可稽核、可重播的證據鏈。

## Current Capability (Customer Surface)

- PRD v1.0: `intake -> spec -> graph -> validation -> freeze -> plan`
- PRD v0.9: 受治理的開源 EDA 鏈（`H0/H1/H2/H4/H3`）
- PRD v1.3: controlled release / contract boundary
- PRD v1.5/v1.6: package variants + controlled distribution / IP boundary
- PRD v1.10/v1.15: **v1.17.0** — Silicon Feedback 修復面板、Console Bootstrap Gate、Package Build Registry 歷史保護

## 現行 Release

| 版本 | Bundle | 狀態 |
|---|---|---|
| **v1.17.0** | `runtime-bundle-tw-20260529043609` | ✅ ACTIVE |
| v1.6.0 | `runtime-bundle-tw-20260429140332` | LEGACY |

詳見 [RELEASE_INDEX.md](./RELEASE_INDEX.md) 與 `releases/version-pointers/LATEST.json`。

## Expected Results After a Normal Run

1. 上游真值物件（spec/graph/validation/freeze/plan）
2. EDA artifacts（raw/normalized/evidence）
3. readiness report 與 gate verdict
4. 可稽核的 manifest/checksum/lineage 紀錄

## Open-Source EDA Toolchain References

請見：[docs/eda-toolchain-candidates-reference.md](./docs/eda-toolchain-candidates-reference.md)

## Guest/Customer Reading Pack

請見：`briefings/`

## Quick Start

1. 先看 [RELEASE_INDEX.md](./RELEASE_INDEX.md) 找到目前生效 bundle。
2. 選擇 variant：`solo_eval`、`team_project`、`enterprise_site`。
3. 解壓前先閱讀 variant `README.md` 與 `deployment/docs/*`。
4. 執行 `scripts/verify_release_bundle.sh <bundle_id>`。

## Release Truth

- payload root: `releases/runtime-bundle-tw-*`
- semantic pointers: `releases/version-pointers/*.json`
- latest pointer: `releases/version-pointers/LATEST.json`
