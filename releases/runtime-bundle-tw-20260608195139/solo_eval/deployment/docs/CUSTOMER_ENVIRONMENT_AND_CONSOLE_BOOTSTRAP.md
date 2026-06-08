# Customer Environment & Visual Console Bootstrap Guidelines

This guide is a customer visual-console bootstrap contract.
It covers non-EDA runtime prerequisites, dual-server startup, console preflight, API readiness, package-extract safety, and fail-closed customer bootstrap verification.

---

> **No Console, No Customer-Operable Claim.**
> 沒有可成功 bootstrap 的主控台 Console，就不能宣稱 customer package 已具備可操作性。
>
> `ic-agent-flow` 包含多個需要人類決策（human judgment/decision）的審查閘門 (gates & checkpoints)。視覺主控台 Console 絕非單純 UI 視圖，而是整個治理體系中供人類決策者進行 Approve、Hold、Reject 與稽核重播的 **Human Authority Operation Surface (操作與信任入口)**。

---

## 1. Non-EDA Runtime Prerequisites

在進行視覺主控台引導前，客戶站點必須安裝並預備好以下非 EDA 作業系統與執行期相依套件：

### System-level CLI Prerequisites
*   **lsof (Mandatory)**：用於進行伺服器埠口獨佔性與行程特徵的 Preflight 驗證。若缺失此工具，引導程序將觸發 Fail-Closed BLOCKED。
*   **curl (Optional)**：用於進行 API 連通性與健康度的主動探測。若系統無 `curl`，系統將自動 fallback 採用 Python-based `urllib` 連通性檢查。
*   **git & tar**：用於進行套件包提取與版控完整性校驗。

### Runtime Engines
*   **Python v3.12+**：用於執行 `intake_api_server.py` 以及核心 PPA 驗證組件。本機必須具備 Python 標準庫與 `jsonschema`、`pydantic` 模組依賴。
*   **Node.js LTS (v20+) & npm**：用於 Vite 前端編譯與執行。
    > *註：Validated 版本應源自當前發布套件之 CI 或實體驗證證據。若專案隨治理變更調整 Node/Python 基線，本計畫將同步通過 catalog-governed 變更控制更新。*

---

## 2. Dual-Server Bootstrap Architecture

視覺主控台由前後端雙伺服器協同運行：
1.  **Vite React Console (前端 UI)**：預設運行於 Port `5173`。提供 Flow Map、Decision Inbox 等操作視圖。
2.  **Intake API Server (Python 後端)**：預設運行於 Port `8787`。由 standard library 實作的 `intake_api_server.py` 提供純淨後端 API。

### Startup Order & Sequence
1.  **Ports Preflight**：檢查 `5173` 與 `8787`，確保未被未知行程佔用。
2.  **API Backend Launch**：啟動後端，傳入隨機產生的 `boot-token` 作為會話防護安全憑證。
3.  **Readiness Healthcheck**：AI Agent 或 Operator 使用 `curl` 或 Python urllib 探測 `http://127.0.0.1:8787/api/intake/options`，確認返回 HTTP 200 與 valid JSON，且無 HTML 誤解析。
4.  **Frontend Launch**：後端成功就緒後，於 `workspace/console` 目錄執行 `npm run dev:frontend` 啟動前端開發伺服器。

---

## 3. Security Boundary & Path-Leak Defense Rules

### AI Agent Security Laws (去敏與防洩漏規則)
1.  **Secret Redaction**：AI Agent 絕不能在客戶端日誌或 Console 終端中印出敏感密鑰 (如 OpenAI API Key)。
2.  **Zero Token Persistence**：禁止將會話 `boot-token` 持久化至任何編目 (Catalog) 或提交的文件中。
3.  **No local .env commits**：禁止提交任何本機環境變數與金鑰檔案。
4.  **Redacted Bootstrap Records**：所有產出之引導證據均須去除敏感資訊。

### Path-Leak Scan Patterns
客戶端所有可視日誌、Evidence 檔案及 Console 輸出，必須通過開發者絕對路徑洩漏檢測。凡包含 `/Users/...`、`workspace/...`、`internal-dev/...` 等開發庫本機絕對路徑，均觸發 Fail-Closed BLOCKED，防止敏感環境資訊外流。

---

## 4. Minimum Action Governance Smoke

Console 的操作並非僅改變 UI 狀態。為確保 Human Action 能產生正式治理紀錄，引導驗證至少須成功跑通「最小決策 Action 測試」並留存四大證據檔案：
*   **submit disposable action**：送出單次 disposable human approval 請求。
*   **verify no state-only mutation**：驗證此操作非純 UI 狀態變更，而是成功寫入實體治理對象檔案。
*   **verify audit record presence**：驗證產出的 audit log 包含 `actor`、`role`、`target`、`before-after` 狀態及 `evidence_refs` 等 smoke fixture 憑證。

---

## 5. Non-Claims (免責聲明)

> [!WARNING]
> This baseline validates the current package-console bootstrap path. It does not yet certify a production-grade hosted console deployment. If a future package switches to static build + static server, the bootstrap plan and healthcheck contract must be updated.
> 本基線僅供客戶本機 Eval / Solo / Team 操作引導驗證。未來若套件切換為靜態編譯建置與託管伺服器，將通過變更控制程序對本計畫進行同步升級。

---

## 6. Emitted Evidence Records

成功完成主控台引導與 Preflight 後，系統必須於 `artifacts/evidence/` 下產出以下 4 份核心 JSON 證據文件：
1.  `console_bootstrap_record.json`：紀錄解壓路徑、引擎版本與引導總 verdicts。
2.  `console_preflight_report.json`：紀錄埠口獨佔檢測與相依性環境掃描報告。
3.  `console_healthcheck_result.json`：紀錄前後端網址探測及回傳 JSON 結構校驗結果。
4.  `console_action_audit_smoke_result.json`：紀錄最小 Action 運作及治理 audit record 簽署紀錄。
