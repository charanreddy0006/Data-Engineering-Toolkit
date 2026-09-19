# Backfill Plan

## Trigger

A bug is discovered in `distance_km_30d`.

## Plan

```text
Fix logic
 ↓
Unit tests
 ↓
Run 7-day sample
 ↓
Compare old/new distributions
 ↓
Validate against source totals
 ↓
Backfill historical range
 ↓
Refresh affected training datasets
```

## Safety

- Keep the previous version available.
- Record the code/version used.
- Make the job idempotent.
- Reconcile counts and totals.
- Communicate affected downstream models.
