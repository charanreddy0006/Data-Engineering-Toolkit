# Clustering, Sorting, and Statistics

Physical optimization differs across engines.

## Clustering/sorting

Place related values closer together physically.

Telemetry access might often filter by:

```text
event_date
vehicle_id
```

## Statistics

Optimizers use data-distribution statistics to choose query plans.

Stale statistics can lead to poor plans.

## PostgreSQL example

```sql
EXPLAIN
SELECT COUNT(*)
FROM trip
WHERE vehicle_id = 1001;
```

For deeper diagnosis:

```sql
EXPLAIN (ANALYZE, BUFFERS)
SELECT COUNT(*)
FROM trip
WHERE vehicle_id = 1001;
```

## Modeling connection

Physical design should follow real query patterns, data volume, and measured performance.
