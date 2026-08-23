# 22 — Batch Data Lake Pipeline

## Architecture

```text
Source Database
      |
      v
Scheduled Extract
      |
      v
Raw
      |
      v
Validate
      |
      v
Transform
      |
      v
Curated
```

## Typical Schedule

```text
01:00 Extract
01:15 Validate
01:25 Transform
01:40 Publish
01:45 Quality Checks
```

## Requirements

- Incremental extraction
- Retry handling
- Idempotent writes
- Data validation
- Logging
- Metrics
- Alerting
- Backfill support

## Incremental Example

```sql
SELECT *
FROM vehicle_service
WHERE updated_at > :last_successful_timestamp;
```

A checkpoint can store the last successful extraction position.

## Backfill

A good batch pipeline should support processing a selected historical date
without damaging current data.
