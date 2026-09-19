-- Example point-in-time retrieval pattern.
-- PostgreSQL syntax is used here.

WITH candidate_features AS (
    SELECT
        p.vehicle_id,
        p.prediction_time,
        f.event_time,
        f.fault_count_24h,
        ROW_NUMBER() OVER (
            PARTITION BY p.vehicle_id, p.prediction_time
            ORDER BY f.event_time DESC
        ) AS rn
    FROM prediction_events p
    JOIN vehicle_features f
      ON f.vehicle_id = p.vehicle_id
     AND f.event_time <= p.prediction_time
)
SELECT
    vehicle_id,
    prediction_time,
    fault_count_24h
FROM candidate_features
WHERE rn = 1;
