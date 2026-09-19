CREATE TABLE vehicle_daily_features AS
SELECT
    vehicle_id,
    DATE(event_time) AS feature_date,
    SUM(distance_km) AS distance_km_1d,
    AVG(avg_speed_kmh) AS avg_speed_1d,
    SUM(harsh_braking_events) AS harsh_braking_count_1d,
    SUM(fault_events) AS fault_count_1d
FROM vehicle_trip_events
GROUP BY vehicle_id, DATE(event_time);

CREATE TABLE vehicle_30d_features AS
SELECT
    vehicle_id,
    feature_date,
    SUM(distance_km_1d) OVER (
        PARTITION BY vehicle_id
        ORDER BY feature_date
        ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
    ) AS distance_km_30d,
    SUM(fault_count_1d) OVER (
        PARTITION BY vehicle_id
        ORDER BY feature_date
        ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
    ) AS fault_count_30d
FROM vehicle_daily_features;
