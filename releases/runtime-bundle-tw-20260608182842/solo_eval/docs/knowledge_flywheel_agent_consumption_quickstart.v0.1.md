# Knowledge Flywheel Agent Consumption Quickstart v0.1

**文件 ID**：`knowledge_flywheel_agent_consumption_quickstart.v0.1`  
**狀態**：ACTIVE  
**分類**：CUSTOMER_REVIEWABLE（可進 customer package；customer operator / local AI agent 可見）  
**治理 PRD**：PRD v1.1 → v1.1.1 — AAA-Inspired Knowledge Flywheel Baseline  
**版本**：v0.1  
**建立時間**：2026-05-26T08:27:00+08:00  

> **受眾**：AI agent、local agent、customer operator  
> **目的**：給 AI agent 一個快速進入 knowledge leverage 的操作路徑，讓 existing knowledge assets 在正確的任務時機被主動消費，而不是只被收藏。

---

## 1. Purpose

PRD v1.1 的 Law 5 明確說：

> **Shared Assets Must Be Consumable** — 共享資產若不能被 future checkout / context assembly / evaluator / checklist / retrieval surface 消費，則不應視為完成 promotion。

但在實際工作中，存在一個 **consumption gap**：

- 已收集的 knowledge assets 沒有在正確時機被使用
- AI agent 不知道「這個任務開始前，應該先讀哪個 asset」
- 沒有快速的 trigger → discover → consume 路徑

**本文件解決這個 gap**，定義 AI agent 在任何 governed task 開始前的標準消費流程。

---

## 2. Mandatory Pre-Task Rule

**在開始任何以下類型的任務之前，agent 必須先執行 Section 4 的 7 步驟 operating sequence：**

- upstream / middlestream / downstream work
- package QA
- customer release hardening
- console action backend work
- leak scan / artifact URI / build-time enforcement work
- skill pack build / update
- README / status / current truth update
- phase closeout / QA verdict
- action plan 建立或重構

> **違反規則的代價**：如果不先消費相關 knowledge assets，agent 可能重複犯已知的錯誤（例如：把 phase rollup 標成 GREEN 但沒有 commit SHA 證據；或者 artifact_uri 沒有 publish 就宣稱 release complete）。

---

## 3. Task Class → Asset Trigger Map

根據你要執行的任務類型，查找應該先讀的相關 assets：

| 任務類型 | 對應 Asset Trigger | 應讀的 Asset |
|---|---|---|
| **package build / 套件構建** | `package_build`, `skill_pack_build` | `skill_pack_build_time_enforcement`、`artifact_uri_publication_contract`、`sanitized_payload_leak_scan` |
| **release candidate QA** | `release_hardening`, `release_candidate_review` | `artifact_uri_publication_contract`、`evidence_anchored_phase_rollup`、`sanitized_payload_leak_scan` |
| **skill pack build / update** | `skill_pack_build`, `ci_gate_update` | `skill_pack_build_time_enforcement` |
| **README / status badge / current truth 更新** | `readme_update`, `status_badge_update`, `snapshot_publish` | `current_truth_snapshot_boundary` |
| **phase closeout / GREEN rollup / QA verdict** | `phase_closeout`, `qa_verdict`, `green_rollup` | `evidence_anchored_phase_rollup` |
| **action plan / matrix / addendum 建立或重構** | `action_plan_update`, `addendum_consolidation` | `single_source_action_plan_matrix` |
| **leak scan / support bundle / 敏感 payload 匯出** | `leak_scan`, `support_bundle_export`, `redaction_validation` | `sanitized_payload_leak_scan`、`artifact_uri_publication_contract` |
| **console package index 更新** | `console_index_update`, `package_qa` | `artifact_uri_publication_contract`、`evidence_anchored_phase_rollup` |

**如果你的任務同時跨多個類型，取聯集讀取全部相關 assets。**

---

## 4. Agent Operating Sequence（7 步驟）

```
DISCOVER → LOAD → CONVERT → CONSUME → EXECUTE → RECORD → PROPOSE
```

### Step 4.1：DISCOVER — 識別任務類型
```text
對照 Section 3 的 Task Class → Asset Trigger Map
確認當前任務屬於哪種類型
如果不在表中，查看 consumption_triggers 欄位最接近的 asset
```

### Step 4.2：LOAD — 讀取相關 registry 條目
```text
位置：workspace/docs/governance/closeout/v1.1/package_qa_p0_p1_p3_flywheel_candidates/
文件：candidate_asset_registry.package_qa_p0_p1_p3_flywheel.json

讀取與 Section 3 對應的 asset 條目，重點關注：
  - summary（一句話精華）
  - reusable_lesson（條列式 lesson）
  - quick_action（立即行動清單）
  - required_before_tasks（任務前必確認事項）
```

### Step 4.3：CONVERT — 轉成 task checklist
```text
把每個 asset 的 quick_action 複製成當前任務的 pre-flight checklist
格式：
  [ ] <quick_action item 1>
  [ ] <quick_action item 2>
  ...
在開始主任務前，逐一確認 checklist
```

### Step 4.4：CONSUME — 執行任務時應用 guardrail
```text
在編輯 / review / 實作時，把 asset 的 lesson 當作 guardrail：
  - 如果遇到與 asset reusable_lesson 相符的情境，立即 apply
  - 如果 guardrail 觸發，記錄「哪個 asset 防止了這個錯誤」
```

### Step 4.5：EXECUTE — 正常完成主任務
```text
執行主任務，同時保持 checklist open
每完成一個 checklist item，標記 [x]
如果某個 checklist item 在當前情境不適用，標記 [N/A] 並說明理由
```

### Step 4.6：RECORD — 記錄消費事件
```text
任務完成後，在 progress.md 或對應的 closeout 文件中記錄：
  - 消費了哪個 asset（asset_id）
  - 是否有效（asset 是否防止了錯誤、或加速了任務）
  - 是否有遺漏（asset 沒有覆蓋到但本次發現了新 pattern）
格式：
  knowledge_asset_consumption: <asset_id>, effective: yes/no, note: <optional>
```

### Step 4.7：PROPOSE — 如果發現新 pattern，提出 extraction
```text
如果當前任務產生了新的可重用 pattern：
  1. 在 findings.md 記錄觀察
  2. 使用 icaf-knowledge-asset-extraction skill 啟動 extraction
  3. 或標記為「待下次 closeout 處理」
```

---

## 5. Consumption Record Format

每次消費 asset 後，記錄以下格式（可附在 progress.md 的相關條目或 closeout 文件）：

```yaml
knowledge_asset_consumption_record:
  asset_id: "knowledge_asset_candidate.package_qa.skill_pack_build_time_enforcement_20260526"
  task_context: "building customer package variant for team_project mode"
  consumed_at: "2026-05-26T09:00:00+08:00"
  effective: true
  prevented_issue: "Verified resolver was called before build; avoided INTERNAL_ONLY skill inclusion"
  asset_gap_found: null
```

> **為什麼要記錄**：consumption record 是 PRD v1.1 impact tracking 的基礎。沒有消費記錄，就無法知道哪些 assets 真的在改善工程品質，哪些只是 archive。

---

## 6. Fail-Closed Cases（6 種 block 情境）

以下情況 agent 應**停止任務並先解決**，不能繼續執行主任務：

| 情境 | 阻斷行為 |
|---|---|
| 相關 asset registry 不存在 | 回報「無 knowledge asset 可消費，需要先 extraction」 |
| Asset 缺少 evidence refs | 不信任 asset 的 lesson，標記為「unverified asset」，不 apply |
| Asset 標記為 stale / deprecated | 不使用過時 asset；尋找替代或回報缺口 |
| Asset classification 禁止當前 package mode | 停止，不把 INTERNAL_ONLY asset 引用進 customer-visible 輸出 |
| Customer-visible package 嘗試包含 INTERNAL_ONLY asset | fail-closed，同步 build-time enforcement |
| Asset 宣稱 GREEN 但無 commit SHA 或 test output | 停止接受 GREEN 宣告；要求提供物理 evidence |

---

## 7. The 6 Current Assets Quick Reference

**直接可用的 quick_action checklist（任務開始前查閱）：**

### 7.1 skill_pack_build_time_enforcement
**什麼時候用**：build skill pack / package / 更新 CI gate  
**快速行動**：
- [ ] 確認 `build_distribution_bundle.py` 在每個 variant build 前呼叫 `_resolve_skill_pack_for_variant()`
- [ ] 確認 BLOCKED 時觸發 `RuntimeError`（不是 warning）
- [ ] 確認 `skill_pack_resolution_report.json` 寫入 staging 且 build record 有引用

### 7.2 current_truth_snapshot_boundary
**什麼時候用**：更新 README / status badge / current truth snapshot  
**快速行動**：
- [ ] 確認 snapshot 段落有明確標示「這是 SNAPSHOT，不是 current state」
- [ ] 確認 current state 段落顯示當下最新狀態
- [ ] 如果同一份文件有兩個不同時間點的內容，加時間切面說明

### 7.3 evidence_anchored_phase_rollup
**什麼時候用**：宣稱 GREEN / phase PASS / QA closeout  
**快速行動**：
- [ ] 確認每個 GREEN 宣告有對應 commit SHA
- [ ] 確認每個 GREEN 宣告有對應 test output 或 validation artifact
- [ ] 不接受「預計 GREEN」或「應該 PASS」——必須是已執行的物理證據

### 7.4 artifact_uri_publication_contract
**什麼時候用**：package QA / release candidate 審核 / console index 更新  
**快速行動**：
- [ ] 確認 QA evidence 已 publish 到 console index（不只是 local cache）
- [ ] 確認有正式 `artifact_uri`（非空、可驗證、可外部引用）
- [ ] 如果 `artifact_uri` 為空，禁止宣稱 release complete / production-ready

### 7.5 single_source_action_plan_matrix
**什麼時候用**：建立 action plan / 修改 matrix / 合併 addendum  
**快速行動**：
- [ ] 確認 action plan 只在一個地方（不建立平行附錄）
- [ ] 確認每個 action item 有「主要檔案 / 根因 / 修法 / 驗收條件」四欄
- [ ] 如果有多個 action plan 文件，選一個為 canonical，其他標記為 deprecated

### 7.6 sanitized_payload_leak_scan
**什麼時候用**：package QA / support bundle / 任何 sanitized payload export  
**快速行動**：
- [ ] 確認 leak scan 掃的是**實際 emitted bytes**（不是 virtual / raw）
- [ ] 確認 scan 包含 path leak、secret/credential、internal-only marker
- [ ] 確認 scan 結果為 `0 hits`，而非依賴 whitelist

---

## 8. Skill Invocation Reference

### 8.1 用於 extraction（事後）
```text
Skill：icaf-knowledge-asset-extraction（INTERNAL_ONLY）
何時使用：任務完成後，發現可重用 pattern，需要正式提取進 flywheel
操作：
  1. 識別來源事件
  2. 按 knowledge_asset_extraction_playbook.v0.1.md 的 10 步驟 SOP 執行
```

### 8.2 用於 consumption（事前）
```text
Skill：icaf-knowledge-flywheel-consume（INTERNAL_ONLY）
何時使用：任何 governed task 開始前
操作：
  1. 告知 skill 當前任務類型
  2. skill 自動查找對應 asset trigger
  3. 輸出 pre-flight checklist
```

> **注意**：兩個 skill 的實作為 INTERNAL_ONLY；本文件（Consumption Quickstart）是 customer-visible 的操作說明，skill 實作本身不隨 customer package 分發。

---

**本文件 classification**：`CUSTOMER_REVIEWABLE`  
**適用 package modes**：可進 `solo_eval` / `team_project` / `enterprise_site`（需 catalog entry）  
**治理 PRD**：PRD v1.1.1 Section 15 — Agent-Operable Consumption Surface  
**關聯文件**：[knowledge_asset_extraction_playbook.v0.1.md](./knowledge_asset_extraction_playbook.v0.1.md)（SUPPORT_ONLY）
