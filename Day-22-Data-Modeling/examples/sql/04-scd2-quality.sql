-- More than one current row.
SELECT vehicle_id, COUNT(*) AS current_rows
FROM dim_vehicle
WHERE is_current = TRUE
GROUP BY vehicle_id
HAVING COUNT(*) <> 1;

-- Invalid interval.
SELECT *
FROM dim_vehicle
WHERE valid_from >= valid_to;

-- Potential interval overlap.
SELECT a.vehicle_id, a.vehicle_key, b.vehicle_key
FROM dim_vehicle a
JOIN dim_vehicle b
  ON a.vehicle_id = b.vehicle_id
 AND a.vehicle_key <> b.vehicle_key
 AND a.valid_from < b.valid_to
 AND b.valid_from < a.valid_to;
