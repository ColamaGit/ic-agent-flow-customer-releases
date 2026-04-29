# Support Export（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `releases/runtime-bundle-tw-20260429100301/solo_eval/deployment/docs/SUPPORT_EXPORT.md`
> source_sha256: `c215e6fba6e20af08d229c2bdd9195ca807c98267e533f133049a1ee9cbd63fc`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# Support Export

Support bundle export must stay bounded and redacted.

## Minimum Rules

- include only incident-scoped artifacts
- exclude secrets (`.env`, key values)
- exclude internal-only source/governance assets
- keep export reason and time window

## Checkpoints

1. Confirm export scope is explicit.
2. Confirm redaction policy is attached.
3. Confirm denylist exclusions are enforced.
4. Confirm audit record is emitted.

