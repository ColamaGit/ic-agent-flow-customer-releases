# Security and Secrets（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `docs/security-and-secrets.md`
> source_sha256: `c3ecb36f82b0a2a527fcab3cf1c4c14f59e614a5196c0ac9ef7cc4a7d0ad88cd`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# Security and Secrets

- secrets 不得進 package artifact。
- `.env` / key 不得進 support bundle。
- production 建議使用 secret manager（Vault/KMS/K8s Secret）。
- log/support export 須 redaction。

