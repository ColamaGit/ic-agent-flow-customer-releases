# OpenAI Secret Setup（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `releases/runtime-bundle-tw-20260429100301/enterprise_site/deployment/docs/OPENAI_SECRET_SETUP.md`
> source_sha256: `881b09c8e40b9c9625cc0e5d9a4aef263e57da1af7c493a03f6c56f87433b121`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# OpenAI Secret Setup

## Required Variables

- `OPENAI_API_KEY`

Optional:

- `OPENAI_MODEL`

## Session-Scoped Setup

```bash
export OPENAI_API_KEY="<your-key>"
export OPENAI_MODEL="gpt-5.4"
```

## `.env` File Setup (Package Root)

```bash
set -a
source .env
set +a
```

## Secret Safety Rules

- Do not commit `.env`.
- Do not place key values in config files tracked by git.
- Do not emit key values into logs/reports/support bundles.

