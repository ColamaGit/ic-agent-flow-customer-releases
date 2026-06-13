# 發布與 IP 邊界摘要

[EN](./04-release-and-ip-boundary-summary.md) | [zh-TW](./04-release-and-ip-boundary-summary.zh-TW.md)

## 發布真值模型

- Payload 真值：`releases/runtime-bundle-tw-*`
- 版本指標：`releases/version-pointers/*.json`
- 客戶入口：`README.zh-TW.md`、`RELEASE_INDEX.zh-TW.md`、`docs/`、`activation-packs/`

## 客戶發布版不包含的內容

- `workspace/` 內部治理真值
- 內部測試/結案分析
- prompt/context 內部資訊
- 機密資料值

## 驗證

執行 `scripts/verify_release_bundle.sh <bundle_id>`。
