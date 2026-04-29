# Troubleshooting（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `releases/runtime-bundle-tw-20260429140332/team_project/deployment/docs/TROUBLESHOOTING.md`
> source_sha256: `c78bc73a0168572071f9dc69793849e46059adcfcff05aa8d0996487b930a378`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# Troubleshooting

## Common Failures

1. `rtl source not found`
   - check `--rtl-src` path
   - ensure `templates/` exists at package root

2. EDA tool not found
   - set tool overrides via `--override key=value`
   - verify executable path and permissions

3. OpenAI route blocked
   - verify `OPENAI_API_KEY` is set in current shell
   - verify network policy allows backend route for selected profile

4. readiness artifacts missing
   - verify run command exit code
   - inspect `artifacts/production-runs/<chip>/<task>/<timestamp>/`

## Escalation Rule

If failure persists after path/env verification, capture command + stderr + run directory and escalate with bounded support bundle.

