# Aggregate Tables

An aggregate table stores a higher grain than its source.

Raw:

```text
one row per telemetry event
```

Aggregate:

```text
one row per vehicle per day
```

Example:

```sql
CREATE TABLE vehicle_daily_metrics AS
SELECT
    vehicle_id,
    DATE(event_time) AS event_date,
    COUNT(*) AS event_count,
    AVG(speed_kph) AS avg_speed_kph,
    MAX(engine_temp_c) AS max_engine_temp_c
FROM telemetry_event
GROUP BY vehicle_id, DATE(event_time);
```

## Why?

A dashboard should not repeatedly scan billions of raw events when daily metrics are sufficient.

## Name the grain

Prefer:

```text
vehicle_daily_metrics
```

over:

```text
vehicle_metrics
```

because the latter is ambiguous.

## Refresh strategy

Choose explicitly:

- full rebuild;
- incremental;
- append-only;
- late-data correction.

## Automobile metrics

Common daily metrics:

- distance;
- trip count;
- charging energy;
- fault count;
- average battery SOC;
- harsh-braking count.
