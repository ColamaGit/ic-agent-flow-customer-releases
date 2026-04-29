# Folder Structure（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `docs/folder-structure.md`
> source_sha256: `75592e2315ebf9cdb60d67936e4a4e597ff22b2488c5b3c8bf9b9c819852b289`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# Folder Structure

- `releases/runtime-bundle-tw-*`: 唯一 payload 真值。
- `releases/version-pointers/*.json`: 版本指標（含 `LATEST.json`）。
- `docs/`: 對客操作文件。
- `activation-packs/`: variant 啟用前檢查與情境清單。
- `profiles/`: site config 範本。

