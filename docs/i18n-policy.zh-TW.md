# i18n Policy（繁體中文）

## 範圍

本 repo 所有對客 `*.md` 文件必須支援 EN / zh-TW。

## 命名規則

- 英文：`xxx.md`
- 繁中：`xxx.zh-TW.md`

## Canonical 規則

- 初期可維持 EN 為 canonical。
- zh-TW 允許先以 fallback 導覽版上線，再逐步升級完整對譯。

## 品質等級

- `fallback_ready`：有繁中導覽與原文連結。
- `fully_translated`：可獨立閱讀的完整繁中內容。

## 維運規則

1. 新增任一 `*.md` 時，需同步新增 `*.zh-TW.md`。
2. 發版前需檢查 EN/zh-TW 成對存在。
3. 若內容不一致，以 release note 記錄並追蹤修正。
