CREATE TABLE vehicle_features_daily (
    vehicle_id VARCHAR(50) NOT NULL,
    feature_date DATE NOT NULL,
    distance_km_30d NUMERIC(12,2) NOT NULL,
    fault_count_24h INTEGER NOT NULL,
    harsh_braking_count_1h INTEGER NOT NULL,
    service_count_90d INTEGER NOT NULL,
    battery_soc_latest NUMERIC(5,2),
    PRIMARY KEY (vehicle_id, feature_date)
);
