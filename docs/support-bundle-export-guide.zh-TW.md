# Support Bundle Export Guide（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `docs/support-bundle-export-guide.md`
> source_sha256: `0bfe5e6e03efcf1ca433de82567711bef1d288104661fea6153e2b22f9cb058b`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# Support Bundle Export Guide

- export 前先確認 incident scope/time window。
- 僅輸出 allowlist artifact。
- 套用 dual-redaction（customer IP + vendor IP）。
- 禁止輸出 source tree、secret、internal governance content。

