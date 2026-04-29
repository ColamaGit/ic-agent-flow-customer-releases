# Repository Guidelines

## Project Structure & Module Organization
This repository is a customer-release registry, not a source-code workspace. At present it contains planning documentation (for example, `ic-agent-flow-customer-releases repo plan.md`) and will evolve into a release-oriented layout.

Use this target structure when adding content:
- `releases/<version>/`: release manifests, checksums, signatures, SBOM, and per-variant package metadata.
- `docs/`: install, activation, security, and operations guides.
- `profiles/`: deployment/profile templates (`solo_eval`, `team_project`, `enterprise_site`).
- `schemas/`: public contract and runtime schema definitions.
- `.github/workflows/`: validation checks for manifests, schema, and boundary rules.

## Build, Test, and Development Commands
There is no build system yet. Use lightweight verification commands while bootstrapping:
- `ls -la`: quick repository sanity check.
- `rg --files`: list tracked project files quickly.
- `git status`: review pending changes before commit.
- `markdownlint AGENTS.md` (if installed): validate Markdown style.

As workflows are added, expose canonical commands via `Makefile` or `package.json` scripts (for example `make verify` or `npm run verify`).

## Coding Style & Naming Conventions
- Prefer Markdown and JSON for repository artifacts.
- Use 2-space indentation for JSON/YAML; keep Markdown concise and sectioned.
- Use lowercase kebab-case for files/directories (`release-manifest.json`, `source-exclusion-report.json`).
- Keep variant names canonical: `solo_eval`, `team_project`, `enterprise_site`.

## Testing Guidelines
Treat validation as contract testing:
- Verify checksum/signature metadata consistency per release.
- Validate JSON artifacts against schemas before publishing.
- Ensure no internal-only content is included in customer-facing release paths.

Name validation outputs clearly, e.g. `validation/<version>/<variant>/validation-summary.md`.

## Commit & Pull Request Guidelines
This repository has no commit history yet; adopt Conventional Commits now:
- `docs: add v1.6.0 release index`
- `chore: add schema validation workflow`

PRs should include:
- Clear scope and affected paths.
- Linked issue or release ticket.
- Evidence of verification (command list/output summary).
- Notes on customer-facing impact and any security/trust artifacts updated.

## Security & Release Boundary Rules
Do not commit source code, internal governance docs, secrets, or private validator logic. Customer releases must expose only installable packages, public manifests, trust metadata, and operational guidance.
