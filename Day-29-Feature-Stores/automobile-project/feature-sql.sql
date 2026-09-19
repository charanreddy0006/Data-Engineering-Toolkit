-- Reference feature transformations.

WITH daily_usage AS (
    SELECT
        vehicle_id,
        DATE(event_time) AS feature_date,
        SUM(CASE WHEN event_type = 'trip' THEN distance_km ELSE 0 END) AS distance_km_1d,
        SUM(CASE WHEN harsh_braking THEN 1 ELSE 0 END) AS harsh_braking_1d,
        SUM(CASE WHEN fault_code <> '' THEN 1 ELSE 0 END) AS fault_events_1d
    FROM vehicle_events
    GROUP BY vehicle_id, DATE(event_time)
)
SELECT
    vehicle_id,
    feature_date,
    SUM(distance_km_1d) OVER (
        PARTITION BY vehicle_id
        ORDER BY feature_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS distance_km_7d,
    SUM(fault_events_1d) OVER (
        PARTITION BY vehicle_id
        ORDER BY feature_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS fault_count_7d,
    SUM(harsh_braking_1d) OVER (
        PARTITION BY vehicle_id
        ORDER BY feature_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS harsh_braking_count_7d
FROM daily_usage;
