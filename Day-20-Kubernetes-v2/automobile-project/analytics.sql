-- Example analytics questions for the vehicle telemetry platform.

-- Average speed by vehicle.
SELECT
    vehicle_id,
    AVG(speed_kph) AS average_speed_kph
FROM vehicle_telemetry
GROUP BY vehicle_id;

-- Average battery percentage by vehicle.
SELECT
    vehicle_id,
    AVG(battery_pct) AS average_battery_pct
FROM vehicle_telemetry
GROUP BY vehicle_id;

-- Potential temperature anomalies.
SELECT
    vehicle_id,
    timestamp,
    engine_temp_c
FROM vehicle_telemetry
WHERE engine_temp_c > 100;

-- Data-quality investigation.
SELECT
    event_id,
    vehicle_id
FROM vehicle_telemetry
WHERE speed_kph < 0
   OR battery_pct < 0
   OR battery_pct > 100;
