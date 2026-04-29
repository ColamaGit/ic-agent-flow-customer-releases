# i18n Policy (EN / zh-TW)

## Scope
All customer-facing `*.md` files must support EN and zh-TW.

## Naming
- English: `xxx.md`
- zh-TW: `xxx.zh-TW.md`

## Canonical Rule
- EN may remain canonical initially.
- zh-TW can start as fallback and later be upgraded to full translation.

## Quality Levels
- `fallback_ready`: zh-TW guide + link to EN
- `fully_translated`: full standalone zh-TW content

## Operational Rule
1. Add `*.zh-TW.md` whenever adding `*.md`.
2. Check EN/zh-TW pair coverage before release.
3. Track and fix EN/zh-TW drift in release notes.
