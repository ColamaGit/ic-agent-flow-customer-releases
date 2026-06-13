# 解壓縮與安裝

[EN](./extract-and-install.md) | [zh-TW](./extract-and-install.zh-TW.md)

1. 驗證 bundle 完整性：`scripts/verify_release_bundle.sh <bundle_id>`。
2. 檢查套件類型的產出物（`.tar.gz`、清單、checksum）。
3. 將套件解壓縮至客戶工作目錄。
4. 依照套件內的 `deployment/docs/EXTRACT_AND_INSTALL.md` 操作。
5. 執行預飛測試與冒煙情境。
