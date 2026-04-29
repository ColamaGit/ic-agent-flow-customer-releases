# ic-agent-flow Capability One-Pager（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `briefings/01-capability-one-pager.md`
> source_sha256: `35ef7c3c642729c80e3ee91dcbb828e2637b817d6aa16061ebbc9545af3311b9`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# ic-agent-flow Capability One-Pager

## What it is

`ic-agent-flow` 是一套以治理與證據鏈為核心的 IC 設計流程 runtime，目標是讓需求到 EDA/readiness 的執行結果可追溯、可審核、可重放。

## What it does now

- 上游治理主線：`intake -> spec -> graph -> validation -> freeze -> plan`
- EDA 執行主線：`H0/H1/H2/H4/H3`（開源工具鏈候選）
- 證據產出：raw/normalized/evidence + readiness verdict
- 對客交付：`solo_eval` / `team_project` / `enterprise_site` 三種 package 變體

## Typical outputs

1. 上游真值物件（spec/graph/validation/freeze/plan）
2. EDA artifacts（raw/normalized/evidence）
3. readiness report 與 gate verdict
4. manifest/checksum/lineage 稽核資料

## Boundaries

- 本 repo 是 customer-facing release surface，不是 source development repo。
- 不交付 `workspace/`、internal tests、internal PRD/closeout、prompt/context strategy、secrets。

