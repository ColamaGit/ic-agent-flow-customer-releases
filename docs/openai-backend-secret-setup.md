# OpenAI / Backend Secret Setup

1. 在 customer site 設定 secret（不寫入 repo）。
2. 僅提供 secret reference 給 runtime。
3. 驗證 log/support bundle 不含 secret value。
4. `airgap_local` profile 禁止 remote backend routing。
