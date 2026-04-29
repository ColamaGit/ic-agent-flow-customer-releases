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
