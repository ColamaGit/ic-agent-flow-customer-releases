# Whitepaper: IC Agent Flow — The Hardened Governance Baseline

version: v1.6.1

> Status addendum (2026-04-29):
> - PRD v1.0 boundary-first rollout is implementation-complete and closeout-ready on `main`.
> - PRD v1.2 ecosystem boundary/propagation line is implementation-complete with residual gaps (`31 passed`).
> - Route B capability-extension line is closed at B5 with decision `COMPLETE_WITH_RESIDUAL_GAPS`.
> - Route A OpenAI graph-builder integration is now `FULL_IMPL` (workflow productization completed with live E2E evidence).
> - Current real EDA backbone includes `V1/V2/V3/V4/H1/H2/H4/H3` with artifact-backed evidence.
> - Latest formal rerun anchors (with `V3/V4` present): `test-chip-02` → `20260422-152501` (`T-SN2025-V10-CLOSEOUT-R2`), `uart-controller-v0.1` → `20260422-152524` (`T-UART-V10-CLOSEOUT-R2`).
> - Narrative baseline should be treated as `v0.x runtime execution line + v1.0 + v1.1 + v1.2 governance lines` N-track system view.
> - Post-v1.6 hardening line is active: `Customer Package Variant & Safe Activation Pack` is now the cross-cutting release track for PRD v1.5/v1.6.
> - Three customer variants (`solo_eval`, `team_project`, `enterprise_site`) are release-separated in customer release staging, with explicit claim-boundary semantics and non-cross-mode readiness claims.
> - Customer release distribution is normalized to UTC+8 bundle identity (`runtime-bundle-tw-YYYYMMDDHHMMSS`) and one-copy staging export under `artifacts/customer-release-staging/`.
> - Customer-facing runtime contract and docs-pack gates are operationalized (README/docs before extraction, manifest/checksum pointers, release index pointers).
> - Production run outputs now include an auto-generated run explainer (`RUN_STRUCTURE_EXPLAINED.md`) to bind PRD v1.0 → v0.9 → v1.3 artifact interpretation for human/AI operators.
> - Current risk note: enterprise variant still requires continuous full-flow parity validation evidence at package-extract path for all declared chips before any `100% closeout` claim.

## Executive Summary
This whitepaper articulates the technological breakthrough of the **IC Agent Flow OS** in the field of agentic IC design. It details the transition from "Architectural Vision" to a "Hardened, Machine-Verifiable Governance Reality."

## 1. The Challenge: The Trust Deficit in AI-Centric Design
- The ambiguity of autonomous agent actions in hardware verification.
- The risk of "Quiet Drift" in local design databases.
- The lack of human-interpretable truth chains.

## 2. The Solution: Constitution-First Evidence Sovereignty
- **Physical Evidence Restoration**: Moving from dialogue-cached artifacts to repository-resident audit bundles.
- **The IC-Agent-Flow Substrate**: An operating system that treats AI agents as regulated entities.

## 3. Technology Deep Dive: The 6-Layer Integrity Manifest
- Layer 1: Replay Case & Environment Identity.
- Layer 2: MCP Canonical Truth (Physical EDA Artifacts).
- Layer 3: Skill Interpreted Advisory (The Interpretation Layer).
- Layer 4: Human-in-the-Loop Decision Chain.
- Layer 5: Evidence Re-entry & Resubmission History.
- Layer 6: Hardened Evidence (Negative Proofs & MAC Records).

## 4. Security Philosophy: Fail-Closed Design Laws
- **Integrity Records**: HMAC-SHA256 based at-rest protection.
- **Negative Proofs**: Machine-verifiable records that security guards correctly intercepted unauthorized escalation attempts.
- **Authority Classes**: Strict segregation of Advisory vs. Decision-bearing roles.

## 5. Deployment Roadmap: Phase 5A and Beyond
- **Phase 5A (Current)**: Controlled production deployment with hardened gate verification and package-variant release hardening.
- **Phase 5B (Target)**: Scale-out with multi-chip portfolio aggregation and customer-repo synchronized release cadence.

---
**Authors**: IC Agent Flow Strategy Team  
**Version**: v1.1 Outline (Hardened Baseline + Package Variant Hardening Addendum)
