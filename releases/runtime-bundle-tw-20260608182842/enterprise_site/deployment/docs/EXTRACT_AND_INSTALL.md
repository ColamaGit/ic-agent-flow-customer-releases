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

## 4) Console Bootstrap & Verification

To boot the visual console on the customer side:
```bash
# 1. Install frontend dependencies (Vite v8.0.8)
npm --prefix workspace/console install

# 2. Boot the dual-server environment (API server + Vite dev server)
npm --prefix workspace/console run dev
```

Open `http://localhost:5173/` in your browser. Verify the following parameters:
- **Silicon Inventory Table (Home page)**: Displays 4 chips (SN2025, UART, ASYNC_FIFO, QUAD_UART) with `READINESS` set to `"1 run"`.
- **EDA Run Detail Views**:
  - `SN2025` File/Dir count: **410**
  - `UART` File/Dir count: **416**
  - `ASYNC_FIFO` File/Dir count: **417**
  - `QUAD_UART` File/Dir count: **421**
- The file tree renders folders from `01_inputs` through `22_reports`.
