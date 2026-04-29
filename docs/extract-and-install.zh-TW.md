# Extract and Install（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `docs/extract-and-install.md`
> source_sha256: `1e9c3eef8f68f9b75e326aef70ef14e29957b95d672ec4503e529bc3285e5a1a`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# Extract and Install

1. 驗證 bundle：`scripts/verify_release_bundle.sh <bundle_id>`。
2. 進入 variant 目錄，確認 `.tar.gz`、`*.manifest.json`、`*.checksums.json`。
3. 解壓 package 到 customer working directory。
4. 依 package 內 `deployment/docs/EXTRACT_AND_INSTALL.md` 執行安裝流程。
5. 完成後執行 preflight 與 smoke scenario。

