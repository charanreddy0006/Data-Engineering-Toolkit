SELECT
    window_start,
    window_end,
    vehicle_id,
    COUNT(*) AS event_count,
    ROUND(AVG(speed), 2) AS average_speed,
    MAX(speed) AS maximum_speed,
    MAX(engine_temperature) AS maximum_temperature
FROM TABLE(
    TUMBLE(
        TABLE vehicle_telemetry,
        DESCRIPTOR(event_time),
        INTERVAL '5' MINUTE
    )
)
GROUP BY
    window_start,
    window_end,
    vehicle_id;
