# Failure Recovery

## Possible failures

- source unavailable
- schema mismatch
- quality failure
- transformation error
- target failure
- reconciliation mismatch

## Flow

```text
Detect
 ↓
Classify
 ↓
Retry transient issues
 ↓
Fix permanent issue
 ↓
Rerun safely
 ↓
Reconcile
 ↓
Publish
```

Do not mark a batch successful merely because the final task stopped with exit code zero; validate business output too.
