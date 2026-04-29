## 結論

我建議建立一個**獨立 customer-facing release repo**，名稱用：

```text
ic-agent-flow-customer-releases
```

這個 repo 的定位不是開發 repo，也不是 source repo，而是：

> **Customer Release Package Registry + Safe Activation Pack Repo**

## Build-to-Release Copy Contract (2026-04-29)

`ic-agent-flow` build pipeline 應固定輸出：

1. `distribution/customer-packages/<bundle_id>/`
   - `ic-agent-flow-solo-eval-<bundle_id>.tar.gz`
   - `ic-agent-flow-team-project-<bundle_id>.tar.gz`
   - `ic-agent-flow-enterprise-site-<bundle_id>.tar.gz`
   - per-variant manifest/checksum
2. `artifacts/customer-release-staging/<bundle_id>/`
   - `solo_eval/`, `team_project/`, `enterprise_site/`
   - `customer_release_staging_manifest.json`

`ic-agent-flow-customer-releases` repo 同步時，直接以 `artifacts/customer-release-staging/<bundle_id>/` 為來源；禁止人工跨多路徑拼接交付內容。

也就是讓 customer checkout 後，只看到可安裝 package、sidecar docs、manifest、SBOM、checksum、signature、activation guide、EDA binding template、secret setup guide、validation report；**不得看到 workspace、internal-dev、tests、internal PRD、closeout reasoning、prompt/context strategy、private validator source**。這點與 v1.6 的核心法則一致：`runtime_distribution_bundle` 是 customer-installable package，不是 source code distribution；repo truth、workspace truth、source code、internal governance know-how 都不得等同 customer package。

---

# 1. Repo name 建議

## 首選

```text
ic-agent-flow-customer-releases
```

理由：

1. **明確 customer-facing**
   一看就知道不是 main development repo。

2. **明確 release package repo**
   避免 customer 誤以為這是 source tree。

3. **支援三種 package variant**
   `solo_eval`、`team_project`、`enterprise_site` 可以自然放在同一 release registry 下。

4. **符合 v1.5 / v1.6 邊界**
   v1.5 已明確指出，有 signed package 不等於 customer-ready；只有能在 customer site 被啟動、治理、營運、升級、支援與稽核，才算 customer-ready。
   v1.6 則要求 customer 取得 controlled contract surface，而非完整 implementation surface。

## 可接受備選

```text
ic-agent-flow-release-hub
ic-agent-flow-distribution
icaf-customer-packages
ic-agent-flow-customer-packages
```

我不建議用：

```text
ic-agent-flow-checkout
ic-agent-flow-package
ic-agent-flow-runtime
```

原因是 `checkout` 容易和 git checkout / customer checkout / package extraction 混淆；`package` 太泛；`runtime` 容易讓人以為 repo 內含 runtime source。

---

# 2. Repo role 定義

這個 repo 應該只負責五件事：

| Repo responsibility       | 說明                                                   |
| ------------------------- | ---------------------------------------------------- |
| Release package discovery | customer 可以知道有哪些版本、哪些 package variant                |
| Safe download / checkout  | 提供 package artifact 或 GitHub Release asset link      |
| Trust verification        | checksum、signature、SBOM、provenance、inspection report |
| Activation guidance       | install、EDA binding、secret setup、profile selection   |
| Customer operation docs   | human / AI agent / site admin 操作文件                   |

它不負責：

| Not responsibility               | 原因                                                                  |
| -------------------------------- | ------------------------------------------------------------------- |
| 開發 source code                   | v1.6 已禁止 repo export / source disclosure by default                 |
| internal governance docs         | customer package 不應暴露 internal PRD / closeout / progress / findings |
| prompt / context strategy        | 屬 vendor proprietary secret                                         |
| private validator implementation | 屬 internal-only / proprietary                                       |
| customer data backflow           | v1.5 已 block direct customer data backflow                          |

---

# 3. 建議 repo structure

建議採用以下結構：

```text
ic-agent-flow-customer-releases/
  README.md
  RELEASE_INDEX.md
  PACKAGE_VARIANTS.md
  SECURITY.md
  SUPPORT.md
  LICENSE.md

  releases/
    v1.6.0/
      release_manifest.json
      release_notes.md
      compatibility_matrix.md
      checksums/
        CHECKSUMS.txt
        CHECKSUMS.sha256
      sbom/
        SBOM.spdx.json
      signatures/
        release_manifest.sig
        checksums.sig
      provenance/
        build_provenance.json
        binary_provenance_record.json

      solo_eval/
        ic-agent-flow-solo-eval-v1.6.0.tar.gz
        package_manifest.json
        customer_package_variant_manifest.json
        customer_visible_contract_manifest.json
        distribution_content_manifest.json
        source_exclusion_report.json
        vendor_ip_leak_scan_report.json
        package_inspection_report.json
        entitlement_manifest.json
        doc_manifest.json

      team_project/
        ic-agent-flow-team-project-v1.6.0.tar.gz
        package_manifest.json
        customer_package_variant_manifest.json
        customer_visible_contract_manifest.json
        distribution_content_manifest.json
        source_exclusion_report.json
        vendor_ip_leak_scan_report.json
        package_inspection_report.json
        entitlement_manifest.json
        doc_manifest.json

      enterprise_site/
        ic-agent-flow-enterprise-site-v1.6.0.tar.gz
        package_manifest.json
        customer_package_variant_manifest.json
        customer_visible_contract_manifest.json
        distribution_content_manifest.json
        source_exclusion_report.json
        vendor_ip_leak_scan_report.json
        package_inspection_report.json
        entitlement_manifest.json
        doc_manifest.json

  docs/
    getting-started.md
    package-selection-guide.md
    extract-and-install.md
    folder-structure.md
    customer-activation-flow.md
    security-and-secrets.md
    openai-backend-secret-setup.md
    eda-toolchain-binding-guide.md
    support-bundle-export-guide.md
    upgrade-rollback-guide.md
    audit-replay-guide.md
    troubleshooting.md
    ip-and-support-boundary.md

  profiles/
    solo_eval/
      runtime_profile.yaml
      site_policy_overlay.template.yaml
      eda_toolchain.template.yaml
      backend_secret_binding.template.yaml

    team_project/
      runtime_profile.yaml
      rbac.template.yaml
      site_policy_overlay.template.yaml
      eda_toolchain.template.yaml
      backend_secret_binding.template.yaml

    enterprise_site/
      runtime_profile.yaml
      rbac.enterprise.template.yaml
      approval_quorum.template.yaml
      site_policy_overlay.template.yaml
      eda_toolchain.template.yaml
      backend_secret_binding.vault.template.yaml
      backend_secret_binding.k8s-secret.template.yaml

  activation-packs/
    solo_eval/
      activation_manifest.json
      preflight_checklist.md
      smoke_scenario.md

    team_project/
      activation_manifest.json
      preflight_checklist.md
      rbac_activation_checklist.md
      smoke_scenario.md

    enterprise_site/
      activation_manifest.json
      preflight_checklist.md
      rbac_activation_checklist.md
      approval_quorum_checklist.md
      audit_readiness_checklist.md
      smoke_scenario.md

  schemas/
    public_contract/
      package_manifest.schema.json
      release_manifest.schema.json
      entitlement_manifest.schema.json
      deployment_profile.schema.json
      eda_toolchain_binding_manifest.schema.json
      backend_secret_binding.schema.json

    customer_runtime/
      site_activation_request.schema.json
      site_preflight_report.schema.json
      site_smoke_run_record.schema.json
      support_audit_bundle.schema.json

  trust/
    public_keys/
      release-signing-key.pub
    trust_root_manifest.json
    signature_verification.md

  validation/
    post-v1.6/
      solo_eval/
        validation_summary.md
        package_boundary_report.json
        site_preflight_report.json
        smoke_result.json
        qa_trust_report.json

      team_project/
        validation_summary.md
        package_boundary_report.json
        site_preflight_report.json
        smoke_result.json
        qa_trust_report.json

      enterprise_site/
        validation_plan.md
        readiness_boundary_note.md

  examples/
    site-config/
      eda_toolchain.example.yaml
      backend_secret_binding.example.yaml
      site_policy_overlay.example.yaml

  .github/
    workflows/
      verify-release-manifests.yml
      verify-checksums.yml
      verify-no-internal-paths.yml
      verify-doc-classification.yml
      verify-schema-validity.yml
```

---

# 4. Package variant 原則

你原文寫 `sole / team_project / enterprise`，我建議正式命名修正為：

```text
solo_eval
team_project
enterprise_site
```

因為 v1.5 已經把三種 customer operating mode 定義為：

| Mode              | 說明         | Governance level                    |
| ----------------- | ---------- | ----------------------------------- |
| `solo_eval`       | 單一工程師本機評估  | lightweight / non-production        |
| `team_project`    | 小型設計或驗證團隊  | RBAC + team scope                   |
| `enterprise_site` | 部門或組織級正式部署 | full RBAC + audit + approval quorum |

而且 `solo_eval` 成功不得宣稱 enterprise readiness。

三種 package 不應只是同一包加 flag。Post-v1.6 hardening 已明確判定 `solo_eval`、`team_project`、`enterprise_site` 應該產生不同 package artifact，因為三者在 profile、RBAC、surface、docs、secrets policy、support boundary、activation gate 上都不同。

建議 artifact 命名：

```text
ic-agent-flow-solo-eval-v1.6.0.tar.gz
ic-agent-flow-team-project-v1.6.0.tar.gz
ic-agent-flow-enterprise-site-v1.6.0.tar.gz
```

container-first 版本可用：

```text
ghcr.io/<org>/ic-agent-flow-runtime:v1.6.0-solo-eval
ghcr.io/<org>/ic-agent-flow-runtime:v1.6.0-team-project
ghcr.io/<org>/ic-agent-flow-runtime:v1.6.0-enterprise-site
```

---

# 5. GitHub Release vs repo file 的分工

我建議：

## Git repo 內放

```text
README
release index
manifest
schemas
docs
templates
activation packs
validation summaries
checksum / signature metadata
```

## GitHub Releases asset 放

```text
.tar.gz runtime packages
container image references
SBOM
signed checksums
large validation bundle
```

理由：package binary / tarball 不應長期塞在 git history 裡，否則 repo 會膨脹，也難以做撤銷、替換、權限控管。Git repo 是 release registry；GitHub Releases 是 binary distribution surface。

---

# 6. 每個 release 必須具備的 minimum files

每個 release version 至少要有：

```text
release_manifest.json
release_notes.md
compatibility_matrix.md
CHECKSUMS.txt
SBOM.spdx.json
release_manifest.sig
build_provenance.json
```

每個 package variant 至少要有：

```text
package_manifest.json
customer_package_variant_manifest.json
customer_visible_contract_manifest.json
distribution_content_manifest.json
source_exclusion_report.json
vendor_ip_leak_scan_report.json
package_inspection_report.json
entitlement_manifest.json
doc_manifest.json
```

這是因為 v1.6 要求 customer package 不能靠信心說「沒有 IP leakage」；必須由 `source_exclusion_report`、`vendor_ip_leak_scan_report`、`distribution_content_manifest`、`customer_visible_contract_manifest`、`package_inspection_report` 等證據共同支撐。

---

# 7. README 首頁建議骨架

```markdown
# ic-agent-flow Customer Releases

This repository provides customer-facing release packages for ic-agent-flow.

This is not the source repository.
This repository does not contain internal governance docs, source tree, private validator implementation, prompt/context strategy, or internal development assets.

## Package Variants

| Variant | Intended Use | Status |
|---|---|---|
| solo_eval | Single engineer local evaluation | non-production |
| team_project | Small design / verification team | team-governed |
| enterprise_site | Organization-scale deployment | enterprise-governed |

## Latest Release

See: releases/v1.6.0/

## Before Install

1. Select package variant.
2. Verify checksum and signature.
3. Read package contents.
4. Bind EDA toolchain.
5. Bind backend secret.
6. Run preflight.
7. Run smoke scenario.
8. Submit activation decision.

## Security Boundary

Secrets are never packaged.
Customer EDA license values are never packaged.
Support bundles are redacted.
Vendor IP and customer IP are both protected.
```

---

# 8. Approval verdict

**APPROVE WITH REQUIRED CHANGES**

我會批准建立此 repo，但要加以下硬性條件：

1. repo 名稱採用 `ic-agent-flow-customer-releases`。
2. 三種 package variant 必須分開：`solo_eval`、`team_project`、`enterprise_site`。
3. repo 不得成為 source distribution。
4. package artifacts 優先放 GitHub Releases，不直接塞進 git history。
5. 每個 release 必須有 README / install / folder structure / security / EDA binding / secret setup / support boundary 文件。
6. 每個 package 必須附 manifest、SBOM、checksum、signature、source exclusion report、vendor IP leak scan report。
7. `enterprise_site` 可以先放 `validation_plan.md` 與 `readiness_boundary_note.md`，不得因 solo/team proof 就宣稱 enterprise-ready。

---

# 9. 三個為什麼

1. **為什麼要另開 repo，而不是放在 main repo？**
   因為 main repo 是 development truth，customer release repo 是 controlled distribution surface。兩者混在一起會破壞 v1.6 的「release package is not source distribution」法則。

2. **為什麼要三種 package，而不是一個 package 加 profile？**
   因為 `solo_eval`、`team_project`、`enterprise_site` 的 RBAC、audit、secret policy、support boundary、activation gate 不同。若用同一包，很容易讓 solo success 被誤宣稱為 enterprise readiness。

3. **為什麼 repo 裡還要放很多 docs？**
   因為 v1.5 block manual-only bootstrap，不代表不需要 README；README / docs 的責任是讓 human 和 AI agent 正確理解 package、profile、trust checks、EDA binding、secret setup 與 activation flow，而不是讓 customer 靠手動猜測完成安裝。

---

## 4. Plan-to-Implementation Alignment Status (2026-04-29, UTC+8)

以下項目已完成落地（以實際 repo 結構為準）：

1. One-copy bundle 同步路徑已採用
   - source: `/Users/imac/Documents/Code/ic-agent-flow/artifacts/customer-release-staging/runtime-bundle-tw-20260429100301`
   - target: `/Users/imac/Documents/Code/ic-agent-flow-customer-releases/releases/runtime-bundle-tw-20260429100301`

2. Semantic version -> bundle pointer 已建立
   - `releases/version-pointers/v1.6.0.json`
   - `active_bundle_id = runtime-bundle-tw-20260429100301`
   - `active_bundle_path = releases/runtime-bundle-tw-20260429100301`

3. Release index 表已建立
   - `RELEASE_INDEX.md` 已定義固定欄位：
     - `version`
     - `bundle_id`
     - `release_date (UTC+8)`
     - `variants`
     - `checksum`
     - `manifest`
     - `status`

4. 最小 release gate 已建立並驗證 PASS
   - script: `scripts/verify_release_bundle.sh`
   - 驗證項目：
     - 三 variant package/tar/manifest/checksum
     - pre-extract docs（README + deployment/docs 核心文件）
     - `runtime/package_capabilities/runtime_environment_manifest.json`
     - denylist（`workspace/`、`tests/`、`.env`）
   - 實測結果：`[PASS] bundle verification ok: runtime-bundle-tw-20260429100301`

5. Repo hygiene 初步完成
   - `.gitignore` 已加入：`.DS_Store`, `Thumbs.db`, `*.swp`

## 5. Recommended Next Consolidation (P0)

1. `releases/v1.6.0/` 下現有舊版語意結構，建議改為只保留 metadata（pointer/notes），
   payload 以 `releases/runtime-bundle-tw-*` 為唯一真值，避免雙份 payload 漂移。
2. 在 CI 加入 `scripts/verify_release_bundle.sh <bundle_id>`，作為 merge gate。
3. 後續新 bundle 一律只新增一個 `runtime-bundle-tw-YYYYMMDDHHMMSS` 節點，並更新對應 version pointer。

## 6. Alignment Update — LATEST Pointer (2026-04-29, UTC+8)

為了讓自動化不需知道具體語意版號（例如 `v1.6.0`）即可解到當前有效 release payload，
對位規則新增：

1. `releases/version-pointers/LATEST.json` 為 machine entrypoint。
2. `LATEST.json` 內容至少包含：
   - `active_version`
   - `active_bundle_id`
   - `active_bundle_path`
   - `timezone`（固定 `Asia/Taipei`）
   - `updated_at`（UTC+8）
3. 每次發佈新 bundle 時，必須同步更新：
   - `releases/version-pointers/<version>.json`
   - `releases/version-pointers/LATEST.json`
   - `RELEASE_INDEX.md`
4. `releases/runtime-bundle-tw-*` 仍為唯一 payload 真值；pointer 僅作解參照入口，不得承載第二份 payload。
