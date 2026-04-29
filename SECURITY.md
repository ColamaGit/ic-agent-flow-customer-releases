# Security

## Boundaries

- 此 repo 僅交付 customer-facing release payload。
- 不得包含：`workspace/`、`tests/`、`.env`、internal PRD/closeout、prompt/context strategy。

## Verification

- 先驗證 checksums/manifests。
- 建議執行：`scripts/verify_release_bundle.sh <bundle_id>`。
