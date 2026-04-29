# OpenAI / Backend Secret Setup（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `docs/openai-backend-secret-setup.md`
> source_sha256: `38487d5a049bd40a6f04eb92d4bbab1cd27662c0fe18a658d257623b3893376d`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# OpenAI / Backend Secret Setup

1. 在 customer site 設定 secret（不寫入 repo）。
2. 僅提供 secret reference 給 runtime。
3. 驗證 log/support bundle 不含 secret value。
4. `airgap_local` profile 禁止 remote backend routing。

