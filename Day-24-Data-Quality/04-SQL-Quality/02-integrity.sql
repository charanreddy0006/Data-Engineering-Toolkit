-- Orphan telemetry
SELECT COUNT(*) AS orphan_events
FROM vehicle_telemetry t
LEFT JOIN vehicle_master v
  ON v.vehicle_id = t.vehicle_id
WHERE v.vehicle_id IS NULL;

-- Invalid service state
SELECT COUNT(*) AS invalid_closed_orders
FROM service_order
WHERE service_status = 'CLOSED'
  AND service_end_time IS NULL;

-- Temporal integrity
SELECT COUNT(*) AS negative_duration
FROM service_order
WHERE service_end_time < service_start_time;

-- Retired vehicles producing new events
SELECT COUNT(*) AS retired_events
FROM vehicle_telemetry t
JOIN vehicle_master v USING (vehicle_id)
WHERE v.status = 'RETIRED'
  AND t.event_time > v.retirement_date;
