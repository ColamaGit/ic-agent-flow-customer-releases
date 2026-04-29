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
