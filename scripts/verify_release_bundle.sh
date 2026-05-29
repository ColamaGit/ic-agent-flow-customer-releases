#!/usr/bin/env bash
# verify_release_bundle.sh — v1.17.0+ flat-layout bundle verifier
# Usage: scripts/verify_release_bundle.sh <bundle_id>
#
# Supports the v1.17+ flat bundle layout:
#   releases/<bundle_id>/
#     ic-agent-flow-<variant>-<bundle_id>.tar.gz
#     <variant>.manifest.json
#     <variant>.checksums.json
#     publish_manifest.json
#     publish_audit_record.json
#
# Legacy (v1.6 and earlier) bundles used a <variant>/ subdirectory layout.
# This script auto-detects which layout is in use.
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <bundle_id>" >&2
  exit 2
fi

BUNDLE_ID="$1"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BUNDLE_DIR="$ROOT/releases/$BUNDLE_ID"

if [[ ! -d "$BUNDLE_DIR" ]]; then
  echo "[FAIL] bundle not found: $BUNDLE_DIR" >&2
  exit 1
fi

variants=(solo_eval team_project enterprise_site)

# ── Layout detection ────────────────────────────────────────────────────────
# v1.17+ flat layout: variant files sit directly in BUNDLE_DIR
# v1.6  legacy layout: each variant has its own subdirectory
if [[ -f "$BUNDLE_DIR/${variants[0]}.manifest.json" ]]; then
  LAYOUT="flat"
else
  LAYOUT="legacy"
fi
echo "[INFO] detected layout: $LAYOUT for bundle: $BUNDLE_ID"

# ── Verify by layout ────────────────────────────────────────────────────────
if [[ "$LAYOUT" == "flat" ]]; then

  for v in "${variants[@]}"; do
    # tar.gz filename uses dashes, not underscores (e.g. solo-eval, team-project)
    v_dash="${v//_/-}"
    ls "$BUNDLE_DIR"/ic-agent-flow-"$v_dash"-"$BUNDLE_ID".tar.gz >/dev/null 2>&1 \
      || { echo "[FAIL] missing tar.gz for variant: $v (expected ic-agent-flow-${v_dash}-${BUNDLE_ID}.tar.gz)" >&2; exit 1; }
    # manifest
    [[ -f "$BUNDLE_DIR/$v.manifest.json" ]] \
      || { echo "[FAIL] missing $v.manifest.json" >&2; exit 1; }
    # checksums
    [[ -f "$BUNDLE_DIR/$v.checksums.json" ]] \
      || { echo "[FAIL] missing $v.checksums.json" >&2; exit 1; }
    echo "[OK] variant: $v"
  done

  # publish_manifest (v1.17+)
  [[ -f "$BUNDLE_DIR/publish_manifest.json" ]] \
    || { echo "[FAIL] missing publish_manifest.json" >&2; exit 1; }
  echo "[OK] publish_manifest.json"

  # publish_audit_record (v1.17+)
  [[ -f "$BUNDLE_DIR/publish_audit_record.json" ]] \
    || { echo "[FAIL] missing publish_audit_record.json" >&2; exit 1; }
  echo "[OK] publish_audit_record.json"

else
  # ── Legacy layout (v1.6) ─────────────────────────────────────────────────
  for v in "${variants[@]}"; do
    vdir="$BUNDLE_DIR/$v"
    [[ -d "$vdir" ]] || { echo "[SKIP] missing legacy variant dir: $vdir (may be partial release)" >&2; continue; }
    ls "$vdir"/*.tar.gz >/dev/null 2>&1 || { echo "[FAIL] missing tar.gz in $vdir" >&2; exit 1; }
    [[ -f "$vdir/$v.manifest.json" ]] || { echo "[FAIL] missing $v.manifest.json" >&2; exit 1; }
    [[ -f "$vdir/$v.checksums.json" ]] || { echo "[FAIL] missing $v.checksums.json" >&2; exit 1; }
    echo "[OK] legacy variant: $v"
  done

  [[ -f "$BUNDLE_DIR/customer_release_staging_manifest.json" ]] || {
    echo "[FAIL] missing customer_release_staging_manifest.json" >&2
    exit 1
  }
  echo "[OK] customer_release_staging_manifest.json"
fi

# ── Denylist scan (both layouts) ────────────────────────────────────────────
if find "$BUNDLE_DIR" -type f \( -path '*/workspace/*' -o -path '*/tests/*' -o -name '.env' \) | grep -q .; then
  echo "[FAIL] denylist content detected (workspace/tests/.env)" >&2
  exit 1
fi
echo "[OK] denylist scan clean"

echo "[PASS] bundle verification ok: $BUNDLE_ID (layout=$LAYOUT)"
