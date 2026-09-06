-- Unsafe pattern:
-- trip-level distance can repeat once per telemetry row.

-- Safe pattern:
-- reduce telemetry to trip grain first.

WITH telemetry_by_trip AS (
    SELECT
        trip_id,
        MAX(odometer_km) - MIN(odometer_km) AS telemetry_distance_km
    FROM telemetry_event
    GROUP BY trip_id
)
SELECT
    t.trip_id,
    t.distance_km,
    x.telemetry_distance_km
FROM trip t
LEFT JOIN telemetry_by_trip x
  ON x.trip_id = t.trip_id;
