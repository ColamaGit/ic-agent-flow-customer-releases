# Package Variants

[EN](./PACKAGE_VARIANTS.md) | [zh-TW](./PACKAGE_VARIANTS.zh-TW.md)

ICAF ships in three package variants. Each variant is a distinct, independently packaged runtime — not the same package with a flag.
Choose the variant that matches your team size and governance requirements.

---

## `solo_eval` — Single-User Local Evaluation

**Who is it for?**
An individual engineer who wants to evaluate ICAF on their own machine before committing to a team or organization deployment.

**What's included?**
- Full governed EDA execution chain (V1–V4, H1–H5, H4, H3, H9, H10, H6, H7, H8)
- Operator console (single-user mode)
- Spec intake and architecture flow
- Readiness gate reporting
- Local deployment profile (`airgap-local`)

**Boundaries:**
- Non-production baseline — not for use in formal chip signoff
- Single-user only — no multi-user RBAC
- No enterprise approval quorum or audit trail requirements

**Typical use case:**
> "I want to run ICAF on my UART controller design locally and see a readiness report."

---

## `team_project` — Small Team Collaboration

**Who is it for?**
A small design or verification team working on a shared chip project together.

**What's included?**
- Everything in `solo_eval`
- Role-based access control (RBAC) baseline
- Multi-user collaboration surfaces
- Shared run evidence and team-level decision tracking
- Team-scoped deployment profile

**Boundaries:**
- Team-governed scope — suitable for internal project use
- Not intended for organization-wide deployment or formal tapeout signoff
- RBAC baseline only — not full enterprise approval quorum

**Typical use case:**
> "Our 5-person RTL team wants to share a governed ICAF instance and track who approved which readiness gate."

---

## `enterprise_site` — Organization-Scale Deployment

**Who is it for?**
A semiconductor company or organization deploying ICAF across multiple teams, projects, or sites.

**What's included?**
- Everything in `team_project`
- Enterprise governance: approval quorum, full audit trail, authority-bound sign-off chain
- Kubernetes-compatible secret binding templates
- HashiCorp Vault secret binding templates
- Site policy overlay (custom enforcement rules)
- Organization-level RBAC with role separation
- Silicon feedback loop integration
- Package Build Registry with history preservation
- Console Bootstrap Gate

**Boundaries:**
- Requires proper site qualification before production use
- Enterprise certification requires site-specific validation (see `validation/post-v1.17/enterprise_site/`)
- Not a self-serve install — follow deployment docs before extracting

**Typical use case:**
> "Our EDA team needs a governed, auditable chip design runtime across 3 projects with tapeout sign-off chains and silicon feedback tracking."

---

## Comparison Table

| Feature | `solo_eval` | `team_project` | `enterprise_site` |
|---------|:-----------:|:--------------:|:-----------------:|
| Full EDA chain (V/H stages) | ✅ | ✅ | ✅ |
| Operator console | ✅ | ✅ | ✅ |
| Spec intake & architecture flow | ✅ | ✅ | ✅ |
| Readiness gate reporting | ✅ | ✅ | ✅ |
| Multi-user RBAC | ❌ | ✅ | ✅ |
| Shared run evidence | ❌ | ✅ | ✅ |
| Enterprise approval quorum | ❌ | ❌ | ✅ |
| Full audit trail & sign-off chain | ❌ | ❌ | ✅ |
| Vault / K8s secret binding | ❌ | ❌ | ✅ |
| Site policy overlay | ❌ | ❌ | ✅ |
| Silicon feedback panel | ❌ | ❌ | ✅ |
| Package Build Registry | ❌ | ❌ | ✅ |
| Production use | ❌ | ⚠️ team scope | ✅ with site qualification |

---

## Active Release

All three variants are available in the current release. See [RELEASE_INDEX.md](./RELEASE_INDEX.md) for bundle IDs and download paths.
