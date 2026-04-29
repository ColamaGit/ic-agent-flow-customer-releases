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
