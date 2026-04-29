#!/usr/bin/env bash
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
for v in "${variants[@]}"; do
  vdir="$BUNDLE_DIR/$v"
  [[ -d "$vdir" ]] || { echo "[FAIL] missing variant dir: $vdir" >&2; exit 1; }
  ls "$vdir"/*.tar.gz >/dev/null 2>&1 || { echo "[FAIL] missing tar.gz in $vdir" >&2; exit 1; }
  [[ -f "$vdir/$v.manifest.json" ]] || { echo "[FAIL] missing $v.manifest.json" >&2; exit 1; }
  [[ -f "$vdir/$v.checksums.json" ]] || { echo "[FAIL] missing $v.checksums.json" >&2; exit 1; }
  [[ -f "$vdir/README.md" ]] || { echo "[FAIL] missing README.md in $v" >&2; exit 1; }
  [[ -f "$vdir/deployment/docs/EXTRACT_AND_INSTALL.md" ]] || { echo "[FAIL] missing EXTRACT_AND_INSTALL.md in $v" >&2; exit 1; }
  [[ -f "$vdir/deployment/docs/OPENAI_SECRET_SETUP.md" ]] || { echo "[FAIL] missing OPENAI_SECRET_SETUP.md in $v" >&2; exit 1; }
  [[ -f "$vdir/deployment/docs/EDA_TOOLCHAIN_BINDING.md" ]] || { echo "[FAIL] missing EDA_TOOLCHAIN_BINDING.md in $v" >&2; exit 1; }
  [[ -f "$vdir/runtime/package_capabilities/runtime_environment_manifest.json" ]] || { echo "[FAIL] missing runtime_environment_manifest.json in $v" >&2; exit 1; }
done

[[ -f "$BUNDLE_DIR/customer_release_staging_manifest.json" ]] || {
  echo "[FAIL] missing customer_release_staging_manifest.json" >&2
  exit 1
}

if find "$BUNDLE_DIR" -type f \( -path '*/workspace/*' -o -path '*/tests/*' -o -name '.env' \) | grep -q .; then
  echo "[FAIL] denylist content detected (workspace/tests/.env)" >&2
  exit 1
fi

echo "[PASS] bundle verification ok: $BUNDLE_ID"
