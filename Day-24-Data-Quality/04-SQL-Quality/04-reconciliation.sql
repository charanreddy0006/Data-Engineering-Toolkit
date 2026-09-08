WITH source_counts AS (
    SELECT DATE_TRUNC('hour', ingestion_time) AS hour, COUNT(*) AS source_count
    FROM source_telemetry
    GROUP BY 1
),
target_counts AS (
    SELECT DATE_TRUNC('hour', ingestion_time) AS hour, COUNT(*) AS target_count
    FROM vehicle_telemetry
    GROUP BY 1
)
SELECT
    COALESCE(s.hour, t.hour) AS hour,
    COALESCE(s.source_count, 0) AS source_count,
    COALESCE(t.target_count, 0) AS target_count,
    COALESCE(s.source_count, 0) - COALESCE(t.target_count, 0) AS difference
FROM source_counts s
FULL OUTER JOIN target_counts t ON s.hour = t.hour
ORDER BY hour;
