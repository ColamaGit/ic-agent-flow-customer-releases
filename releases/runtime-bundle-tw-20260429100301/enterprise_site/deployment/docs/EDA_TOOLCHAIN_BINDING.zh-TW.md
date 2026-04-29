# EDA Toolchain Binding

Runtime tool resolution is host-bound and can be overridden per run.

## Supported Override Keys

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
  --override yosys_bin=/usr/local/bin/yosys \
  --override openroad_bin=/Users/imac/eda/openroad-cxx17/build-clang/bin/openroad
```

## Operational Rule

Package delivers runtime/templates/contracts only.
Customer site binds actual tool locations during activation.
