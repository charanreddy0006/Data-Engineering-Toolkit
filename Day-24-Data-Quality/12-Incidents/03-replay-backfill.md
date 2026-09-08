# Replay and Backfill

## Replay

Reprocess source events after a temporary failure or corrected producer logic.

## Backfill

Recompute a historical interval.

```text
2026-09-01 through 2026-09-03
```

## Idempotency

A replay should not create duplicates.

Use:

- stable event IDs
- deterministic upserts
- partition replacement
- deduplication

## Validate recovery

Check:

- row counts
- quality metrics
- business aggregates
- freshness
- reconciliation
- downstream outputs
