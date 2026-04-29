# Security and Secrets

- secrets 不得進 package artifact。
- `.env` / key 不得進 support bundle。
- production 建議使用 secret manager（Vault/KMS/K8s Secret）。
- log/support export 須 redaction。
