# Repository Guidelines — ic-agent-flow Customer Releases

## What This Repository Is

This repository is the **customer-facing release registry** for `ic-agent-flow (ICAF)`.
It is **not** the source development repository.

**This repository contains:**
- Customer release bundles (runtime packages for each variant)
- Release manifests, checksums, and integrity records
- Public operational documentation
- Deployment profiles and templates
- Activation checklists and smoke scenarios
- Public contract schemas
- Trust and signature verification records

**This repository must NOT contain:**
- Internal source code (`workspace/`, `tests/`, `.env`, internal scripts)
- Internal governance documents, PRDs, or closeout reasoning
- Prompt, context, or AI agent internals
- Customer or vendor design IP
- Any credentials or secrets

---

## Repository Structure

```
ic-agent-flow-customer-releases/
├── releases/                     # Release payloads and version pointers
│   ├── runtime-bundle-tw-*/      # Bundle payload roots (one per release)
│   ├── version-pointers/         # LATEST.json + semantic version pointers
│   └── CHANGELOG.md              # Release changelog
├── docs/                         # Customer operation documentation
├── briefings/                    # Customer reading pack and orientation
├── activation-packs/             # Per-variant activation checklists and smoke refs
│   ├── solo_eval/
│   ├── team_project/
│   └── enterprise_site/
├── profiles/                     # Deployment profile templates
│   ├── solo_eval/
│   ├── team_project/
│   └── enterprise_site/
├── schemas/                      # Public contract and runtime schema definitions
│   ├── customer_runtime/
│   └── public_contract/
├── scripts/                      # Verification and utility scripts
├── trust/                        # Public keys and signature verification docs
├── validation/                   # Release validation summaries
├── README.md / README.zh-TW.md
├── RELEASE_INDEX.md / RELEASE_INDEX.zh-TW.md
├── PACKAGE_VARIANTS.md / PACKAGE_VARIANTS.zh-TW.md
├── SECURITY.md / SECURITY.zh-TW.md
├── SUPPORT.md / SUPPORT.zh-TW.md
└── LICENSE.md / LICENSE.zh-TW.md
```

---

## Key Commands

```bash
# Verify the active release bundle
scripts/verify_release_bundle.sh <bundle_id>

# Example:
scripts/verify_release_bundle.sh runtime-bundle-tw-20260529043609

# List all files in a bundle
ls releases/runtime-bundle-tw-20260529043609/

# Check latest version pointer
cat releases/version-pointers/LATEST.json
```

---

## Coding Style & Naming Conventions

- All documentation files: Markdown (`.md`)
- All structured data: JSON (`.json`) or YAML (`.yaml`)
- JSON/YAML: 2-space indentation
- File and directory names: lowercase kebab-case (`release-manifest.json`, `eda-toolchain.yaml`)
- Canonical variant names (do not rename): `solo_eval`, `team_project`, `enterprise_site`
- Bundle ID format: `runtime-bundle-tw-YYYYMMDDHHMMSS` (Asia/Taipei UTC+8)

---

## i18n Policy

All customer-facing `*.md` files must have both an English (`*.md`) and Traditional Chinese (`*.zh-TW.md`) version.

- Never leave a `*.zh-TW.md` file with English-only content.
- When updating an English file, update the zh-TW counterpart in the same commit.
- See `docs/i18n-policy.md` for the full policy.

---

## Release Integrity Rules

- **Never manually edit** bundle contents inside `releases/runtime-bundle-tw-*/`.
- **Never add** source code, internal docs, secrets, or IP to this repository.
- Every new bundle must be verified with `scripts/verify_release_bundle.sh` before merging.
- Every release must update: `releases/version-pointers/LATEST.json`, the version pointer file, and `RELEASE_INDEX.md`.

---

## Commit & Pull Request Guidelines

Use imperative commit subjects with scope prefix:
- `release(v1.17.0): add runtime-bundle-tw-20260529043609`
- `docs: update getting-started guide`
- `fix: correct zh-TW translation in briefings/01`
- `chore: update RELEASE_INDEX.md for v1.17.0`

PRs must include:
- Affected paths and scope
- Verification command output (e.g., `verify_release_bundle.sh` result)
- Confirmation that both EN and zh-TW files are updated
- Notes on customer-facing impact
