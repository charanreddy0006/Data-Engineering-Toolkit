-- Freshness
SELECT CURRENT_TIMESTAMP - MAX(ingestion_time) AS freshness_age
FROM vehicle_telemetry;

-- Hourly volume
SELECT
    DATE_TRUNC('hour', ingestion_time) AS hour,
    COUNT(*) AS rows_received
FROM vehicle_telemetry
WHERE ingestion_time >= CURRENT_TIMESTAMP - INTERVAL '24 hours'
GROUP BY 1
ORDER BY 1;
