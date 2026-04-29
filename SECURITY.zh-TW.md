# Security（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `SECURITY.md`
> source_sha256: `4104ef333e38927853b94a1775ad260d96e7b7f95480a0aaa08fc56f6c80c003`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# Security

## Boundaries

- 此 repo 僅交付 customer-facing release payload。
- 不得包含：`workspace/`、`tests/`、`.env`、internal PRD/closeout、prompt/context strategy。

## Verification

- 先驗證 checksums/manifests。
- 建議執行：`scripts/verify_release_bundle.sh <bundle_id>`。

