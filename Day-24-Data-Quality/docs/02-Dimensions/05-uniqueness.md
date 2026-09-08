# Uniqueness

Uniqueness checks whether identifiers that should represent one record are duplicated.

```sql
SELECT event_id, COUNT(*)
FROM vehicle_telemetry
GROUP BY event_id
HAVING COUNT(*) > 1;
```

## Duplicate types

- Exact duplicate
- Key duplicate
- Semantic duplicate

## Common causes

- retries
- message redelivery
- replay
- CDC behavior
- source bugs
- join multiplication

## Deterministic deduplication

```sql
ROW_NUMBER() OVER (
  PARTITION BY event_id
  ORDER BY ingestion_time DESC
)
```

Keep a clearly defined winner. Do not delete duplicates without understanding the business key and whether repeated events can be legitimate.
