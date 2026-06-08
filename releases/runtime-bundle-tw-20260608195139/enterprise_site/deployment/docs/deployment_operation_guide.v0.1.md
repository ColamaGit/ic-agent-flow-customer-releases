# Deployment Operation Guide v0.1

本文件是 first deployable release 的單一操作 runbook，供 AI/Human 共用。

## Prerequisites

- Python venv 可用（建議使用 package 或安裝目錄內 `.venv`）。
- package runtime library 可被 `PYTHONPATH` 載入，或已透過 wheel/install script 安裝。
- package/extract root 已有 `product/`, `deployment/`, `distribution/`。
- for PRD v1.11 CDC signoff-lite lane:
  - `sby` (SymbiYosys) 可執行
  - at least one SMT solver available (`z3` or equivalent)
- 具備執行權限：
- `npm run build-distribution`
- `npm run validate-distribution`
- `npm run run-fdp01`
- `npm run run-first-release`

### v1.11 Tool Bootstrap (sby)

If `sby` is not available on host:

```bash
cd <toolchain-root>/sby
python3 -m venv .venv
. .venv/bin/activate
python -m pip install --upgrade pip click
make install PREFIX=$HOME/.local
```

Recommended stabilization (no shell activation required):

```bash
# fix shebang of ~/.local/bin/sby to venv python
sed -i '' '1s|.*|#!<toolchain-root>/sby/.venv/bin/python|' ~/.local/bin/sby
```

Validation:

```bash
which sby
sby --help
which z3
```

## Init

1. 建置 distribution 產物與 provenance：
```bash
npm run build-distribution
```
2. 驗證 distribution 完整性與來源：
```bash
npm run validate-distribution
```
3. 執行 FDP-01 acceptance（P1-P6）：
```bash
npm run run-fdp01
```

4. 解包並執行安裝（第一個可部署路徑）：
```bash
tar -xzf distribution/runtime-bundles/runtime-bundle-<timestamp>.tar.gz -C /tmp/icaf-bundle
python3 /tmp/icaf-bundle/deployment/installers/install_runtime_bundle.py \
  --bundle-root /tmp/icaf-bundle \
  --install-root /opt/ic-agent-flow
```

## Operate

### Daily Operation
```bash
npm run validate-distribution
```

### Upgrade / Rollback / Support Export
- `npm run run-fdp01` 會產生：
- `deployment/upgrade/records/<run_id>/upgrade_record.json`
- `deployment/rollback/records/<run_id>/rollback_record.json`
- `distribution/support-bundles/support_audit_bundle_<run_id>.json`

### First Release Operation
```bash
npm run run-first-release
```

產物：
- `deployment/release/records/<release_id>/release_record.json`
- `deployment/release/notes/<release_id>.md`

### Installed Runtime Healthcheck
```bash
python3 /tmp/icaf-bundle/deployment/installers/healthcheck_runtime_install.py \
  --install-root /opt/ic-agent-flow
```

## Troubleshooting

- `validate-distribution` fail：先檢查 `distribution/release-manifests/build_provenance.json` 是否存在且欄位完整。
- `run-fdp01` fail：檢查 `deployment/profiles/airgap-local/profile.yaml` 與 package-local closeout/evidence output root 寫入權限。
- `run-first-release` fail：
- 若訊息包含 `missing required audit record refs`，表示 `v0.2_deployment_audit_bundle.json` 記錄缺欄位。
- 若訊息包含 `release_record missing required fields`，表示 release record 契約不完整。
- 安裝 fail：
- 若 `wheelhouse` 不存在，系統會走 `source_overlay` 模式（從 bundle 內 `runtime/source` 安裝）。
- 若 `runtime/source` 也缺失，安裝會 fail-closed。

## Related Customer Guide (v1.7/v1.8/v1.9 Alignment)

For console initialization, customer-facing page semantics, v1.9 skill usage interpretation, and post-v1.9 claim-boundary reading:

- `deployment/docs/customer-console-and-skill-operations-guide.v1.9.md`

## Package/Release Required Disclosure (v1.11)

When package build/release includes `v3b_cdc_signoff_lite`, release notes and operation bundle must include:

1. `sby` availability requirement
2. solver requirement (`z3` or equivalent)
3. explicit non-signoff claim boundary:
   - `claim_class=NON_SIGNOFF_CDC_LITE`
   - `v3b PASS` is not signoff closure claim
