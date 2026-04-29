# Upgrade and Rollback Guide（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `docs/upgrade-rollback-guide.md`
> source_sha256: `2f55c3da969d85d442c206b1572058df4046bdad94624d01e0e5b4bb575b8c85`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# Upgrade and Rollback Guide

1. 先驗證新 bundle（manifest/checksum/gate）。
2. 在維護窗口執行升級。
3. 若 preflight/smoke 失敗，立即回滾上一版。
4. 保留升級/回滾記錄以供審計。

