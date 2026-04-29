# Activation Flow Summary

## Baseline Flow

1. 選擇 bundle 與 variant（依 `RELEASE_INDEX.md` + pointers）
2. 驗證 package 完整性（manifest/checksum/gate）
3. 綁定 EDA toolchain 與 backend secret
4. 執行 preflight
5. 執行 smoke scenario
6. 產生 activation decision（PASS / PASS_WITH_WARNINGS / BLOCKED）

## Required References

- `docs/extract-and-install.md`
- `docs/eda-toolchain-binding-guide.md`
- `docs/openai-backend-secret-setup.md`
- `activation-packs/<variant>/*`

## Fail-Closed Principle

- 若完整性驗證、preflight、或 claim/evidence 對位失敗，必須 `BLOCKED`，不得繼續宣稱 ready。
