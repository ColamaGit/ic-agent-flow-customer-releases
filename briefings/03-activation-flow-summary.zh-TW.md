# Activation Flow Summary（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `briefings/03-activation-flow-summary.md`
> source_sha256: `c31a023f32460d54cc3d6e542d5f0dbfa447d1ac2e3ffcf817cfe1e7e0c410ec`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

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

