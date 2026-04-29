# Customer Activation Flow（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `docs/customer-activation-flow.md`
> source_sha256: `48e7af0ed821d2b4fa52bf4e1e4b0cb3c8fa9643ccef1e222e440ab21abe700e`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# Customer Activation Flow

1. 選擇 variant 與 bundle。
2. 完成 checksum/manifest 驗證。
3. 完成 EDA toolchain binding 與 backend secret binding。
4. 執行 preflight。
5. 執行 smoke scenario。
6. 產生 activation decision（PASS / PASS_WITH_WARNINGS / BLOCKED）。

