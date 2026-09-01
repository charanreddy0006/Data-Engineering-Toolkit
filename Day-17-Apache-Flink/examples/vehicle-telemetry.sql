-- Example Flink SQL definition.
-- Connector properties must be adjusted for the deployed environment.

CREATE TABLE vehicle_telemetry (
    vehicle_id STRING,
    event_time TIMESTAMP(3),
    speed DOUBLE,
    engine_temperature DOUBLE,
    fuel_level DOUBLE,

    WATERMARK FOR event_time AS
        event_time - INTERVAL '10' SECOND
) WITH (
    'connector' = 'kafka',
    'topic' = 'vehicle.telemetry',
    'properties.bootstrap.servers' = 'localhost:9092',
    'format' = 'json'
);

SELECT
    vehicle_id,
    COUNT(*) AS event_count,
    AVG(speed) AS average_speed,
    MAX(engine_temperature) AS max_temperature
FROM vehicle_telemetry
GROUP BY vehicle_id;
