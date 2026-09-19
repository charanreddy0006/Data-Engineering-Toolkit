-- Basic feature data-quality checks.

-- Invalid battery values
SELECT COUNT(*) AS invalid_battery_rows
FROM vehicle_features
WHERE battery_soc_latest < 0
   OR battery_soc_latest > 100;

-- Negative distances
SELECT COUNT(*) AS invalid_distance_rows
FROM vehicle_features
WHERE distance_km_30d < 0;

-- Missing entity keys
SELECT COUNT(*) AS missing_vehicle_ids
FROM vehicle_features
WHERE vehicle_id IS NULL;

-- Duplicate vehicle + timestamp records
SELECT vehicle_id, feature_timestamp, COUNT(*) AS row_count
FROM vehicle_features
GROUP BY vehicle_id, feature_timestamp
HAVING COUNT(*) > 1;
