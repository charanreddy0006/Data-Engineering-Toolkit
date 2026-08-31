USE automobile_dw;

CREATE TABLE IF NOT EXISTS vehicle_events (
    vehicle_id STRING,
    event_time TIMESTAMP,
    speed DOUBLE,
    engine_temperature DOUBLE,
    fuel_level DOUBLE
)
PARTITIONED BY (event_date DATE)
STORED AS PARQUET;

SELECT vehicle_id,
       COUNT(*) AS events,
       ROUND(AVG(speed),2) AS average_speed,
       MAX(engine_temperature) AS max_temperature
FROM vehicle_events
WHERE event_date >= '2026-08-30'
GROUP BY vehicle_id;
