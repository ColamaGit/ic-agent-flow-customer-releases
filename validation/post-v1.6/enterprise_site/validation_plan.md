# Enterprise Site Validation Plan — v1.6.0

**variant**: `enterprise_site`
**semantic_version**: `v1.6.0`
**as_of**: `2026-04-29 (UTC+8)`

## Purpose

This document defines the validation plan a customer must complete to declare `enterprise_site` production-ready at their site.

This plan covers the steps from package receipt to site activation decision.

---

## Phase 1 — Package Verification

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1.1 | Run `scripts/verify_release_bundle.sh runtime-bundle-tw-20260429140332` | `[PASS]` |
| 1.2 | Confirm all three variant tar.gz files are present | All present |
| 1.3 | Confirm checksums match manifest | Match |
| 1.4 | Confirm no denylist content (workspace/tests/.env) | Clean |

---

## Phase 2 — Environment Qualification

| Step | Action | Expected Result |
|------|--------|-----------------|
| 2.1 | Verify OS and Python version against runtime prerequisites | Compatible |
| 2.2 | Verify EDA tool paths and versions (Verilator, Yosys, OpenROAD, KLayout, Netgen, etc.) | All found and version-compatible |
| 2.3 | Verify network isolation and airgap requirements if applicable | Policy compliant |
| 2.4 | Verify secret manager connectivity (Vault or K8s) | Reachable |

---

## Phase 3 — Configuration

| Step | Action | Expected Result |
|------|--------|-----------------|
| 3.1 | Bind EDA toolchain using `profiles/enterprise_site/eda_toolchain.template.yaml` | Binding record created |
| 3.2 | Configure secret binding (Vault or K8s template) | Secret references verified |
| 3.3 | Configure RBAC roles and approval quorum members | Roles assigned |
| 3.4 | Apply site policy overlay if required | Policy applied |

---

## Phase 4 — Activation Checklist

Complete all items in `activation-packs/enterprise_site/preflight_checklist.md`.

Expected outcome: `preflight: PASS` or `preflight: PASS_WITH_WARNINGS`

---

## Phase 5 — Smoke Run

Complete the smoke scenario in `activation-packs/enterprise_site/smoke_scenario.md`.

Expected outcome: all scenario steps complete without RED gate verdicts.

---

## Phase 6 — Audit Readiness

Complete `activation-packs/enterprise_site/audit_readiness_checklist.md`.

Expected outcome: all audit readiness items confirmed.

---

## Phase 7 — Activation Decision

Human authority reviews all Phase 1–6 results and records the activation decision.

---

## Notes

- This validation plan applies to v1.6.0. For v1.17.0, see `validation/post-v1.17/enterprise_site/`.
- Upgrade to v1.17.0 is recommended to gain Silicon Feedback, Console Bootstrap Gate, and Package Build Registry.
