-- Missing identifiers
SELECT COUNT(*) FROM vehicle_telemetry WHERE vehicle_id IS NULL;

-- Speed
SELECT COUNT(*)
FROM vehicle_telemetry
WHERE speed_kmh NOT BETWEEN 0 AND 350;

-- GPS
SELECT COUNT(*)
FROM vehicle_telemetry
WHERE latitude NOT BETWEEN -90 AND 90
   OR longitude NOT BETWEEN -180 AND 180;

-- Orphan vehicles
SELECT COUNT(*)
FROM vehicle_telemetry t
LEFT JOIN vehicle_master v ON v.vehicle_id = t.vehicle_id
WHERE v.vehicle_id IS NULL;

-- Duplicate IDs
SELECT event_id, COUNT(*)
FROM vehicle_telemetry
GROUP BY event_id
HAVING COUNT(*) > 1;

-- Future events
SELECT COUNT(*)
FROM vehicle_telemetry
WHERE event_time > CURRENT_TIMESTAMP + INTERVAL '5 minutes';

-- Odometer decrease
WITH ordered AS (
    SELECT
        vehicle_id,
        event_time,
        odometer_km,
        LAG(odometer_km) OVER (
            PARTITION BY vehicle_id ORDER BY event_time
        ) AS previous_odometer
    FROM vehicle_telemetry
)
SELECT COUNT(*)
FROM ordered
WHERE previous_odometer IS NOT NULL
  AND odometer_km < previous_odometer;
