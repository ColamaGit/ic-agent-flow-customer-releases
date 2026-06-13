# Signature Verification

[EN](./signature_verification.md) | [zh-TW](./signature_verification.zh-TW.md)

## Overview

Every ICAF release bundle includes integrity verification artifacts. This document explains how to verify the authenticity and integrity of a release package.

---

## What Is Provided Per Release

| Artifact | Location | Purpose |
|----------|----------|---------|
| `*.checksums.json` | `releases/<bundle_id>/` | SHA-256 checksums for all package files |
| `publish_manifest.json` | `releases/<bundle_id>/` | Bundle contents and provenance record |
| `publish_audit_record.json` | `releases/<bundle_id>/` | Binary integrity verification record (src→dst hash comparison) |
| Public signing key | `trust/public_keys/release-signing-key.pub` | Release signing public key (when signature is available) |

---

## Integrity Verification Steps

### Step 1 — Run the Verification Script

```bash
scripts/verify_release_bundle.sh <bundle_id>
```

This script automatically checks:
- All expected variant files (tar.gz, manifest, checksums) are present
- Checksums match the published manifest
- No forbidden content is included (workspace/, tests/, .env)
- Pre-extraction documentation is intact

Expected output: `[PASS] bundle verification ok: <bundle_id>`

### Step 2 — Manual Checksum Verification (optional)

For additional confidence, you can manually verify individual file checksums:

```bash
# Check the checksums file for your variant
cat releases/<bundle_id>/<variant>.checksums.json

# Verify a specific file manually
shasum -a 256 releases/<bundle_id>/<variant>/<package>.tar.gz
```

Compare the output against the value in the checksums file.

### Step 3 — Review the Publish Audit Record

```bash
cat releases/<bundle_id>/publish_audit_record.json
```

Key fields to verify:
- `binary_integrity_verified: true` — source and destination hashes matched
- `git_commit_performed: true` — commit was recorded
- `git_push_performed: true` — push was recorded

---

## Trust Root

The trust root manifest for this repository is at:
```
trust/trust_root_manifest.json
```

This file records the repository's trust anchors, public key references, and verification policy.

---

## Notes

- Cryptographic signing (GPG/SSH) for release packages is planned for a future release.
- Until signing is available, integrity is established through SHA-256 checksums and publish audit records.
- Never use a release bundle that fails checksum verification.
