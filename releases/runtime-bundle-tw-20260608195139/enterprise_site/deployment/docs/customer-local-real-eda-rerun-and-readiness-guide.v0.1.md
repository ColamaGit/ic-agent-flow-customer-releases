# Customer-Local Real EDA Rerun & Readiness Guide v0.1

> Exported customer copy.  
> Canonical source: `workspace/docs/deployment/customer-local-real-eda-rerun-and-readiness-guide.v0.1.md`

## Document Authority & Delivery Channel

- Authority class: `derived operational guide`
- Delivery mode: exported customer copy
- Canonical upstream refs:
  - `workspace/docs/prd/PRD v0.9 Addendum — Manifest Integrity & Subject Binding Baseline.md`
  - `workspace/docs/governance/current-status-review-real-eda-pipeline-v0.1.md`
  - `workspace/docs/governance/calibration-analysis-readiness-report-v0.2.md`
  - latest governed `readiness_report.v0.2.md` artifacts

This document is not signoff authority and does not replace canonical governance truth.

## Non-Goals / Not Signoff Truth

This guide is for rerun and readiness interpretation.

It is not signoff authority.
It is not the final tapeout release basis.
It is not the human decision record.

## What This Package Can Do Now

- `V1` Verilator lint
- `V2` bounded Verilator simulation
- `H1` Yosys synthesis
- `H2` OpenROAD execution
- `H4` KLayout bounded DRC / realized GDS
- `H3` Netgen LVS

Current reference readiness class:

- all three reference chips are `🟡 CONDITIONALLY READY for digital-only tapeout`

Bounded smoke simulation markers:

- `SN2025_SIM_PASS`
- `UART_SIM_PASS`
- `ASYNC_FIFO_SIM_PASS`

## How to Rerun Locally

Customer exported rerun entrypoint:

```bash
./.venv/bin/python deployment/installers/run_customer_local_readiness.py \
  --deployment-profile customer-vpc \
  --chip-id test-chip-02 \
  --task-id T-SN2025-01 \
  --rtl-src templates/baseline-digital-soc/rtl \
  --chip-name SN2025 \
  --rtl-function "Digital Controller"
```

The wrapper returns JSON with:

- `run_dir`
- `readiness_report`
- `readiness_manifest`

Release-bound governed rerun entrypoint:

```bash
./.venv/bin/python deployment/installers/run_governed_readiness_entry.py '<json-payload>'
```

Release-bound runtime substrate:

```text
deployment/runtime/governance_pipeline_runner.py
```

Canonical internal governed source:

```bash
./.venv/bin/python workspace/shared-runtime/scripts/governance_pipeline_runner.py
```

Outputs are written under:

```text
artifacts/production-runs/<chip_id>/<task_id>/<timestamp>/
```

Current release-bound packaging status:

- the wrapper now prefers a release-bound entrypoint from the active deployment profile
- `run_governed_readiness_entry.py` resolves `deployment/runtime/governance_pipeline_runner.py` before any internal source-tree compatibility path
- first-wave packaged acceptance without `workspace/...` has now been demonstrated for all three reference chips

## Current Truth Snapshot

Snapshot basis: reference reruns as of `2026-04-18`

- `test-chip-02` → `20260418-011359`
- `uart-controller-v0.1` → `20260418-011512`
- `async-fifo-v0.1` → `20260418-011603`
- packaged acceptance (`test-chip-02`, no `workspace/...`) → `20260418-061831`
- packaged acceptance (`uart-controller-v0.1`, no `workspace/...`) → `20260418-111918`
- packaged acceptance (`async-fifo-v0.1`, no `workspace/...`) → `20260418-111918`

## How to Read Readiness / Evidence / Report

- `9/9 gates passed` = the report is structurally valid
- `CONDITIONALLY READY` = red blocker rows are cleared for the current bounded baseline
- `RTL simulation = PASS` = bounded smoke simulation passed
- it is a governed report-validity condition, not a silicon-quality claim

Do not read bounded smoke PASS as full functional signoff.

## Execution Environment Provenance

Customer-local reruns must treat execution environment provenance as first-class evidence:

1. Use the declared deployment profile for the exported package.
2. If the wrapper reports an unresolved provenance / environment invalid condition, do not guess through source-code tracing; fix the environment binding first.
3. The exported package should contain enough filing surfaces for a local agent to decide rerun vs review vs escalation without opening the development repo.
4. When a package is moved outside the development repository, the operator should rely on the package note, run-structure explanation, readiness reports, and provenance manifests rather than source-code traceability.

## Package Filing Surface

The customer-local package must make the following easy to find:

- what the package claims
- what the package does not claim
- which readiness report family is authoritative
- where the run-structure explanation lives
- which deployment profile and toolchain were used
- what to do when a stage is blocked or skipped

If these filing surfaces are missing, the correct action is to repair the package export contract, not to infer the missing meaning from the development repo.

## Escalation Matrix

| Situation | Owner | Rule |
| --- | --- | --- |
| shell / PATH fix | customer operator | may self-fix and rerun |
| local install / collateral placement | customer setup engineer | may repair local environment |
| repeated runtime failure with valid setup | maintainer | must intervene |
| evidence / subject mismatch | fail-closed | stop and escalate immediately |

## Version Trigger

This exported copy must be refreshed when:

- rerun entrypoint changes
- readiness interpretation semantics change
- delivery mode or authority wording changes

If there is any conflict, the canonical workspace source governs.
