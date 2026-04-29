# Extract and Install

## 1) Extract Package

```bash
mkdir -p /tmp/ic-agent-flow-package
tar -xzf <package-file>.tar.gz -C /tmp/ic-agent-flow-package
cd /tmp/ic-agent-flow-package
```

## 2) Verify Structure

Expected root:

- `README.md`
- `product/`
- `deployment/`
- `runtime/`
- `templates/`

## 3) Run Local Readiness Entry

```bash
python3 deployment/installers/run_customer_local_readiness.py \
  --repo-root . \
  --deployment-profile customer-vpc \
  --chip-id test-chip-02 \
  --task-id T-SN2025-PKG \
  --chip-name SN2025 \
  --rtl-function "Digital Controller" \
  --rtl-src templates/baseline-digital-soc/rtl
```

For toolchain and secret setup, see:

- `deployment/docs/EDA_TOOLCHAIN_BINDING.md`
- `deployment/docs/OPENAI_SECRET_SETUP.md`
