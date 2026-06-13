# 安全性

[EN](./SECURITY.md) | [zh-TW](./SECURITY.zh-TW.md)

## 安全邊界

本儲存庫**僅為客戶端發布散布介面**。

本儲存庫嚴格禁止包含以下內容：
- 內部原始碼（`workspace/`、`tests/`、內部腳本）
- 環境機密或憑證（`.env`、API 金鑰、Token）
- 內部 PRD / 結案分析或治理文件
- Prompt、Context 或 AI Agent 內部資訊
- 供應商 IP 或客戶設計 IP

---

## 驗證發布套件

**使用前務必驗證發布 bundle。** 每個發布版均包含 checksum 檔案與發布清單。

```bash
# 驗證現行發布 bundle
scripts/verify_release_bundle.sh <bundle_id>

# 範例：
scripts/verify_release_bundle.sh runtime-bundle-tw-20260529043609
```

驗證腳本會檢查：
- 三種套件類型的 tar.gz 均存在
- Checksum 與已發布的清單相符
- 不包含任何禁止內容（workspace/、tests/、.env）
- 解壓前文件完整

---

## 通報安全問題

如果您發現 ICAF 或本發布儲存庫存在安全漏洞：

1. **請勿在 GitHub 上開立公開 Issue。**
2. 透過您既有的客戶支援管道聯絡 ICAF 安全團隊。
3. 請提供：bundle ID、套件類型、問題性質，以及相關的證據。

針對重大問題，我們目標在 **5 個工作天內** 回應。

---

## 套件完整性鏈

每個發布 bundle 包含：
- `*.checksums.json` — 所有套件檔案的 SHA-256 checksum
- `publish_manifest.json` — bundle 內容及其來源紀錄
- `publish_audit_record.json` — Binary 完整性驗證紀錄

簽名驗證細節請見 [trust/signature_verification.zh-TW.md](./trust/signature_verification.zh-TW.md)。
