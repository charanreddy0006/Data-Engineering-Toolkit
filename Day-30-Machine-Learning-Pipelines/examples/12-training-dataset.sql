SELECT
    l.vehicle_id,
    l.prediction_time,
    l.service_required_within_7d,
    f.fault_count_24h,
    f.fault_count_7d,
    f.distance_km_30d,
    f.service_count_90d
FROM maintenance_labels l
JOIN vehicle_features f
  ON f.vehicle_id = l.vehicle_id
 AND f.feature_timestamp <= l.prediction_time;
