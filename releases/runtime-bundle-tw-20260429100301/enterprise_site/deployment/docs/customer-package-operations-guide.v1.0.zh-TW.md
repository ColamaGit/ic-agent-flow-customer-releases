# Customer Package Operations Guide v1.0（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `releases/runtime-bundle-tw-20260429100301/enterprise_site/deployment/docs/customer-package-operations-guide.v1.0.md`
> source_sha256: `3a12981d28a3b4f543aacd56d928c38520d6f2e9097f69cb40f2d670ce3915fa`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

# Customer Package Operations Guide v1.0

## Scope

This guide explains how to operate extracted customer packages for:

- `solo_eval`
- `team_project`

It is an operational guide and not a signoff authority document.

## 1) Package Intent and Profile Difference

- `solo_eval`: local single-user evaluation, allowed chip = `SN2025`.
- `team_project`: small team project mode, allowed chips = `SN2025`, `UART`, with RBAC roles (`operator`, `reviewer`, `approver`, `auditor`).

Validate profile intent in:

- `product/packaging-manifest.yaml` (`mode_profile`)
- `runtime/package_capabilities/customer_mode_entitlement_manifest.v1.json`
- `deployment/profiles/package-mode/<mode>.json`

## 2) Recommended Extract Flow

```bash
mkdir -p /tmp/ic-agent-flow-package
tar -xzf <package-file>.tar.gz -C /tmp/ic-agent-flow-package
cd /tmp/ic-agent-flow-package
```

Related quick docs:

- `deployment/docs/EXTRACT_AND_INSTALL.md`
- `deployment/docs/EDA_TOOLCHAIN_BINDING.md`
- `deployment/docs/OPENAI_SECRET_SETUP.md`
- `deployment/docs/SUPPORT_EXPORT.md`
- `deployment/docs/TROUBLESHOOTING.md`

## 3) Extracted Folder Structure

Expected package root:

- `README.md`
- `product/`
- `deployment/`
- `runtime/`
- `templates/`

`templates/` is required for default chip bootstrap paths and example RTL inputs.

## 4) EDA Toolchain Alignment

The package runtime resolves EDA tools from host environment and/or explicit overrides.

Supported override keys (CLI `--override key=value`):

- `verilator_bin`
- `yosys_bin`
- `openroad_bin`
- `netgen_bin`
- `klayout_python_bin`
- `nangate45_root`
- `nangate45_lib_path`
- `nangate45_tech_lef_path`
- `nangate45_stdcell_lef_path`
- `nangate45_tracks_path`

Example:

```bash
python3 deployment/installers/run_customer_local_readiness.py \
  --repo-root . \
  --deployment-profile customer-vpc \
  --chip-id test-chip-02 \
  --task-id T-SN2025-PKG \
  --chip-name SN2025 \
  --rtl-function "Digital Controller" \
  --rtl-src templates/baseline-digital-soc/rtl \
  --override yosys_bin=/usr/local/bin/yosys \
  --override openroad_bin=/Users/imac/eda/openroad-cxx17/build-clang/bin/openroad
```

For readiness semantics and H0/H1/H2/H4/H3 evidence interpretation, see:

- `deployment/docs/customer-local-real-eda-rerun-and-readiness-guide.v0.1.md`

## 5) OpenAI Key Placement and Runtime Binding

Runtime reads OpenAI credentials from process environment.

Required:

- `OPENAI_API_KEY`

Optional:

- `OPENAI_MODEL`

Set for current shell session:

```bash
export OPENAI_API_KEY="<your-key>"
export OPENAI_MODEL="gpt-5.4"
```

If using a local `.env` file at package root:

```bash
set -a
source .env
set +a
```

Do not commit `.env` into repo/package artifacts.

## 6) IP and Export Boundary Reminder

Customer package is runtime distribution, not source distribution.

Excluded from customer package by policy:

- `workspace/`
- `internal-dev/`
- `tests/`
- planning and closeout working notes
- secret files (for example `.env`)

Support/export outputs must remain redacted and bounded per policy.

