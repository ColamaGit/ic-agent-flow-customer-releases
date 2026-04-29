# Extract and Install

1. 驗證 bundle：`scripts/verify_release_bundle.sh <bundle_id>`。
2. 進入 variant 目錄，確認 `.tar.gz`、`*.manifest.json`、`*.checksums.json`。
3. 解壓 package 到 customer working directory。
4. 依 package 內 `deployment/docs/EXTRACT_AND_INSTALL.md` 執行安裝流程。
5. 完成後執行 preflight 與 smoke scenario。
