# EDA Toolchain Binding（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `releases/runtime-bundle-tw-20260429100301/team_project/deployment/docs/EDA_TOOLCHAIN_BINDING.md`
> source_sha256: `f92479ac35f65dfce66bffc82a51f0414d04e2aebaf5d865f96575c9dc6c9dae`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

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

