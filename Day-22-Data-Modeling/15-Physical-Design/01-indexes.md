# Indexes

Indexes help databases locate rows efficiently.

Example:

```sql
CREATE INDEX idx_trip_vehicle_time
ON trip(vehicle_id, start_time);
```

Useful query:

```sql
SELECT *
FROM trip
WHERE vehicle_id = 1001
  AND start_time >= CURRENT_DATE - INTERVAL '30 days';
```

## Composite index order

These are not equivalent:

```text
(vehicle_id, start_time)
(start_time, vehicle_id)
```

Choose based on actual filter and ordering patterns.

## Cost

Indexes add:

- storage;
- write overhead;
- maintenance.

Do not index every column.

## Analytical platforms

Columnar systems may rely more on:

- partition pruning;
- clustering;
- sorting;
- statistics;
- data skipping.

Physical design is engine-specific.
