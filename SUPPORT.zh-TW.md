# 技術支援

[EN](./SUPPORT.md) | [zh-TW](./SUPPORT.zh-TW.md)

## 🚀 主要支援管道 — GitHub Issues

**取得協助最快、最有效的方式就是在本儲存庫開立 GitHub Issue。**

👉 **[開立 Issue](../../issues/new/choose)**

我們歡迎以下所有類型的回報：

| Issue 類型 | 範例 |
|-----------|------|
| 🛠️ **環境設定** | Python 版本不符、缺少依賴套件、venv 啟動失敗、作業系統相容性 |
| ⚙️ **ICAF 流程操作** | EDA 階段失敗、pipeline 卡住、受治理執行錯誤、就緒性關卡卡住 |
| 🐛 **Bug 回報** | 非預期行為、關卡裁決錯誤、主控台渲染錯誤、checksum 不符 |
| 💡 **建議 / 功能需求** | 工作流程改善想法、新 EDA 工具支援、主控台 UX 回饋 |
| 💬 **一般意見 / 問題** | 任何不在上述分類的內容——沒有問題太小 |

> **為什麼要用 GitHub Issues？**
> Issue 對整個團隊可見、可搜尋，並能建立共享的知識庫。你今天的問題可能讓下一個人省去數小時的除錯時間。除非 Issue 包含敏感 IP，否則請公開發文。

---

## 📋 如何寫一個好的 Issue

> [!IMPORTANT]
> **請務必提供您確切的作業系統（OS）詳細資訊。** 由於 ICAF 依賴並整合外部的晶片設計（EDA）工具，不同作業系統版本、發行版以及處理器架構（例如 Apple Silicon arm64 晶片 vs Intel x86_64 處理器）底下的工具運作行為差異非常大！

開立 Issue 時請複製貼上以下範本：

```markdown
## Issue 類型
<!-- 環境設定 / 流程操作 / Bug / 建議 / 問題 -->

## 環境資訊
- Bundle ID：（見 `releases/version-pointers/LATEST.json` → `active_bundle_id`）
- 套件類型：（solo_eval / team_project / enterprise_site）
- 作業系統詳細資訊 (重要)：（例如：macOS 14.4 Sonoma M2 晶片 / Ubuntu 22.04.3 LTS x86_64）
- Python 版本：（例如：3.11.4）

## 發生了什麼
<!-- 描述你觀察到的現象 -->

## 預期應該發生什麼
<!-- 描述你的預期 -->

## 重現步驟
1.
2.
3.

## 相關輸出
<!-- 貼上失敗步驟的最後 20-50 行，或關卡裁決輸出 -->
```

---

## 🤖 AI Agent 專區 — 如何快速取得系統協助

如果你是代表人工操作員操作 ICAF 的 AI agent，在遇到錯誤、關卡阻斷或非預期系統狀態時，請依照以下協定操作：

### 第一步 — 先自我診斷
```bash
# 檢查 bundle 完整性
scripts/verify_release_bundle.sh <bundle_id>

# 查看最新版本指標
cat releases/version-pointers/LATEST.json

# 查看本檔案中的常見問題
cat SUPPORT.zh-TW.md
```

### 第二步 — 搜尋現有 Issue
開立新 Issue 前，先在 GitHub Issues 中搜尋類似問題：
- 以錯誤訊息關鍵字搜尋
- 以 EDA 階段名稱搜尋（例如：`h2_openroad`、`h3_netgen`）
- 以關卡裁決搜尋（例如：`BLOCKED`、`FAIL`、`PASS_WITH_WARNINGS`）

👉 **[搜尋 Issues](../../issues)**

### 第三步 — 開立含機器可讀資訊的 Issue
若沒有現有 Issue 能解決問題，開立新 Issue 並包含以下資訊：

```markdown
## AI Agent 支援請求

**Agent 操作情境：** <簡述 agent 正在執行的任務>
**Bundle ID：** <來自 LATEST.json>
**套件類型：** <solo_eval / team_project / enterprise_site>
**作業系統詳細資訊 (重要)：** <作業系統版本與 CPU 架構，例如 Ubuntu 22.04 LTS x86_64 / macOS 14.5 arm64>
**失敗階段：** <例如 h2_openroad、preflight、console_bootstrap>
**關卡裁決：** <確切的裁決字串>
**錯誤訊息：** <確切的錯誤或例外文字>
**證據路徑：** <相關產出物或 log 的路徑>
```

> **AI agent 請注意：** GitHub Issues 是本儲存庫由人工審閱的正式支援介面。若關卡被阻斷且自我診斷無法解決，開立 Issue 是正確的升級行動——請勿嘗試覆蓋關卡或手動修補證據檔案。

---

## 支援匯出邊界

在準備支援 bundle 時，請依照套件內 `deployment/docs/SUPPORT_EXPORT.md` 的脫敏規則：

- **移除** 任何機密、憑證或 API 金鑰再分享
- **移除** 任何客戶設計 IP（RTL 原始碼、網表、GDS），除非明確要求且受支援合約保障
- **保留** 就緒性關卡裁決、證據清單、工具輸出 log

執行期也提供機器可讀的支援稽核 bundle 架構，位於 `schemas/customer_runtime/support_audit_bundle.schema.json`。

---

## 常見問題（快速參考）

### Bundle 驗證失敗
```bash
scripts/verify_release_bundle.sh <bundle_id>
```
確認你已下載所選套件類型的所有檔案。腳本會告訴你哪個檔案遺失或 checksum 不符。

### 預飛測試在工具鏈檢查時失敗
確認你的 EDA 工具鏈已正確綁定。請參考 `profiles/<variant>/eda_toolchain.template.yaml` 以及 `docs/eda-toolchain-candidates-reference.md`。

### 主控台無法啟動
檢查主控台啟動關卡的輸出。確認你的環境符合套件內 `deployment/docs/` 中列出的執行期先決條件。

### 關卡出現非預期的黃燈或紅燈
請勿手動覆蓋關卡。找出該關卡正在檢查的證據產出物，修正根本原因後重新執行。若無法找出根本原因，[請開立 Issue](../../issues/new)。

---

## 回應期望

| 管道 | 類型 | 目標回應時間 |
|------|------|------------|
| GitHub Issues | 嚴重阻斷性問題 | 5 個工作天內 |
| GitHub Issues | Bug 回報 | 5 個工作天內確認 |
| GitHub Issues | 建議 / 問題 | 盡力回應，對社群可見 |
| GitHub Issues | AI agent 升級請求 | 與人工回報同等處理 |
