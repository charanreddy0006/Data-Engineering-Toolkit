# Grain-First Thinking

Grain is the exact meaning of one row.

Examples:

```text
one row per vehicle
one row per trip
one row per telemetry event
one row per vehicle-day
one row per service-order line
```

## Fan-out example

One vehicle has:

```text
10 trips
100 telemetry events
3 service orders
```

A direct three-way join can create many combinations.

The intermediate result is not automatically "10 trips" or "3 services."

## Safe strategy

Aggregate each child to the target grain first.

```sql
WITH trip_day AS (
    SELECT vehicle_id, DATE(start_time) AS event_date,
           COUNT(*) AS trip_count
    FROM trip
    GROUP BY vehicle_id, DATE(start_time)
),
service_day AS (
    SELECT vehicle_id, DATE(opened_at) AS event_date,
           COUNT(*) AS service_count
    FROM service_order
    GROUP BY vehicle_id, DATE(opened_at)
)
SELECT t.vehicle_id, t.event_date, t.trip_count,
       COALESCE(s.service_count, 0) AS service_count
FROM trip_day t
LEFT JOIN service_day s
  ON s.vehicle_id = t.vehicle_id
 AND s.event_date = t.event_date;
```

## Grain statement

Use:

> Each row in `<table>` represents `<business object/event at a precise level>`.

Example:

> Each row in `fact_trip` represents one completed vehicle trip.

## Grain checklist

- Can two rows represent the same event?
- Are measures at the same level?
- Does a join preserve the intended row meaning?
- Are there multiple child records?
- Can the same business key appear across history?

## Interview insight

State the grain before discussing fact columns. It demonstrates modeling understanding rather
than vocabulary memorization.
