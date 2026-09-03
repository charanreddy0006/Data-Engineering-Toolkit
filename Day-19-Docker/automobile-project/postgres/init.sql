CREATE TABLE IF NOT EXISTS vehicle_telemetry (
    telemetry_id BIGSERIAL PRIMARY KEY,
    vehicle_id VARCHAR(30) NOT NULL,
    event_time TIMESTAMPTZ NOT NULL,
    speed_kmh NUMERIC(8,2) NOT NULL
        CHECK (speed_kmh >= 0),
    battery_soc NUMERIC(5,2)
        CHECK (battery_soc BETWEEN 0 AND 100),
    engine_temp_c NUMERIC(6,2),
    latitude NUMERIC(9,6),
    longitude NUMERIC(9,6),
    loaded_at TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_vehicle_time
ON vehicle_telemetry(vehicle_id, event_time);
