# 發布索引

[EN](./RELEASE_INDEX.md) | [zh-TW](./RELEASE_INDEX.zh-TW.md)

客戶端發布版查詢表。所有 `bundle_id` 時間戳記均使用 `Asia/Taipei（UTC+8）`。

> **使用說明：** 找到狀態為「生效中」的列，記下 `bundle_id`，然後前往 `artifact_uri` 路徑取得發布套件檔案。

---

## 發布版一覽表

| 版本 | Bundle ID | 發布日期（UTC+8） | 套件類型 | 產出物路徑 | Checksum | 清單 | 更新日誌 | 狀態 |
|------|-----------|-----------------|---------|-----------|----------|------|---------|------|
| **v1.17.0** | `runtime-bundle-tw-20260529043609` | 2026-05-30 | solo_eval / team_project / enterprise_site | `releases/runtime-bundle-tw-20260529043609/` | `releases/runtime-bundle-tw-20260529043609/*.checksums.json` | `releases/runtime-bundle-tw-20260529043609/publish_manifest.json` | [CHANGELOG.zh-TW.md](./releases/CHANGELOG.zh-TW.md) | ✅ **生效中** |
| v1.6.0 | `runtime-bundle-tw-20260429140332` | 2026-04-29 | solo_eval / team_project / enterprise_site | `releases/runtime-bundle-tw-20260429140332/` | `releases/runtime-bundle-tw-20260429140332/*/*.checksums.json` | `releases/runtime-bundle-tw-20260429140332/customer_release_staging_manifest.json` | [CHANGELOG.zh-TW.md](./releases/CHANGELOG.zh-TW.md) | 歷史版本 |

---

## 版本指標對應

| 指標檔案 | 指向 |
|---------|------|
| `releases/version-pointers/LATEST.json` | 目前生效 bundle（機器可讀入口） |
| `releases/version-pointers/v1.17.0.json` | `runtime-bundle-tw-20260529043609` |
| `releases/version-pointers/v1.6.0.json` | `runtime-bundle-tw-20260429140332` |

**單份 payload 根目錄：**
- 最新版：`releases/runtime-bundle-tw-20260529043609/`
- 歷史版：`releases/runtime-bundle-tw-20260429140332/`

---

## 使用發布版之前

1. 確認上表中狀態為「生效中」的發布版
2. 驗證套件完整性：`scripts/verify_release_bundle.sh <bundle_id>`
3. 解壓縮前先閱讀 bundle 內的套件類型 README
4. 請見 [PACKAGE_VARIANTS.zh-TW.md](./PACKAGE_VARIANTS.zh-TW.md) 選擇適合的套件類型

---

## v1.17.0 更新重點

完整更新日誌請見 [releases/CHANGELOG.zh-TW.md](./releases/CHANGELOG.zh-TW.md)。

v1.17.0 主要新增：
- 矽晶回饋修復面板
- 主控台啟動關卡
- 套件建置登記表，含歷史保護
- 機器可讀建置索引與發布追蹤
