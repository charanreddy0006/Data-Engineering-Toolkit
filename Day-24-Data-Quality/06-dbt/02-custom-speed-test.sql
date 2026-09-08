-- Place under tests/ in a dbt project.
-- Rows returned by a test represent failures.

SELECT event_id, vehicle_id, speed_kmh
FROM {{ ref('fct_vehicle_telemetry') }}
WHERE speed_kmh < 0
   OR speed_kmh > 350
