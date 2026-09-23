# 35. Batch Pipeline Cheat Sheet

## Core

```text
Extract → Stage → Validate → Transform → Load
        → Reconcile → Publish → Monitor
```

## Loading

```text
Full        = everything
Incremental = new/changed
CDC         = captured changes
```

## Reliability

```text
Watermark
Checkpoint
Idempotency
Retry
Backfill
Reconciliation
```

## Performance

```text
Partition
Parallelize
Filter Early
Column Pruning
Compression
Compaction
```

## Automobile

```text
Sales       → Daily/Incremental
Service     → Incremental
Warranty    → Incremental
Telemetry   → Daily Aggregates
EV Charging → Daily Aggregates
```
