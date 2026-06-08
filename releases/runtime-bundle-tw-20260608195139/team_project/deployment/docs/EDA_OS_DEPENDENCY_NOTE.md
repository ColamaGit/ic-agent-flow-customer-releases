# Open Source EDA Tools OS Dependency Note
# 開源 EDA 工具作業系統相依性說明

This document details the operating system dependency and compatibility guidelines for the open-source EDA tools (such as Verilator, Yosys, OpenROAD, etc.) packaged in the `ic-agent-flow` environment.

本文件詳細說明了 `ic-agent-flow` 環境中所包裝的開源 EDA 工具（如 Verilator、Yosys、OpenROAD 等）之作業系統相依性與相容性指南。

---

## 🖥️ Development Environment Base (開發環境基線)

- **Official Validation**: The development repository of `ic-agent-flow` compiles, runs, and validates the EDA tools natively on **iMAC OS (macOS)**.
- **官方驗證**：`ic-agent-flow` 目前的開發儲存庫是在 **macOS (iMac OS)** 上對 EDA 工具進行編譯、執行與物理驗證。

---

## ⚠️ OS Dependency & Windows OS Issues (作業系統相依性與 Windows 支援問題)

- **No Native Windows Support**: We found that several key open-source EDA tools (e.g., Yosys, OpenROAD) **do not support** running natively on the Windows operating system.
- **不支援原生 Windows**：我們發現部分核心開源 EDA 工具（例如 Yosys, OpenROAD）**無法**在 Windows 作業系統上原生直接執行。
- **Docker-based Approach (Recommended)**: To resolve these OS dependency and toolchain compatibility barriers in non-macOS or Windows environments, you **must use a Docker-based approach** (containerized execution) to orchestrate and run these EDA tools properly.
- **Docker 容器化解決方案（推薦）**：為了解決非 macOS 環境（如 Windows OS）下的作業系統相依性與工具鏈相容性阻礙，您**必須使用 Docker 容器化方法**來編排與執行這些開源 EDA 工具。

---

## 🛠️ Local Governed Runs (本機治理運行)

Please ensure your local environment is correctly configured (either with native macOS EDA binaries or a configured Docker environment) before triggering physical EDA reruns on customer packages.

在客戶端解壓並啟動控制台後，若要觸發實體 EDA 流程重跑，請確保您的本機環境已正確設定（可直接執行 macOS 本機二進位檔，或已配置適當的 Docker 容器執行期環境）。
