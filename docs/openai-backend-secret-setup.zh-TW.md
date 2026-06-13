# OpenAI / 後端機密資料設定

[EN](./openai-backend-secret-setup.md) | [zh-TW](./openai-backend-secret-setup.zh-TW.md)

1. 機密資料僅在客戶站點上設定。
2. 向執行期提供機密資料參照，而非機密資料值本身。
3. 確認 log 與支援 bundle 不包含機密資料值。
4. `airgap_local` 設定檔不得啟用遠端後端路由。
