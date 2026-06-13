# Security

[EN](./SECURITY.md) | [zh-TW](./SECURITY.zh-TW.md)

## Security Boundary

This repository is a **customer-facing distribution surface only**.

The following content is strictly forbidden in this repository:
- Internal source code (`workspace/`, `tests/`, internal scripts)
- Environment secrets or credentials (`.env`, API keys, tokens)
- Internal PRD / closeout reasoning or governance documents
- Prompt, context, or AI agent internals
- Vendor IP or customer design IP

---

## Verifying Release Packages

**Always verify a release bundle before use.** Every release includes checksum files and a publish manifest.

```bash
# Verify the active release bundle
scripts/verify_release_bundle.sh <bundle_id>

# Example:
scripts/verify_release_bundle.sh runtime-bundle-tw-20260529043609
```

The verification script checks:
- All three variant packages (tar.gz) are present
- Checksums match the published manifest
- No forbidden content (workspace/, tests/, .env) is included
- Pre-extraction docs are intact

---

## Reporting Security Issues

If you discover a security vulnerability in ICAF or this release repository:

1. **Do not open a public GitHub issue.**
2. Contact the ICAF security team through your established customer support channel.
3. Provide: bundle ID, variant, nature of the issue, and any relevant evidence.

We aim to respond within **5 business days** for critical issues.

---

## Package Integrity Chain

Each release bundle contains:
- `*.checksums.json` — SHA-256 checksums for all package files
- `publish_manifest.json` — what is in the bundle and its provenance
- `publish_audit_record.json` — binary integrity verification record

See [trust/signature_verification.md](./trust/signature_verification.md) for signature verification details.
