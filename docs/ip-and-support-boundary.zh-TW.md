# IP 與支援邊界

[EN](./ip-and-support-boundary.md) | [zh-TW](./ip-and-support-boundary.zh-TW.md)

- 客戶套件僅暴露操作介面，不暴露內部開發真值。
- 支援匯出必須同時保護客戶 IP 與供應商 IP。
- 禁止包含：`workspace/`、`tests/`、`.env`、內部 PRD/結案分析、prompt/context 內部資訊。
