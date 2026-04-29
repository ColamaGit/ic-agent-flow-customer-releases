# OpenAI / Backend Secret Setup

1. Configure secrets on customer site only.
2. Provide secret reference, not secret value, to runtime.
3. Verify logs/support bundles do not contain secret values.
4. `airgap_local` profile must not enable remote backend routing.
