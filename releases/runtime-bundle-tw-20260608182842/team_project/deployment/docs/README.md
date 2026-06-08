# ICAF Deployment Documentation Map

This directory contains the canonical operational guidelines and automation plans for deploying and activating `ic-agent-flow` at the customer site. 

---

> **No Console, No Customer-Operable Claim.**
> 視覺主控台 Console 的成功引導已成為客戶就緒性 (Customer Readiness) 的 Exit Gate。

---

## 🗺️ Suggested Sequential Reading Path (循序閱讀地圖)

為了確保部署工程師 (Human Operator) 或自動化部署代理 (AI Agent) 能以最順暢且符合依賴關係的順序建立環境與啟動，建議按照以下 **7 個階段** 進行循序閱讀與執行：

```
[Phase 1: Substrate & Console] ──> [Phase 2: EDA Toolchain] ──> [Phase 3: Secrets & Security]
                                                                          │
[Phase 5: Binding & Plugins]   <── [Phase 4: Profile & Activation] <──────┘
            │
            └──> [Phase 6: Governed Rerun] ──> [Phase 7: Troubleshooting & Support]
```

### 1️⃣ Phase 1: Substrate & Visual Console Bootstrap (基礎與主控台引導)
*   **[CUSTOMER_ENVIRONMENT_AND_CONSOLE_BOOTSTRAP.md](CUSTOMER_ENVIRONMENT_AND_CONSOLE_BOOTSTRAP.md)**
    *   *用途*：非 EDA 本機執行引擎 (Python 3.12+, Node.js v20+, lsof) 安裝與前後端雙伺服器一鍵啟動指南。
*   **[customer_environment_and_console_bootstrap_plan.json](customer_environment_and_console_bootstrap_plan.json)**
    *   *用途*：面向 AI-Agent 的機器可讀自動化引導與 preflight 檢查計畫。

### 2️⃣ Phase 2: Open-Source EDA Toolchain Preparation (開源工具鏈推薦)
*   **[OPEN_SOURCE_EDA_TOOLCHAIN_RECOMMENDATION.md](OPEN_SOURCE_EDA_TOOLCHAIN_RECOMMENDATION.md)**
    *   *用途*：經官方驗證的開源 EDA 工具版本基線 (Verilator, Yosys, OpenROAD 等) 與編譯安裝建議。
*   **[open_source_eda_toolchain_agent_install_plan.json](open_source_eda_toolchain_agent_install_plan.json)**
    *   *用途*：AI-Agent 專用的自動化 EDA 安裝驗章契約。

### 3️⃣ Phase 3: Secrets & Security Boundary (金鑰與安全)
*   **[SECURITY_AND_SECRETS.md](SECURITY_AND_SECRETS.md)**
    *   *用途*：明定客戶站點金鑰隔離邊界與路徑防洩漏守則。
*   **[OPENAI_SECRET_SETUP.md](OPENAI_SECRET_SETUP.md)**
    *   *用途*：OpenAI API Key 的本機安全配置與權益綁定。

### 4️⃣ Phase 4: Activation & Profile Selection (選型與激活)
*   **[CUSTOMER_ACTIVATION_FLOW.md](CUSTOMER_ACTIVATION_FLOW.md)**
    *   *用途*：客戶就緒檢測 (Preflight) 與授權激活程序。
*   **[PROFILE_SELECTION_GUIDE.md](PROFILE_SELECTION_GUIDE.md)**
    *   *用途*：選擇合適的操作模式（`solo_eval` 單人評估 vs `team_project` 小組項目）。
*   **[customer-package-operations-guide.v1.0.md](customer-package-operations-guide.v1.0.md)**
    *   *用途*：解壓套件包後的標準作業程序 (SOP)。

### 5️⃣ Phase 5: Path Binding & Tooling Plugins (路徑綁定與插件)
*   **[EDA_TOOLCHAIN_BINDING.md](EDA_TOOLCHAIN_BINDING.md)**
    *   *用途*：如何將本機實體安裝的 EDA 二進位檔路徑綁定或覆寫至 ICAF 執行期。
*   **[customer_tool_plugin_guideline.md](customer_tool_plugin_guideline.md)** / **[customer_tool_plugin_playbook.json](customer_tool_plugin_playbook.json)**
    *   *用途*：如何自訂與擴充 EDA 插件以整合自有工具鏈。

### 6️⃣ Phase 6: Governed Rerun & Readiness (實體運行與驗收)
*   **[customer-local-real-eda-rerun-and-readiness-guide.v0.1.md](customer-local-real-eda-rerun-and-readiness-guide.v0.1.md)**
    *   *用途*：實體 EDA 流程重跑、特徵擷取與就緒狀態實體證據收集。

### 7️⃣ Phase 7: Diagnostics & Support Boundary (診斷與技術支持)
*   **[TROUBLESHOOTING.md](TROUBLESHOOTING.md)**
    *   *用途*：常見埠口佔用、依賴缺失與連通失敗之修復。
*   **[IP_AND_SUPPORT_BOUNDARY.md](IP_AND_SUPPORT_BOUNDARY.md)**
    *   *用途*：IP 隔離安全邊界與技術支援授權邊界。
*   **[SUPPORT_EXPORT.md](SUPPORT_EXPORT.md)**
    *   *用途*：如何安全導出脫敏的支援包以進行遠端診斷。

---

## 📄 Complete File Inventory & Usage (完整文件清單與用途)

本目錄下所有文件的詳細意義與用途對照如下：

| 檔案名稱 (File Name) | 分類 (Category) | 用途與說明 (Meaning & Usage) |
| --- | --- | --- |
| **[README.md](README.md)** | 導讀地圖 | 本目錄檔案的導讀與循序閱讀指南。 |
| **[ic_agent_flow_full_stream_sequence_contract.v0.1.md](ic_agent_flow_full_stream_sequence_contract.v0.1.md)** | 運行合約 | 明確定義 full stream（上游、中游、下游）的執行序列合約與 Knowledge Harvest 邊界。 |
| **[middlestream and downstream operator-runbook.v0.1.md](middlestream and downstream operator-runbook.v0.1.md)** | 操作手冊 | 執行 Middlestream 模擬與 Downstream 驗收時，Human/AI 必備的實體操作手冊。 |
| **[CUSTOMER_ACTIVATION_FLOW.md](CUSTOMER_ACTIVATION_FLOW.md)** | 激活流程 | 客戶站點 Preflight 環境檢測與授權激活程序。 |
| **[CUSTOMER_ENVIRONMENT_AND_CONSOLE_BOOTSTRAP.md](CUSTOMER_ENVIRONMENT_AND_CONSOLE_BOOTSTRAP.md)** | 啟動指南 | 非 EDA 環境（Node.js, python）安裝與前後端 Console 雙伺服器一鍵啟動指南。 |
| **[customer_environment_and_console_bootstrap_plan.json](customer_environment_and_console_bootstrap_plan.json)** | 機器計畫 | 面向 AI-Agent 的 Console 啟動自動化 preflight 計畫書。 |
| **[OPEN_SOURCE_EDA_TOOLCHAIN_RECOMMENDATION.md](OPEN_SOURCE_EDA_TOOLCHAIN_RECOMMENDATION.md)** | 工具推薦 | 經官方驗證的開源 EDA 工具（Verilator、Yosys 等）安裝推薦與版本基線。 |
| **[open_source_eda_toolchain_agent_install_plan.json](open_source_eda_toolchain_agent_install_plan.json)** | 機器計畫 | AI-Agent 專用的開源 EDA 工具鏈安裝自動化驗證計畫。 |
| **[SECURITY_AND_SECRETS.md](SECURITY_AND_SECRETS.md)** | 安全隔離 | 客戶站點金鑰保護與機密資料（如 OpenAI Key）隔離邊界。 |
| **[OPENAI_SECRET_SETUP.md](OPENAI_SECRET_SETUP.md)** | 金鑰配置 | 本機安全配置與注入 OpenAI API Key 步驟。 |
| **[PROFILE_SELECTION_GUIDE.md](PROFILE_SELECTION_GUIDE.md)** | 選型指南 | solo_eval 單人評估 vs team_project 小組專案等運作模式選型指南。 |
| **[customer-package-operations-guide.v1.0.md](customer-package-operations-guide.v1.0.md)** | 套件指南 | 客戶端在解壓套件包後執行標準作業（SOP）之引導指南。 |
| **[EDA_TOOLCHAIN_BINDING.md](EDA_TOOLCHAIN_BINDING.md)** | 工具綁定 | 如何將本機實體安裝的 EDA 二進位路徑覆寫與綁定至 ICAF 執行期。 |
| **[EDA_OS_DEPENDENCY_NOTE.md](EDA_OS_DEPENDENCY_NOTE.md)** | 系統相容 | 說明 EDA 工具鏈在不同操作系統環境下的相容性限制。 |
| **[customer_tool_plugin_guideline.md](customer_tool_plugin_guideline.md)** | 插件開發 | 如何自訂與擴充 EDA 插件以整合自有工具鏈。 |
| **[customer_tool_plugin_playbook.json](customer_tool_plugin_playbook.json)** | 插件配置 | 擴充 EDA 插件的範例配置設定。 |
| **[customer-local-real-eda-rerun-and-readiness-guide.v0.1.md](customer-local-real-eda-rerun-and-readiness-guide.v0.1.md)** | 實體運行 | 實體 EDA 流程重跑、特徵擷取與就緒狀態實體證據收集。 |
| **[TROUBLESHOOTING.md](TROUBLESHOOTING.md)** | 常見診斷 | 常見埠口衝突、依賴缺失與連線失敗之修復方式。 |
| **[IP_AND_SUPPORT_BOUNDARY.md](IP_AND_SUPPORT_BOUNDARY.md)** | 授權邊界 | 知識產權隔離邊界與技術支援授權邊界。 |
| **[SUPPORT_EXPORT.md](SUPPORT_EXPORT.md)** | 支持導出 | 如何安全導出脫敏的支援包以進行遠端診斷與修復。 |
| **[FOLDER_STRUCTURE.md](FOLDER_STRUCTURE.md)** | 目錄結構 | 套件發布包的實體目錄結構說明。 |
| **[PACKAGE_CONTENTS.md](PACKAGE_CONTENTS.md)** | 資產清單 | 發行套件包中所包含的治理資產與檔案清單。 |
| **[reference_docs.catalog.v1.json](reference_docs.catalog.v1.json)** | 檔案編目 | PRD v1.10 核心防偽檔案編目，用於防偽與防篡改完整性校驗。 |
| **[customer-console-and-skill-operations-guide.v1.9.md](customer-console-and-skill-operations-guide.v1.9.md)** | 操作手冊 | 執行客端 Console 與 Skill 互動時的詳細操作指引。 |
| **[deployment_operation_guide.v0.1.md](deployment_operation_guide.v0.1.md)** | 部署手冊 | 客戶站點運維與部署手冊。 |

---

## 🤖 For AI Agent Operator Rules (AI 代理導讀規則)

1.  **Strict Phase-Aware Ordering**：AI Agent 在引導部署時，**必須**從 Phase 1 (Console & Env Bootstrap) 開始驗收，不得在未驗收 Phase 1 與 Phase 2 之前擅自執行 Phase 5 的 override 動作。
2.  **Deterministic File Inspection**：AI Agent 應主動載入並驗證 `reference_docs.catalog.v1.json` 中的雜湊編目，凡與 catalog hash 或分類不合者，應立即觸發 Fail-Closed 中止。
3.  **Readiness Record Signoff**：引導完成後，AI Agent 應自動在 `artifacts/evidence/` 下核對四大證據 JSON 存在，方可向 Human Authority 發起 Activation 請求。
