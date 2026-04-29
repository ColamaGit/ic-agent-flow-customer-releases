# Release and IP Boundary Summary（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `briefings/04-release-and-ip-boundary-summary.md`
> source_sha256: `86c0df1cabada8b8f1257c5516232d20aa674556d15c0b8ee4616d71ec1e4d09`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

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

