# Activation Flow Summary

1. Select bundle and variant
2. Verify manifest/checksum
3. Bind EDA toolchain and backend secret
4. Run preflight
5. Run smoke scenario
6. Produce activation decision (`PASS` / `PASS_WITH_WARNINGS` / `BLOCKED`)

Fail-closed principle applies when integrity, preflight, or claim-evidence alignment fails.
