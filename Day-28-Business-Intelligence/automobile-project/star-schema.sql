CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    calendar_date DATE NOT NULL,
    year INT NOT NULL,
    quarter INT NOT NULL,
    month INT NOT NULL,
    month_name VARCHAR(20) NOT NULL
);

CREATE TABLE dim_vehicle (
    vehicle_key BIGINT PRIMARY KEY,
    vehicle_id VARCHAR(50) UNIQUE NOT NULL,
    model VARCHAR(100) NOT NULL,
    model_year INT,
    fuel_type VARCHAR(30),
    battery_capacity_kwh NUMERIC(8,2)
);

CREATE TABLE dim_dealer (
    dealer_key BIGINT PRIMARY KEY,
    dealer_id VARCHAR(50) UNIQUE NOT NULL,
    dealer_name VARCHAR(150) NOT NULL,
    region VARCHAR(80)
);

CREATE TABLE fact_service (
    service_key BIGINT PRIMARY KEY,
    date_key INT NOT NULL,
    vehicle_key BIGINT NOT NULL,
    dealer_key BIGINT NOT NULL,
    labor_amount NUMERIC(14,2) NOT NULL,
    parts_amount NUMERIC(14,2) NOT NULL,
    warranty_amount NUMERIC(14,2) DEFAULT 0
);

CREATE TABLE fact_trip (
    trip_key BIGINT PRIMARY KEY,
    date_key INT NOT NULL,
    vehicle_key BIGINT NOT NULL,
    distance_km NUMERIC(12,2) NOT NULL,
    energy_kwh NUMERIC(12,3),
    duration_min INT
);

CREATE TABLE fact_warranty (
    claim_key BIGINT PRIMARY KEY,
    date_key INT NOT NULL,
    vehicle_key BIGINT NOT NULL,
    dealer_key BIGINT,
    component VARCHAR(120),
    claim_amount NUMERIC(14,2),
    approved BOOLEAN
);
