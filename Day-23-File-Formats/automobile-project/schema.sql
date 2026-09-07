-- PostgreSQL-style analytical schema for the practice project.

CREATE TABLE dim_vehicle (
    vehicle_key BIGINT PRIMARY KEY,
    vehicle_id VARCHAR(50) NOT NULL,
    vin VARCHAR(17) NOT NULL,
    model_name VARCHAR(100) NOT NULL,
    powertrain_type VARCHAR(20) NOT NULL,
    valid_from TIMESTAMP NOT NULL,
    valid_to TIMESTAMP NOT NULL,
    is_current BOOLEAN NOT NULL,
    CHECK (valid_from < valid_to)
);

CREATE TABLE fact_telemetry_event (
    event_id VARCHAR(100) PRIMARY KEY,
    vehicle_key BIGINT REFERENCES dim_vehicle(vehicle_key),
    event_time TIMESTAMP NOT NULL,
    ingestion_time TIMESTAMP NOT NULL,
    speed_kph NUMERIC(10,2) CHECK (speed_kph >= 0),
    battery_soc NUMERIC(5,2) CHECK (battery_soc BETWEEN 0 AND 100),
    odometer_km NUMERIC(14,3) CHECK (odometer_km >= 0)
);

CREATE TABLE fact_trip (
    trip_key BIGINT PRIMARY KEY,
    trip_id VARCHAR(100) NOT NULL UNIQUE,
    vehicle_key BIGINT NOT NULL REFERENCES dim_vehicle(vehicle_key),
    trip_date DATE NOT NULL,
    distance_km NUMERIC(14,3) NOT NULL CHECK (distance_km >= 0),
    energy_kwh NUMERIC(14,3) CHECK (energy_kwh >= 0),
    duration_minutes NUMERIC(12,2) CHECK (duration_minutes >= 0)
);

CREATE TABLE vehicle_daily_snapshot (
    vehicle_key BIGINT NOT NULL REFERENCES dim_vehicle(vehicle_key),
    snapshot_date DATE NOT NULL,
    daily_distance_km NUMERIC(14,3),
    end_battery_soc NUMERIC(5,2),
    fault_count INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY (vehicle_key, snapshot_date)
);
