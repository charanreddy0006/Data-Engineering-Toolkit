# Idempotency and Deduplication

Distributed systems can deliver the same message more than once.

A stable `event_id` allows downstream processing to recognize duplicates.

Example:

```sql
SELECT *
FROM (
    SELECT
        e.*,
        ROW_NUMBER() OVER (
            PARTITION BY event_id
            ORDER BY ingestion_time DESC
        ) AS rn
    FROM raw_events e
) x
WHERE rn = 1;
```

## Why not deduplicate only by timestamp?

This:

```text
vehicle_id + event_time
```

may collapse legitimate events occurring at the same timestamp.

A producer-defined event identity is stronger when available.

## Automobile example

A vehicle gateway retries a message after a network timeout.

The platform must not count the same fault or charging event twice.

## Design requirements

- stable event identity;
- duplicate policy;
- replay behavior;
- late-data policy;
- auditability.
