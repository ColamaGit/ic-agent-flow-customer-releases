# i18n Policy (EN / zh-TW)（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `docs/i18n-policy.md`
> source_sha256: `88dc7d9e116e9685b55bb8f826798f2fd794293acc8e80ce79031653fb1fdaed`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# i18n Policy (EN / zh-TW)

## Scope

本 repo 所有 `*.md` 對客文件都必須支援 EN / zh-TW。

## File Naming

- 英文：`xxx.md`
- 繁中：`xxx.zh-TW.md`

## Canonical Rule

- 預設 canonical 仍可先以 EN 維持。
- zh-TW 可先以 fallback 形式提供，再逐步升級為完整對譯。

## Quality Levels

- `fallback_ready`: 有繁中導覽與原文連結。
- `fully_translated`: 完整繁中內容可獨立閱讀。

## Operational Rule

1. 新增任何 `*.md` 時，同步新增 `*.zh-TW.md`。
2. 發版前檢查 EN / zh-TW 是否成對存在。
3. 若內容不一致，需在 release note 標示並追蹤修正。

