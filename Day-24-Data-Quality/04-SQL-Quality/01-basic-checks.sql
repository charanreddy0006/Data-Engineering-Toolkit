-- Completeness
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN vehicle_id IS NULL THEN 1 ELSE 0 END) AS missing_vehicle_id,
    SUM(CASE WHEN event_time IS NULL THEN 1 ELSE 0 END) AS missing_event_time
FROM vehicle_telemetry;

-- Uniqueness
SELECT event_id, COUNT(*) AS duplicate_count
FROM vehicle_telemetry
GROUP BY event_id
HAVING COUNT(*) > 1;

-- Range
SELECT COUNT(*) AS invalid_speed
FROM vehicle_telemetry
WHERE speed_kmh IS NOT NULL
  AND (speed_kmh < 0 OR speed_kmh > 350);

SELECT COUNT(*) AS invalid_soc
FROM vehicle_telemetry
WHERE battery_soc IS NOT NULL
  AND (battery_soc < 0 OR battery_soc > 100);

-- Future timestamps
SELECT COUNT(*) AS future_events
FROM vehicle_telemetry
WHERE event_time > CURRENT_TIMESTAMP + INTERVAL '5 minutes';
