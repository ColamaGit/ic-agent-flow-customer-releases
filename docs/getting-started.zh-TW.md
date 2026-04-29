# Getting Started（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `docs/getting-started.md`
> source_sha256: `4e8029cce4c1387d731012a2be80eb28e1290da6eae2fb1f9f43405a73c81f89`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# Getting Started

1. 在 [RELEASE_INDEX.md](../RELEASE_INDEX.md) 找到 `ACTIVE` bundle。
2. 依使用情境選擇 variant：`solo_eval` / `team_project` / `enterprise_site`。
3. 先閱讀該 variant 旁的 `README.md` 與 `deployment/docs/*`。
4. 執行 `scripts/verify_release_bundle.sh <bundle_id>`。
5. 再進行解壓、安裝、preflight、smoke。

