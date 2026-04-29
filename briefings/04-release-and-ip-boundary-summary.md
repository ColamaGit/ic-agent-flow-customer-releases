# Release and IP Boundary Summary

## Release Truth Model

- Payload truth: `releases/runtime-bundle-tw-*`
- Version pointers: `releases/version-pointers/*.json`
- Customer entrypoints: `README.md`, `RELEASE_INDEX.md`, `docs/`, `activation-packs/`

## Not Included in Customer Release

- `workspace/` internal governance truth
- internal tests/closeout reasoning
- prompt/context internals
- secret values

## Verification

Run `scripts/verify_release_bundle.sh <bundle_id>`.
