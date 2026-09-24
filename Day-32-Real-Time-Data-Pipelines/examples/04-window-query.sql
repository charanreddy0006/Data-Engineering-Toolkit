SELECT vehicle_id, COUNT(*) AS fault_count
FROM vehicle_fault_events
WHERE event_time >= :window_start
  AND event_time < :window_end
GROUP BY vehicle_id;
