# Query Patterns Drive Physical Design

## Current vehicle lookup

```sql
SELECT *
FROM dim_vehicle
WHERE vehicle_id = 'V100'
  AND is_current = TRUE;
```

Potential optimization:

```text
current-row index/filter
```

## Telemetry by vehicle and day

```sql
SELECT *
FROM fact_telemetry_event
WHERE event_time >= TIMESTAMP '2026-09-06'
  AND event_time < TIMESTAMP '2026-09-07'
  AND vehicle_key = 100;
```

Potential optimization:

```text
time partition + vehicle clustering/order
```

## Fleet aggregation

```sql
SELECT DATE(event_time), COUNT(*)
FROM fact_telemetry_event
GROUP BY DATE(event_time);
```

The best optimization depends on the engine.

## Rule

Physical design should be justified by:

```text
query pattern
+
data volume
+
engine behavior
+
measured performance
```
