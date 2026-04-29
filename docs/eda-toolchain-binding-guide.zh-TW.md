# EDA Toolchain Binding Guide（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `docs/eda-toolchain-binding-guide.md`
> source_sha256: `eaed279d4f6691d0f4daddd0aa1e041b9778b25a9bdb5fec79bc03ea8911993d`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# EDA Toolchain Binding Guide

1. 準備 site-local `eda_toolchain` 設定檔。
2. 綁定可用工具路徑與版本命令。
3. 執行 preflight，結果需 `PASS` 或 `PASS_WITH_WARNINGS`。
4. 保存 binding record 供後續審計。

