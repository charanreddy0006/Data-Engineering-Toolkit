-- 1. Average speed and battery SOC

SELECT
    vehicle_id,
    ROUND(AVG(speed_kmh), 2) AS avg_speed_kmh,
    ROUND(AVG(battery_soc), 2) AS avg_battery_soc
FROM vehicle_telemetry
GROUP BY vehicle_id
ORDER BY vehicle_id;


-- 2. High-speed events

SELECT
    vehicle_id,
    event_time,
    speed_kmh
FROM vehicle_telemetry
WHERE speed_kmh > 80
ORDER BY speed_kmh DESC;


-- 3. Maximum engine temperature

SELECT
    vehicle_id,
    MAX(engine_temp_c) AS max_engine_temp_c
FROM vehicle_telemetry
GROUP BY vehicle_id
ORDER BY max_engine_temp_c DESC;


-- 4. Lowest battery SOC

SELECT
    vehicle_id,
    MIN(battery_soc) AS minimum_battery_soc
FROM vehicle_telemetry
GROUP BY vehicle_id
ORDER BY minimum_battery_soc;


-- 5. Event count

SELECT
    vehicle_id,
    COUNT(*) AS event_count
FROM vehicle_telemetry
GROUP BY vehicle_id
ORDER BY event_count DESC;
