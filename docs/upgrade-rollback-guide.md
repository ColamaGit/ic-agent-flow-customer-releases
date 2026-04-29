# Upgrade and Rollback Guide

1. 先驗證新 bundle（manifest/checksum/gate）。
2. 在維護窗口執行升級。
3. 若 preflight/smoke 失敗，立即回滾上一版。
4. 保留升級/回滾記錄以供審計。
