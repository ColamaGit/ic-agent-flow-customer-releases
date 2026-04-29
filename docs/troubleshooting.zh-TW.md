# Troubleshooting（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `docs/troubleshooting.md`
> source_sha256: `96d79f69c4f577b15f35ae04c10adf548a8797f66a6549f761113151509e5552`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# Troubleshooting

- Gate fail：先檢查 `customer_release_staging_manifest.json` 與 variant manifests。
- Preflight fail：先確認 EDA tool paths/version。
- Secret fail：檢查 secret reference 是否可讀，且不在 repo 內。
- Claim mismatch：檢查 dual-run parity 報告（normalize 後再 diff）。

