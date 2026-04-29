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
