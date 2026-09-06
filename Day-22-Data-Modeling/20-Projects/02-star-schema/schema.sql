CREATE TABLE dim_date (
    date_key INTEGER PRIMARY KEY,
    calendar_date DATE NOT NULL UNIQUE,
    year INTEGER NOT NULL,
    month INTEGER NOT NULL,
    month_name VARCHAR(20) NOT NULL
);

CREATE TABLE dim_vehicle (
    vehicle_key BIGINT PRIMARY KEY,
    vehicle_id VARCHAR(50) NOT NULL,
    vin VARCHAR(17) NOT NULL,
    model_name VARCHAR(100) NOT NULL,
    powertrain_type VARCHAR(20) NOT NULL,
    valid_from DATE NOT NULL,
    valid_to DATE NOT NULL,
    is_current BOOLEAN NOT NULL,
    CHECK (valid_from < valid_to)
);

CREATE TABLE fact_trip (
    trip_key BIGINT PRIMARY KEY,
    trip_id VARCHAR(100) NOT NULL UNIQUE,
    date_key INTEGER NOT NULL REFERENCES dim_date(date_key),
    vehicle_key BIGINT NOT NULL REFERENCES dim_vehicle(vehicle_key),
    distance_km NUMERIC(12,3) NOT NULL CHECK (distance_km >= 0),
    energy_kwh NUMERIC(12,3) CHECK (energy_kwh >= 0),
    duration_minutes NUMERIC(12,2) CHECK (duration_minutes >= 0)
);
