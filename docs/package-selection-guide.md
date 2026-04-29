# Package Selection Guide

- `solo_eval`: 單機評估，非 production。
- `team_project`: 團隊協作，含 RBAC baseline。
- `enterprise_site`: 組織級治理，含審批與稽核要求。

規則：不得用 `solo_eval` 成功外推 `enterprise_site` readiness。
