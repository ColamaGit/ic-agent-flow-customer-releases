# Open-Source EDA Toolchain Recommendation

For a successful customer site activation and local governed rerun, this guide defines the recommended open-source EDA toolchain baseline aligned with our active development repository. 

---

## 1. Purpose & Support Boundary

*   **Host Ownership**: The ICAF software packaging system **does not bundle** any EDA tools or compiler binaries. Customer site operators are solely responsible for installing, licensing, and maintaining their own EDA toolchain binaries.
*   **Decoupled Alignment**: The tool versions documented here represent the **validated baseline** tested in our active development repository. While newer or alternative versions of these open-source tools can be used via explicit overrides, they are subject to preflight validation checks to confirm functional and semantic compatibility.
*   **Strict Non-Claims**: Using these recommended versions does not guarantee 100% environment compatibility. Exact compatibility is highly host-dependent (e.g., host OS, compiler runtime, and dependency libraries) and must be explicitly verified by running the **ICAF Site Preflight and Toolchain Resolution Records** during activation.

---

## 2. Develop-Repo-Aligned Validated Toolchain

The following table lists the exact versions of the open-source EDA tools that have been validated and proven to produce passing readiness and convergence runs inside our development repository:

| Tool | Validated Version | Minimum Supported | Primary Role / Step | Installation / Source Pointers |
| :--- | :--- | :--- | :--- | :--- |
| **Verilator** | `v5.047` | `v5.000+` | `V1` RTL Lint & `V2` Bounded Simulation | [Verilator GitHub](https://github.com/verilator/verilator) (Git Quick Install or source build recommended) |
| **Yosys** | `v0.64` | `v0.40+` | `H1` RTL Synthesis & `V4` LEC (Logic Equivalence) | [YosysHQ/yosys](https://github.com/YosysHQ/yosys) (Must include DFT pass) |
| **OpenROAD** | `v2.0` | `v2.0+` | `H2` Place & Route & `TIMING` STA analysis | [TheOpenRoadProject/OpenROAD](https://github.com/TheOpenRoadProject/OpenROAD) |
| **OpenSTA** | `v2.4` | `v2.0+` | `TIMING-01`/`02` Static Timing Analysis | Integrated in OpenROAD; or [OpenSTA Standalone](https://github.com/TheOpenRoadProject/OpenSTA) |
| **Netgen** | `v1.5.318` | `v1.5+` | `PHYS-03` LVS (Layout Vs Schematic) | [R. Timothy Edwards / netgen](http://opencircuitdesign.com/netgen/) |
| **KLayout** | `v0.29.6` | `v0.26+` | `PHYS-04` GDSII Viewer & DRC verification | [KLayout.de](https://www.klayout.de/) (Requires `klayout_python` bindings) |
| **SymbiYosys (sby)** | `v0.35` | `v0.30+` | `FUNC-02` Formal Verification (sby) | [YosysHQ/sby](https://github.com/YosysHQ/sby) (Miter-based prove engine) |
| **SkyWater PDK** | `sky130A` | `sky130A` | Open-source PDK substrate | [google/skywater-pdk](https://github.com/google/skywater-pdk) via OpenLane / Volare |

---

## 3. Recommended Installation Paths

For customer site engineers bootstrapping their local VPC environment, we recommend the following installation and preparation strategies:

### A. PDK and Flow Context (Optional Volare Integration)
To prepare the `sky130A` PDK context and standard cell library pointers, **Volare** (the PDK version manager) may be utilized:
1. Volare installs and manages PDK versions using commit hashes to lock down PDK releases:
   ```bash
   volare build --pdk sky130A
   ```
2. Note that Volare is a PDK manager, not a general toolchain installer. Standalone binaries of Yosys, OpenROAD, and Netgen must still be bound explicitly.

### B. Compilation of Verilator (Git Quick Install)
Since package managers often distribute older versions of Verilator, a Git source-build compilation is highly recommended:
```bash
git clone https://github.com/verilator/verilator
cd verilator
git checkout v5.047
autoconf
./configure
make -j$(nproc)
sudo make install
```

### C. Binary Distributions (OSS CAD Suite)
For a rapid and cohesive environment setup, **YosysHQ OSS CAD Suite** may be utilized as a known-good bundle, containing Yosys, SymbiYosys, and associated formal verification engines:
- Refer to [YosysHQ/oss-cad-suite-build](https://github.com/yosyshq/oss-cad-suite-build) for precompiled multi-platform tool binaries.

---

## 4. Verification Commands

To confirm the readiness and basic functionality of the installed tools on the host before activation, operators (or AI agents) should verify they are discoverable in the system `$PATH` and report correct versions using the following fallback-enabled commands:

```bash
# Verify Verilator
verilator --version

# Verify Yosys
yosys -V

# Verify OpenROAD & OpenSTA
openroad -version
sta -version || openroad -version

# Verify Netgen LVS
netgen -batch source /dev/null || netgen -version

# Verify KLayout
klayout -v

# Verify SymbiYosys (Formal verification engine)
sby --version

# Verify PDK Root and sky130A path
echo $PDK_ROOT
test -d "$PDK_ROOT/sky130A"
```

---

## 5. Binding into ICAF Runtime

Once the tools are verified, refer to `deployment/docs/EDA_TOOLCHAIN_BINDING.md` to configure the runtime bindings via environment variables or explicit execution `--override` parameters. 

Newer or alternative tool versions can be adopted by the customer; however, the site activation preflight will run automated smoke tests and readiness checks. If any divergence or validation failure occurs (fail-closed), the operator must reconcile the versions back to the validated baseline before tapeout convergence is claimed.

### Commercial & Custom Tool Replacement (PRD v1.16 Path)
Commercial, proprietary, or customer-internal tool replacement is not handled by this recommendation guide. Such replacement must follow the PRD v1.16 governed node replacement and customer tool plugin path. While the tool backend may be replaced, the underlying node contract, evidence obligations, QA trust layers, audit trails, and release authority boundaries cannot be weakened or bypassed.

---

## 6. AI Agent Operator Rules

If the customer site installation and activation are executed by an AI agent operator, the agent must strictly comply with the following deterministic governance laws:
- **No Unbound Inference**: The AI agent **must not infer** missing tool locations or bypass binding parameters. If a binding key is required, system PATH auto-discovery alone must not be treated as sufficient without explicit confirmation.
- **No Silent Downgrade/Bypass**: The AI agent **must not silently accept** or downgrade unvalidated tool versions.
- **Fail-Closed Obligation**: The AI agent **must emit a `missing_toolchain_binding_record`** when any required tool, PDK root path, or standard cell collateral is unresolved.
- **Preflight Validation Gate**: The AI agent **must run the full site preflight suite** and record execution fingerprints before making any functional readiness or tapeout convergence claim.
- **Enforced Fail-Closed**: Any deviation in tool version checks, PDK integration, or license boundaries must trigger a hard **fail-closed status**, blocking activation.
