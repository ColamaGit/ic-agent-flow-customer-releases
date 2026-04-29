# Audit Replay Guide

- 保留 bundle id、variant、run_id、timestamp、manifest/checksum 記錄。
- 重放時必須使用同一 bundle 與相同 profile。
- 差異判定以 gate/verdict/claim-boundary 為主，path/timestamp 可 normalize。
