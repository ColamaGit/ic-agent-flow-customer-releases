# Release and IP Boundary Summary

## Release Truth Model

- Payload 真值：`releases/runtime-bundle-tw-*`
- 版本指標：`releases/version-pointers/*.json`（含 `LATEST.json`）
- 對客入口：`README.md` + `RELEASE_INDEX.md` + `docs/` + `activation-packs/`

## Not Included in Customer Release

- `workspace/` internal governance truth
- internal tests / QA goldens / internal closeout reasoning
- prompt/context strategy
- secret values (`.env`, API keys)

## Support Export Boundary

- support bundle 必須 dual-redaction（customer IP + vendor IP）
- 禁止輸出 source tree 與 internal-only artifacts

## Verification Command

- `scripts/verify_release_bundle.sh <bundle_id>`
