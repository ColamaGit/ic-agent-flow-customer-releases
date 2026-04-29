# Package Variant Comparison（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `briefings/02-package-variant-comparison.md`
> source_sha256: `991c4eccb644a94cd4f553944d33a5ca11b38aa5608a61050fdc0190994e7399`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# Package Variant Comparison

| Variant | Target User | Scope | Governance |
|---|---|---|---|
| `solo_eval` | 單機評估者 | 最小可跑基線 | non-production |
| `team_project` | 小型團隊 | 多角色協作 + RBAC baseline | team-governed |
| `enterprise_site` | 組織級部署 | 審批/稽核/配額治理 | enterprise-governed |

## Important Rule

- `solo_eval` 成功不得外推 `team_project`/`enterprise_site` readiness。
- 三個 variant 雖共享部分 runtime substrate，但 claim boundary 與治理條件不同。

## Where to verify

- `releases/runtime-bundle-tw-*/<variant>/README.md`
- `releases/runtime-bundle-tw-*/<variant>/*.manifest.json`
- `releases/runtime-bundle-tw-*/customer_release_staging_manifest.json`

