# EDA Toolchain Binding

Runtime tool resolution is host-bound and can be overridden per run.

## Supported Override Keys

- `verilator_bin`
- `yosys_bin`
- `openroad_bin`
- `opensta_bin`
- `netgen_bin`
- `klayout_python_bin`
- `nangate45_root`
- `nangate45_lib_path`
- `nangate45_tech_lef_path`
- `nangate45_stdcell_lef_path`
- `nangate45_tracks_path`

## Example

```bash
python3 deployment/installers/run_customer_local_readiness.py \
  --repo-root . \
  --deployment-profile customer-vpc \
  --chip-id test-chip-02 \
  --task-id T-SN2025-PKG \
  --chip-name SN2025 \
  --rtl-function "Digital Controller" \
  --rtl-src templates/baseline-digital-soc/rtl \
  --override yosys_bin=/usr/bin/yosys \
  --override openroad_bin=/opt/eda/openroad/bin/openroad \
  --override opensta_bin=/opt/eda/opensta/bin/sta
```

## Operational Rule

Package delivers runtime/templates/contracts only.
Customer site binds actual tool locations during activation.

## Recommended Open-Source EDA Toolchain

This document only defines how customer-installed EDA tools are bound into the ICAF runtime.

For the recommended open-source EDA toolchain preparation guide, including develop-repo-aligned validated versions, installation paths, PDK setup, and preflight validation commands, see:

- `OPEN_SOURCE_EDA_TOOLCHAIN_RECOMMENDATION.md`

Binding remains explicit and site-local. Tool installation is not bundled into the runtime distribution package.
