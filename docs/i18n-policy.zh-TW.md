# 多語系政策（EN / zh-TW）

[EN](./i18n-policy.md) | [zh-TW](./i18n-policy.zh-TW.md)

## 適用範圍
所有面向客戶的 `*.md` 檔案必須同時支援 EN 與 zh-TW。

## 命名規則
- 英文版：`xxx.md`
- zh-TW 版：`xxx.zh-TW.md`

## 基本規則
- 英文版可作為初始正式版本。
- zh-TW 版可先作為後備版本，之後升級為完整翻譯。

## 品質等級
- `fallback_ready`：zh-TW 導覽頁面 + 連結至英文版
- `fully_translated`：完整獨立的 zh-TW 內容

## 操作規則
1. 每新增 `*.md` 時同步新增對應的 `*.zh-TW.md`。
2. 發布前檢查 EN/zh-TW 配對完整性。
3. 在發布說明中追蹤並修正 EN/zh-TW 內容漂移。
