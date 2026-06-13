# ic-agent-flow (ICAF) — Customer Releases

[EN](./README.md) | [zh-TW](./README.zh-TW.md)

> **This is the official customer release repository for `ic-agent-flow` (ICAF).**
> It is not the source development repository.
> All releases here are production-ready, verified packages.

---

## 🤔 What Is ICAF?

**ic-agent-flow (ICAF)** is a runtime system that helps engineering teams design computer chips **correctly, safely, and with full traceability** — from the very first idea all the way to handing off the chip design to a factory.

Think of it like this:

> Imagine building a very complex LEGO model that has thousands of parts, involves many people, and must be perfect before going to the factory. ICAF is the **step-by-step instruction booklet + inspection system** that makes sure every part is assembled correctly, every inspector has signed off, and every decision is written down so you can look it up later.

ICAF does this for **IC (Integrated Circuit) chip design**, where the "LEGO parts" are things like circuit specifications, architecture diagrams, simulation results, and layout files.

---

## 🚀 What Can ICAF Do?

ICAF covers the **full journey** of a chip from idea to factory handoff:

| Stage | What ICAF Does |
|-------|---------------|
| 📋 **Spec & Architecture** | Takes your chip requirements, helps generate and validate an architecture graph, then locks it ("freezes") so everyone works from the same truth |
| ⚙️ **EDA Execution** | Runs the real open-source EDA (chip design) tools — simulation, synthesis, place-and-route, timing analysis, layout verification — automatically |
| 🔍 **Evidence Collection** | Every tool run produces verified, auditable evidence files (not just logs — machine-readable records with checksums) |
| ✅ **Readiness Gates** | Checks every stage against defined pass/fail rules before allowing the next stage to proceed |
| 🖥️ **Operator Console** | A web-based dashboard where your team can see the full chip status, review decisions, and trigger actions |
| 📦 **Package & Release** | Packages the final verified runtime for deployment to your team or organization |
| 🔄 **Silicon Feedback** | After a chip comes back from the factory, feeds real silicon test results back into the system for traceability |

---

## 🔧 How Does It Work?

Here is the high-level flow — think of it as a relay race where each runner must pass the baton correctly before the next one starts:

```
Your Chip Requirement
       ↓
  [Spec Intake]  ← AI-assisted, human reviewed
       ↓
  [Architecture Graph]  ← generated + validated + frozen
       ↓
  [EDA Execution]  ← Verilator → Yosys → OpenROAD → KLayout → Netgen ...
       ↓
  [Evidence & Readiness Report]  ← every result is recorded & checked
       ↓
  [Human Sign-off Gates]  ← humans make the final decisions
       ↓
  [Tapeout Package]  ← assembled + integrity-verified
       ↓
  [Foundry Handoff]  ← the chip goes to the factory
       ↓
  [Silicon Feedback]  ← real results come back into the system
```

**Key idea:** Nothing advances to the next step unless the current step has proper, recorded, machine-verifiable proof. This is called **No-Proof-No-Claim**.

---

## ✨ Why ICAF? Key Benefits

### 1. 🛡️ Governance First — No Silent Failures
Every action leaves a record. Every decision has an evidence file. If something goes wrong, you can trace exactly where, when, and why — like a flight recorder for your chip design.

### 2. 🤖 AI-Assisted, Human-Governed
ICAF uses AI agents to help with repetitive tasks (like spec generation, graph building, tool execution) — but **humans always control the gates**. AI speeds you up; humans keep you safe.

### 3. 🔬 Real Open-Source EDA Tool Integration
ICAF runs **real, production-grade open-source EDA tools**, not simulations or stubs:
- **Verilator** — RTL linting and simulation
- **Yosys** — logic synthesis and equivalence checking
- **OpenROAD** — place-and-route
- **OpenSTA** — timing analysis
- **KLayout** — layout DRC and GDS
- **Netgen** — LVS (Layout vs. Schematic)
- And more (static IR-drop, DFT scan, ESD review, IO pad ring)

### 4. 📊 Operator Console — See Everything at Once
A live web dashboard shows your entire chip design status: which stages passed, which need attention, what evidence exists, what decisions are pending. No more hunting through folders.

### 5. 📦 Flexible Deployment Packages
ICAF comes in three sizes to fit your team:
- **`solo_eval`** — Single-user local evaluation
- **`team_project`** — Small team collaboration
- **`enterprise_site`** — Organization-scale deployment with full governance

### 6. 🔐 IP Protection Built In
Your source code and proprietary toolchain details stay protected. ICAF's distribution model separates customer runtime from internal development sources.

### 7. ♻️ Replay and Audit
Any run can be replayed deterministically. All evidence is checksum-protected. You can prove to anyone — including your foundry — exactly what was done and when.

---

## 📡 Current Capabilities (v1.17.0)

### ✅ Implemented & Verified

**Upstream Flow (Spec → Architecture)**
- Requirement intake sessions with AI assistance
- Architecture graph generation, validation, and freeze
- Human requirement adjudication with formal sign-off records

**EDA Execution Chain**
- V1: Verilator lint
- V2: Verilator bounded simulation
- V3: CDC/RDC structural analysis
- V3b: CDC signoff-lite (sby + z3)
- V4: Yosys equivalence check (LEC)
- H1: Yosys synthesis
- H2: OpenROAD place-and-route
- H5: OpenSTA timing analysis
- H4: KLayout DRC + GDS
- H3: Netgen LVS
- H9: Static IR-drop analysis
- H10: Dynamic IR-drop analysis
- H6: DFT scan evidence lane
- H7: ESD review evidence lane
- H8: IO pad ring evidence lane

**Governance & Reporting**
- Readiness gate matrix (35 checks, all green on validated chips)
- Machine-readable evidence manifests with checksum integrity
- Sign-off domain matrix with waiver/risk/owner chain
- Tapeout package assembly and foundry handoff records
- Silicon feedback remediation panel (v1.15)

**Operator Console**
- Spec Intake & Architecture Kickoff surface
- EDA Run Closure Detail surface
- Downstream Decision Control Tower (evidence-ready vs. human decision split)
- Knowledge Asset Center
- Package Readiness panel
- Sign-off Action Queue
- Silicon Feedback panel (v1.17.0)
- Console Bootstrap Gate (v1.17.0)

**Package & Distribution**
- Three verified package variants: `solo_eval`, `team_project`, `enterprise_site`
- Package Build Registry with history preservation (v1.17.0)
- Machine-readable build index and release tracking
- IP-protected compiled distribution (no source exposure in customer packages)

### 📋 Active Release

| Version | Bundle ID | Release Date | Status |
|---------|-----------|--------------|--------|
| **v1.17.0** | `runtime-bundle-tw-20260529043609` | 2026-05-30 | ✅ **ACTIVE** |
| v1.6.0 | `runtime-bundle-tw-20260429140332` | 2026-04-29 | LEGACY |

---

## 🏁 Quick Start

### Step 1 — Choose Your Package Variant

| Variant | Who Is It For? |
|---------|---------------|
| `solo_eval` | Individual engineer evaluating ICAF on their machine |
| `team_project` | A small team running ICAF together on a shared project |
| `enterprise_site` | A full organization deploying ICAF with enterprise governance |

### Step 2 — Find the Active Release

Check [RELEASE_INDEX.md](./RELEASE_INDEX.md) for the current active bundle and its exact file path.

### Step 3 — Read Before You Extract

Each variant package contains pre-extraction docs:
- `README.md` — variant-specific overview
- `deployment/docs/*` — installation and operation guide

**Read these before extracting the package.** They tell you what environment you need and what to do first.

### Step 4 — Verify the Package

Run the verification script to confirm your download is intact:

```bash
scripts/verify_release_bundle.sh <bundle_id>
```

### Step 5 — Install and Run

Follow the instructions inside the variant's `deployment/docs/` to:
1. Install the runtime bundle
2. Run the healthcheck
3. Start your first governed chip run

---

## 📚 Learning Resources

| Document | What You Will Find |
|----------|--------------------|
| [RELEASE_INDEX.md](./RELEASE_INDEX.md) | All releases, bundle IDs, checksums, status |
| [PACKAGE_VARIANTS.md](./PACKAGE_VARIANTS.md) | Detailed comparison of the three package variants |
| [briefings/](./briefings/) | Customer reading pack — background and orientation |
| [docs/eda-toolchain-candidates-reference.md](./docs/eda-toolchain-candidates-reference.md) | Open-source EDA tool reference |
| [SECURITY.md](./SECURITY.md) | Security policy and responsible disclosure |
| [SUPPORT.md](./SUPPORT.md) | How to get help |

---

## 🔒 Release Integrity

Every release bundle includes:
- **Checksum files** — verify the package was not tampered with
- **Publish manifest** — records what is in the bundle and its provenance
- **Version pointers** — machine-readable semantic version mapping

Latest pointer: `releases/version-pointers/LATEST.json`
All pointers: `releases/version-pointers/`

---

## 📬 Need Help? / Post an Issue

Have you run into a problem while setting up your environment, running ICAF, or did you find a bug? Or maybe you just have an idea or suggestion? We want to hear from you!

**Please open an issue on our GitHub repository!** This is the fastest and best way to get help.

* 💡 **For You:** Check out [SUPPORT.md](./SUPPORT.md) for our easy-to-use issue template. **Remember to include your exact Operating System (OS) environment** (like macOS 14 Sonoma, Ubuntu 22.04, etc.), as many chip design tools behave differently on different systems!
* 🤖 **For Your Local AI Agent:** If you are using a local AI agent to run ICAF, your agent can read [SUPPORT.md](./SUPPORT.md) to learn how to search for answers automatically and report issues to us when things go wrong.

For other topics:
- Security issues: see [SECURITY.md](./SECURITY.md)
- License: see [LICENSE.md](./LICENSE.md)
