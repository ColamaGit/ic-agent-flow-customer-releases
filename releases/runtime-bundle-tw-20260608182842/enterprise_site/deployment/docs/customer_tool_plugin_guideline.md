# Customer Tool Plug-in / Plug-out Guideline (AI + Human)

## 1. Purpose

Provide a governed, repeatable procedure for customer-local EDA tool plug-in / plug-out.

This guideline is for:
- Human operator
- AI operator/agent

## 2. Success Criteria (Strict)

This SOP is considered complete only if all checks below pass:

1. Real plugin-on run exists for all 3 chips.
2. Real plugin-off run exists for all 3 chips.
3. Validation report `plugin_flow_3chips_validation.json` has:
   - `"overall_verdict": "PASS"`
4. In plugin-on runs, stage order proves insertion before `h4_klayout`.
5. In plugin-off runs, plugin stage is absent and `h4_klayout` index is restored.

## 3. Non-Negotiable Rules

1. Do not replace `MANDATORY_GOVERNANCE_NODE`.
2. Plug-in/plug-out must preserve artifacts run-folder order consistency.
3. No silent fallback: replacement preflight fail means `BLOCKED_REPLACEMENT`.
4. No proof, no claim: replacement output without required evidence is not claim-eligible.

## 4. Target Insertion Example (Canonical)

Insertion target:
- before logical node `h4_klayout`

Expected folder order impact:
- plug-in on: `10_new_plugin_eda`, original `10_h4_klayout` becomes `11_h4_klayout`
- plug-in off: plugin folder removed, `h4_klayout` returns to `10_h4_klayout`

## 5. Runtime Controls

Environment variables:
- `ICAF_V116_PLUGIN_ENABLE=1|0`
- `ICAF_V116_PLUGIN_STAGE=<stage_slug>` (example: `new_plugin_eda`)
- `ICAF_V116_PLUGIN_INSERT_BEFORE=<logical_stage>` (example: `h4_klayout`)
- `ICAF_V116_DISABLE_STAGES=<comma-separated logical stages>` (optional)

## 6. Preflight (Must Pass Before Any Run)

```bash
./.venv/bin/python runtime/scripts/validate_schemas.py
```

If this fails, stop and fix before continuing.

## 7. Execution Procedure (3 Chips, Real Runs)

Preferred one-command workflow:

```bash
bash runtime/scripts/customer_tool_plugin/run_plugin_on_off_3chips.sh
```

Manual equivalent steps are below.

### Step A — Plug-in ON (real execution)

```bash
ICAF_DEPLOYMENT_PROFILE=airgap-local \
ICAF_V116_PLUGIN_ENABLE=1 \
ICAF_V116_PLUGIN_STAGE=new_plugin_eda \
ICAF_V116_PLUGIN_INSERT_BEFORE=h4_klayout \
./.venv/bin/python runtime/scripts/governance_pipeline_runner.py
```

### Step B — Plug-in OFF (real execution)

```bash
ICAF_DEPLOYMENT_PROFILE=airgap-local \
ICAF_V116_PLUGIN_ENABLE=0 \
./.venv/bin/python runtime/scripts/governance_pipeline_runner.py
```

### Step C — Validate real on/off runs

```bash
python3 runtime/scripts/customer_tool_plugin/validate_plugin_flow_3chips.py
```

Expected:
- overall verdict = `PASS`
- on-run has `new_plugin_eda` before `h4_klayout`
- off-run has no `new_plugin_eda`, and `h4_klayout` index restored

## 8. Evidence Outputs (Required)

Required verification artifacts:
- `artifacts/customer-plugin-validation/plugin_flow_3chips_validation.md`
- `artifacts/customer-plugin-validation/plugin_flow_3chips_validation.json`

Related closeout index:
- `deployment/docs/customer_tool_plugin_playbook.json`

## 9. AI Operator Execution Contract

AI must follow this exact behavior:

1. Run Step A and Step B as separate fresh executions.
2. Do not claim success from simulated reorder only.
3. Do not skip validation script.
4. Final response must include:
   - plugin-on run ids (3 chips)
   - plugin-off run ids (3 chips)
   - validation report paths (`md` and `json`)
   - validation verdict

If any step fails:
- stop
- show exact failing command
- show blocker reason
- do not claim partial success as complete

## 10. Human Operator Checklist

- [ ] plugin-on run completed for all target chips
- [ ] plugin-off run completed for all target chips
- [ ] validation script returns `PASS`
- [ ] report `md + json` generated
- [ ] no mandatory governance node replacement attempted
- [ ] no blocked claim overreach introduced

## 11. Troubleshooting

1. `flow_report_index_fail_closed` after plugin-on:
- confirm report path resolver is dynamic (`*_reports`), not fixed `22_reports`.

2. Validation says plugin missing in ON run:
- confirm env vars were set exactly:
  - `ICAF_V116_PLUGIN_ENABLE=1`
  - `ICAF_V116_PLUGIN_STAGE=new_plugin_eda`
  - `ICAF_V116_PLUGIN_INSERT_BEFORE=h4_klayout`

3. Validation says plugin still present in OFF run:
- confirm OFF run used:
  - `ICAF_V116_PLUGIN_ENABLE=0`
- rerun OFF step and validate again.
