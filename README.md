# ic-agent-flow Customer Releases

這是 customer-facing release registry，不是開發 source repo。

## Quick Start

1. 先看 [RELEASE_INDEX.md](./RELEASE_INDEX.md) 找到目前有效 bundle。
2. 依 variant 選擇 package：`solo_eval` / `team_project` / `enterprise_site`。
3. 先讀 package 旁的 `README.md` 與 `deployment/docs/*`，再解壓安裝。
4. 執行 `scripts/verify_release_bundle.sh <bundle_id>` 驗證 release 完整性。

## Release Truth

- payload root: `releases/runtime-bundle-tw-*`
- semantic pointers: `releases/version-pointers/*.json`
- latest pointer: `releases/version-pointers/LATEST.json` (to be maintained)
