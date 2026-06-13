# Enterprise Site Readiness Boundary Note — v1.6.0

**variant**: `enterprise_site`
**semantic_version**: `v1.6.0`
**as_of**: `2026-04-29 (UTC+8)`

## Boundary Statement

The `enterprise_site` variant in v1.6.0 provides the **governance framework and deployment infrastructure** for organization-scale ICAF deployment, but **production certification requires site-specific validation**.

This note defines the boundary between what is delivered and what requires customer-side validation before production use.

---

## What Is Delivered (v1.6.0)

✅ Full governed EDA execution chain (V1–V4, H1–H3, H5, H9, H10, H6, H7, H8)
✅ Enterprise RBAC baseline with role separation
✅ Approval quorum framework
✅ Full audit trail and authority-bound sign-off chain
✅ IP-protected package (source exclusion report, vendor IP leak scan PASS)
✅ Kubernetes and Vault secret binding templates
✅ Site policy overlay templates
✅ Operator console (multi-user, enterprise profile)
✅ Package integrity chain (checksums, manifest, publish audit record)

---

## What Requires Customer-Side Validation Before Production Use

⚠️ **Site qualification** — customer must validate their specific environment (OS, EDA toolchain, network, secrets manager) against the runtime prerequisites.

⚠️ **EDA toolchain binding** — customer must bind their specific tool versions and paths. The runtime provides templates; actual binding is customer-site responsibility.

⚠️ **Secret management integration** — Vault or K8s secret binding must be configured and verified in the customer's environment.

⚠️ **RBAC role assignment** — customer must configure actual user roles and quorum members for their organization.

⚠️ **Preflight and smoke run** — customer must run and pass the activation checklist before declaring production readiness.

---

## Claim Boundary

| Claim | Status |
|-------|--------|
| Package integrity verified | ✅ ALLOWED |
| IP protection implemented | ✅ ALLOWED |
| EDA chain executed on reference chips | ✅ ALLOWED |
| Production readiness at customer site | ⚠️ Requires site validation |
| Enterprise certification | ⚠️ Requires customer activation completion |

---

## Path to Production

1. Complete site qualification (`activation-packs/enterprise_site/preflight_checklist.md`)
2. Configure and verify secret binding
3. Configure RBAC roles and quorum
4. Complete smoke run (`activation-packs/enterprise_site/smoke_scenario.md`)
5. Complete audit readiness checklist (`activation-packs/enterprise_site/audit_readiness_checklist.md`)
6. Declare site activation decision

---

## Notes

- v1.6.0 enterprise_site is superseded by v1.17.0. Upgrade to get Silicon Feedback panel, Console Bootstrap Gate, and Package Build Registry.
- See validation results in `validation/post-v1.17/enterprise_site/validation_summary.md` for the current active release.
