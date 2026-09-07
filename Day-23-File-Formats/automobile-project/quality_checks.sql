-- Duplicate telemetry IDs.
SELECT event_id, COUNT(*)
FROM fact_telemetry_event
GROUP BY event_id
HAVING COUNT(*) > 1;

-- Invalid SOC.
SELECT *
FROM fact_telemetry_event
WHERE battery_soc < 0
   OR battery_soc > 100;

-- Invalid trip measures.
SELECT *
FROM fact_trip
WHERE distance_km < 0
   OR energy_kwh < 0
   OR duration_minutes < 0;

-- More than one current dimension version.
SELECT vehicle_id, COUNT(*)
FROM dim_vehicle
WHERE is_current = TRUE
GROUP BY vehicle_id
HAVING COUNT(*) > 1;

-- Invalid history intervals.
SELECT *
FROM dim_vehicle
WHERE valid_from >= valid_to;

-- Overlapping SCD intervals.
SELECT a.vehicle_id, a.vehicle_key, b.vehicle_key
FROM dim_vehicle a
JOIN dim_vehicle b
  ON a.vehicle_id = b.vehicle_id
 AND a.vehicle_key <> b.vehicle_key
 AND a.valid_from < b.valid_to
 AND b.valid_from < a.valid_to;
