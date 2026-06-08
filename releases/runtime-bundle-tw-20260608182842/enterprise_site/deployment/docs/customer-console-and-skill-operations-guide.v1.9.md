# Customer Console & Skill Operations Guide v1.9

## Purpose

This guide aligns PRD v1.7 / v1.8 / v1.9 and Post-v1.9 outcomes to customer-release package operations.

Scope:
- how to initialize and open console surfaces
- what prerequisites are required before console boot
- how to read v1.9 / post-v1.9 skill/routing evidence safely
- claim boundary and fail-closed interpretation for customer-side operation

---

## 1) Prerequisites Before Boot Console

Required:
- Python runtime and project virtualenv (`.venv`) available
- Node.js + npm available (for local dev console build/run checks)
- modern browser (Chrome/Edge/Safari/Firefox)
- package extract path prepared (customer package or working project)
- if `v3b_cdc_signoff_lite` is enabled:
  - `sby` command available on host
  - SMT solver (`z3` or equivalent) available

Recommended:
- keep `ICAF_DEPLOYMENT_PROFILE` explicit when running governed pipelines
- preserve generated artifacts under `artifacts/production-runs/` for audit replay

Do not:
- treat dashboard pages as canonical truth source
- bypass missing evidence with manual wording edits

---

## 2) Console Initialization Paths

### A. Working Project Mode (internal/dev/operator)

Use when operating from a source checkout or internal operator environment.

```bash
npm --prefix <console-root> install
npm --prefix <console-root> run dev
```

Intake/authority API note (important):
- `npm --prefix <console-root> run dev` starts frontend only.
- If you need `/intake` execution (`POST /api/intake`) or browser-native trust action (`POST /api/agent-trust/action`), run:

```bash
npm --prefix <console-root> run dev:with-intake
```

- `dev:with-intake` boots local intake API on `127.0.0.1:8787` and performs startup readiness precheck (`GET /api/intake/options` = 200).

Open:
- `http://localhost:5173/console?mode=solo_eval`
- `http://localhost:5173/console?mode=team_project`
- `http://localhost:5173/console?mode=enterprise_site`

### B. Release Package Extract Mode (customer-facing baseline)

Use package-extract-safe dashboard objects and relative artifact path policy.

Baseline expectation:
- dashboard surfaces are derived views
- package-extract resolver forbids repo-root fallback
- customer-visible paths remain relative/safe
- intake execution requires a valid runtime API endpoint (do not assume dev-local `127.0.0.1:8787` exists in customer site runtime)

---

## 3) Console Pages: What They Mean

- `Console Home`: mission-control summary, not release authority.
- `Flow Map / Run Detail / Node IO`: execution and evidence projection.
- `Artifacts`: evidence inventory browsing.
- `QA Trust`: trust posture and blocker context.
- `Decision Inbox / Package Readiness`: human authority and release gating surface.
- `Audit & Replay`: replay-oriented trail.
- `Style Guide`: UI semantics reference (logo/icons/badges/status lights), non-operational.

---

## 4) v1.9 Skill Usage: Customer-Side Interpretation Rules

PRD v1.9 baseline includes governed execution skills + decision-routing skills.

Customer-side must verify:
1. skill calls are recorded (invocation records exist)
2. routing decisions are recorded (decision record exists)
3. fallback is governed and not silent
4. policy/routing boundaries are not overclaimed as autonomous authority

Primary artifacts to inspect:
- `skill_invocation_record.<chip>.jsonl`
- `routing_decision_record.<chip>.jsonl`
- `fallback_execution_record` (when fallback triggered)
- `silicon_contract_evidence_binding.<chip>.json`

---

## 5) Post-v1.9 Real-Run Reading Model

For post-v1.9 3-chip validation, interpret verdict with explicit scope:

- Verdict: `PASS_WITH_WARNINGS`
- Scope: `Post-v1.9 3-chip governed closeout`
- Coverage: `G1~G9 readiness gates + governed real-run execution chain`
- Not Covered: `full signoff/tapeout authority automation`

Never shorten this to only `PASS_WITH_WARNINGS` without scope/coverage.

### v1.11 CDC Signoff-Lite Reading Rule

When run artifacts include `v3b_cdc_signoff_lite/normalized.cdc_signoff_lite.meta.json`:

1. always check `claim_class`:
   - must be `NON_SIGNOFF_CDC_LITE`
2. `status=PASS` means:
   - bounded open-source CDC-lite proof passed
   - not equivalent to commercial signoff CDC closure
3. `status=NOT_CHECKED` with note `sby binary not available` means environment-precondition missing, not proof pass.

---

## 6) Badge Semantics (Console Header)

If badges are shown, each item should include:
- `Verdict`
- `Scope`
- `Coverage`
- `Not Covered`

This avoids operator confusion between:
- local gate pass
- canonical approval state
- global release authority

---

## 7) Fail-Closed Customer Operations Checklist

Before declaring any customer-facing readiness statement:

1. verify run/profile context is explicit
2. verify evidence artifacts are present and traceable
3. verify no forbidden claims are present in summary text
4. verify unresolved/missing evidence leads to block/hold (not silent continue)
5. attach claim boundary in final communication

---

## 8) Claim Boundary (Customer Communication)

Allowed:
- governed execution baseline proven
- skill/routing traceability proven
- replay/audit trail exists

Forbidden:
- full autonomous signoff claim
- tapeout release authority automation claim
- enterprise production certification overclaim without dedicated certification evidence

---

## 9) Related References

- `deployment/docs/customer-package-operations-guide.v1.0.md`
- `deployment/docs/EXTRACT_AND_INSTALL.md`
- `deployment/docs/PROFILE_SELECTION_GUIDE.md`
- `deployment/docs/IP_AND_SUPPORT_BOUNDARY.md`
- `deployment/docs/EDA_TOOLCHAIN_BINDING.md`
- `deployment/docs/customer-local-real-eda-rerun-and-readiness-guide.v0.1.md`
