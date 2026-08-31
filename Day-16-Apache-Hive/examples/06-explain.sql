EXPLAIN
SELECT
    vehicle_id,
    AVG(speed) AS average_speed
FROM vehicle_events
WHERE event_date = '2026-08-31'
GROUP BY vehicle_id;
