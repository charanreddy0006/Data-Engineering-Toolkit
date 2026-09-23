# Backfill Plan

## Example

A service revenue bug affected August.

```text
Freeze Affected Output
 ↓
Version Corrected Logic
 ↓
Process August Partitions
 ↓
Quality Checks
 ↓
Finance Reconciliation
 ↓
Replace Affected Output
 ↓
Refresh Downstream Models / BI
```

## Controls

- bounded range
- idempotent writes
- versioned transformation
- audit record
- downstream impact review
