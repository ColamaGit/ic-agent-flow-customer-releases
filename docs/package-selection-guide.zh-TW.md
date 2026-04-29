# Package Selection Guide（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `docs/package-selection-guide.md`
> source_sha256: `4f47d81ca899c373dfe9462050d21831c5ed02f751ffc6aef3e31d784abe5acc`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# Package Selection Guide

- `solo_eval`: 單機評估，非 production。
- `team_project`: 團隊協作，含 RBAC baseline。
- `enterprise_site`: 組織級治理，含審批與稽核要求。

規則：不得用 `solo_eval` 成功外推 `enterprise_site` readiness。

