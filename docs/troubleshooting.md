# Troubleshooting

- Gate fail：先檢查 `customer_release_staging_manifest.json` 與 variant manifests。
- Preflight fail：先確認 EDA tool paths/version。
- Secret fail：檢查 secret reference 是否可讀，且不在 repo 內。
- Claim mismatch：檢查 dual-run parity 報告（normalize 後再 diff）。
