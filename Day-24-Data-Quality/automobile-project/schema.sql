CREATE TABLE vehicle_master (
    vehicle_id TEXT PRIMARY KEY,
    vin TEXT UNIQUE NOT NULL,
    model_year INT NOT NULL,
    powertrain_type TEXT NOT NULL,
    status TEXT NOT NULL,
    dealer_id TEXT NOT NULL
);

CREATE TABLE vehicle_telemetry (
    event_id TEXT PRIMARY KEY,
    vehicle_id TEXT NOT NULL,
    event_time TIMESTAMP NOT NULL,
    ingestion_time TIMESTAMP NOT NULL,
    speed_kmh NUMERIC NOT NULL,
    battery_soc NUMERIC,
    odometer_km NUMERIC NOT NULL,
    latitude NUMERIC,
    longitude NUMERIC
);

CREATE TABLE quality_result (
    run_id TEXT NOT NULL,
    rule_id TEXT NOT NULL,
    dataset TEXT NOT NULL,
    total_rows BIGINT NOT NULL,
    failed_rows BIGINT NOT NULL,
    pass_rate NUMERIC(8,4) NOT NULL,
    severity TEXT NOT NULL,
    status TEXT NOT NULL,
    checked_at TIMESTAMP NOT NULL,
    PRIMARY KEY (run_id, rule_id)
);
