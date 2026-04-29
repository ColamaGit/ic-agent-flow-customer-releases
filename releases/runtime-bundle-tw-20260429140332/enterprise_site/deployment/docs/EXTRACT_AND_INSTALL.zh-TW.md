# Extract and Install（zh-TW synced）

> sync_mode: `canonical_mirror`
> source_file: `releases/runtime-bundle-tw-20260429140332/enterprise_site/deployment/docs/EXTRACT_AND_INSTALL.md`
> source_sha256: `c1a626a3cfdda06ea80c93f2df7814010e0d88d7c81fde8367b6703c8396a141`

## 說明

本檔與英文版同步鎖定。為避免 EN/zh-TW 漂移，先以 canonical mirror 方式確保資訊一致。
後續若要提供完整繁中翻譯，必須在更新後重算 `source_sha256`。

---

## Canonical Content (EN)

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

