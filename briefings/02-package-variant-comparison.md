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
