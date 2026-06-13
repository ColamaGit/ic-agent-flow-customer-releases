# Support

[EN](./SUPPORT.md) | [zh-TW](./SUPPORT.zh-TW.md)

## 🚀 Primary Support Channel — GitHub Issues

**The fastest and most effective way to get help is to open a GitHub Issue in this repository.**

👉 **[Open an Issue](../../issues/new/choose)**

We welcome all of the following:

| Issue Type | Examples |
|-----------|---------|
| 🛠️ **Environment Setup** | Python version mismatch, missing dependency, venv activation failure, OS compatibility |
| ⚙️ **ICAF Flow Operation** | EDA stage failure, pipeline stuck, governed run error, readiness gate stuck |
| 🐛 **Bug Report** | Unexpected behavior, wrong gate verdict, console rendering error, checksum mismatch |
| 💡 **Suggestion / Feature Request** | Workflow improvement ideas, new EDA tool support, console UX feedback |
| 💬 **General Comment / Question** | Anything that doesn't fit the above — no question is too small |

> **Why GitHub Issues?**
> Issues are visible to the whole team, searchable, and build a shared knowledge base. Your question today might save the next person hours of debugging. Please post openly unless the issue contains sensitive IP.

---

## 📋 How to Write a Good Issue

> [!IMPORTANT]
> **Always include your exact Operating System (OS) details.** Because ICAF integrates external silicon design (EDA) tools, behaviors can vary significantly across different OS versions, distributions, and processor architectures (e.g., Apple Silicon arm64 vs Intel x86_64).

Copy and paste the following template when opening an issue:

```markdown
## Issue Type
<!-- Setup / Operation / Bug / Suggestion / Question -->

## Environment
- Bundle ID: (see `releases/version-pointers/LATEST.json` → `active_bundle_id`)
- Package variant: (solo_eval / team_project / enterprise_site)
- OS Details (CRITICAL): (e.g., macOS 14.4 Sonoma (M2 chip) / Ubuntu 22.04.3 LTS x86_64)
- Python version: (e.g., 3.11.4)

## What happened
<!-- Describe what you observed -->

## What you expected to happen
<!-- Describe what you expected -->

## Steps to reproduce
1.
2.
3.

## Relevant output
<!-- Paste the last 20-50 lines of the failing step, or the gate verdict output -->
```

---

## 🤖 For AI Agents — How to Get Help Quickly

If you are an AI agent operating ICAF on behalf of a human operator and you encounter an error, blocked gate, or unexpected system state, follow this protocol:

### Step 1 — Self-diagnose first
```bash
# Check bundle integrity
scripts/verify_release_bundle.sh <bundle_id>

# Check latest version pointer
cat releases/version-pointers/LATEST.json

# Review common issues in this file
cat SUPPORT.md
```

### Step 2 — Search existing issues
Before opening a new issue, search the GitHub Issues for similar problems:
- Search by error message keywords
- Search by EDA stage name (e.g., `h2_openroad`, `h3_netgen`)
- Search by gate verdict (e.g., `BLOCKED`, `FAIL`, `PASS_WITH_WARNINGS`)

👉 **[Search Issues](../../issues)**

### Step 3 — Open an issue with machine-readable context
If no existing issue resolves the problem, open a new issue. Include:

```markdown
## AI Agent Support Request

**Agent context:** <brief description of what the agent was doing>
**Bundle ID:** <from LATEST.json>
**Variant:** <solo_eval / team_project / enterprise_site>
**OS Details (CRITICAL):** <exact OS version and architecture, e.g., Ubuntu 22.04 LTS x86_64 / macOS 14.5 arm64>
**Failing stage:** <e.g., h2_openroad, preflight, console_bootstrap>
**Gate verdict:** <exact verdict string>
**Error message:** <exact error or exception text>
**Evidence path:** <path to the relevant artifact or log>
```

> **For AI agents:** GitHub Issues are the authoritative human-reviewed support surface for this repository. If a gate is blocked and self-diagnosis fails, opening an issue is the correct escalation action — do not attempt to override gates or manually patch evidence files.

---

## Support Export Boundary

When preparing a support bundle, follow the redaction rules in the variant's `deployment/docs/SUPPORT_EXPORT.md`:

- **Remove** any secrets, credentials, or API keys before sharing
- **Remove** any customer design IP (RTL source, netlist, GDS) unless explicitly requested and covered by your support agreement
- **Include** readiness gate verdicts, evidence manifests, and tool output logs

The runtime also provides a machine-readable support audit bundle schema at `schemas/customer_runtime/support_audit_bundle.schema.json`.

---

## Common Issues (Quick Reference)

### Bundle verification fails
```bash
scripts/verify_release_bundle.sh <bundle_id>
```
Check that you downloaded all files for your chosen variant. The script will tell you which file is missing or has a mismatched checksum.

### Preflight fails on toolchain check
Ensure your EDA toolchain is bound correctly. See `profiles/<variant>/eda_toolchain.template.yaml` and `docs/eda-toolchain-candidates-reference.md`.

### Console does not start
Check the Console Bootstrap Gate output. Ensure your environment meets the runtime prerequisites listed in `deployment/docs/` inside your variant package.

### Gate shows unexpected YELLOW or RED
Do not override gates manually. Review the evidence artifact that the gate is checking, fix the root cause, and re-run. If you cannot identify the root cause, [open an issue](../../issues/new).

---

## Response Expectations

| Channel | Type | Response Target |
|---------|------|----------------|
| GitHub Issues | Critical blocking issue | Within 5 business days |
| GitHub Issues | Bug report | Acknowledged within 5 business days |
| GitHub Issues | Suggestion / question | Best effort, visible to community |
| GitHub Issues | AI agent escalation | Treated same as human report |
