# 簽名驗證

[EN](./signature_verification.md) | [zh-TW](./signature_verification.zh-TW.md)

## 概述

每個 ICAF 發布 bundle 都包含完整性驗證產出物。本文件說明如何驗證發布套件的真實性與完整性。

---

## 每次發布提供的內容

| 產出物 | 位置 | 用途 |
|--------|------|------|
| `*.checksums.json` | `releases/<bundle_id>/` | 所有套件檔案的 SHA-256 checksum |
| `publish_manifest.json` | `releases/<bundle_id>/` | Bundle 內容與來源紀錄 |
| `publish_audit_record.json` | `releases/<bundle_id>/` | Binary 完整性驗證紀錄（來源→目的地雜湊比對） |
| 公開簽名金鑰 | `trust/public_keys/release-signing-key.pub` | 發布簽名公鑰（有簽名時可用） |

---

## 完整性驗證步驟

### 步驟一 — 執行驗證腳本

```bash
scripts/verify_release_bundle.sh <bundle_id>
```

此腳本自動檢查：
- 所有預期的套件類型檔案（tar.gz、清單、checksum）均存在
- Checksum 與已發布的清單相符
- 不包含任何違禁內容（workspace/、tests/、.env）
- 解壓前文件完整

預期輸出：`[PASS] bundle verification ok: <bundle_id>`

### 步驟二 — 手動 Checksum 驗證（選用）

如需額外確認，可手動驗證個別檔案的 checksum：

```bash
# 查看你的套件類型的 checksum 檔案
cat releases/<bundle_id>/<variant>.checksums.json

# 手動驗證特定檔案
shasum -a 256 releases/<bundle_id>/<variant>/<package>.tar.gz
```

將輸出與 checksum 檔案中的值進行比對。

### 步驟三 — 檢查發布稽核紀錄

```bash
cat releases/<bundle_id>/publish_audit_record.json
```

需驗證的關鍵欄位：
- `binary_integrity_verified: true` — 來源與目的地雜湊相符
- `git_commit_performed: true` — 提交已記錄
- `git_push_performed: true` — 推送已記錄

---

## 信任根

本儲存庫的信任根清單位於：
```
trust/trust_root_manifest.json
```

此檔案記錄儲存庫的信任錨點、公鑰參照與驗證政策。

---

## 備註

- 發布套件的密碼學簽名（GPG/SSH）計畫在未來版本提供。
- 簽名功能上線前，完整性透過 SHA-256 checksum 與發布稽核紀錄建立。
- 絕對不要使用 checksum 驗證失敗的發布 bundle。
