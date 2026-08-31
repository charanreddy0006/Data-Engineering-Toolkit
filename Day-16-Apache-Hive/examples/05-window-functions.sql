SELECT
    vehicle_id,
    event_time,
    speed,
    AVG(speed) OVER (
        PARTITION BY vehicle_id
    ) AS vehicle_average_speed,
    ROW_NUMBER() OVER (
        PARTITION BY vehicle_id
        ORDER BY event_time
    ) AS event_number
FROM vehicle_events;
