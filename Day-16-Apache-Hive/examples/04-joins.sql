SELECT
    e.vehicle_id,
    m.model,
    m.manufacturer,
    AVG(e.speed) AS average_speed
FROM vehicle_events e
JOIN vehicle_master m
  ON e.vehicle_id = m.vehicle_id
GROUP BY e.vehicle_id, m.model, m.manufacturer;
