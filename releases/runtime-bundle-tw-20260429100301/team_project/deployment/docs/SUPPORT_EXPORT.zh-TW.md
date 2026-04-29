# Support Export

Support bundle export must stay bounded and redacted.

## Minimum Rules

- include only incident-scoped artifacts
- exclude secrets (`.env`, key values)
- exclude internal-only source/governance assets
- keep export reason and time window

## Checkpoints

1. Confirm export scope is explicit.
2. Confirm redaction policy is attached.
3. Confirm denylist exclusions are enforced.
4. Confirm audit record is emitted.
