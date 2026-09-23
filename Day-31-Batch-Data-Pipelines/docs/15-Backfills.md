# 15. Backfills

A backfill reprocesses historical data.

## Reasons
- corrected source data
- logic bug fix
- new business rule
- missing partition

## Safe flow

```text
Change
 ↓
Test Small Range
 ↓
Validate
 ↓
Expand Range
 ↓
Reconcile
 ↓
Publish
```

## Controls

- bounded date range
- versioned code
- idempotent writes
- audit trail
- isolated resources

## Automobile

Backfill August service analytics after correcting the revenue calculation.
