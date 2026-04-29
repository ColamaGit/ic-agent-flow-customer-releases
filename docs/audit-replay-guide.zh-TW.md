# Audit Replay Guide（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `docs/audit-replay-guide.md`
> source_sha256: `4cd8f4914315b03e2ae1726b3dd24deabacce8815c287bd565dc3b0742ba6cd6`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# Audit Replay Guide

- 保留 bundle id、variant、run_id、timestamp、manifest/checksum 記錄。
- 重放時必須使用同一 bundle 與相同 profile。
- 差異判定以 gate/verdict/claim-boundary 為主，path/timestamp 可 normalize。

