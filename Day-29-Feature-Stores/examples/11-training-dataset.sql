-- Build a historical dataset for model training.
-- The feature timestamp must not exceed the label/prediction timestamp.

SELECT
    l.vehicle_id,
    l.prediction_time,
    l.will_need_service_7d,
    f.distance_km_30d,
    f.fault_count_24h,
    f.days_since_last_service,
    f.service_count_90d
FROM maintenance_labels l
JOIN vehicle_features f
  ON f.vehicle_id = l.vehicle_id
 AND f.feature_timestamp <= l.prediction_time;
