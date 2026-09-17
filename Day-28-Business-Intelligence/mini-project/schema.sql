CREATE TABLE dim_date (
    date_key INTEGER PRIMARY KEY,
    calendar_date DATE NOT NULL,
    year INTEGER NOT NULL,
    month INTEGER NOT NULL,
    month_name VARCHAR(20) NOT NULL
);

CREATE TABLE dim_vehicle (
    vehicle_key INTEGER PRIMARY KEY,
    vehicle_id VARCHAR(40) UNIQUE NOT NULL,
    model VARCHAR(100) NOT NULL,
    fuel_type VARCHAR(20)
);

CREATE TABLE dim_dealer (
    dealer_key INTEGER PRIMARY KEY,
    dealer_id VARCHAR(40) UNIQUE NOT NULL,
    dealer_name VARCHAR(150) NOT NULL,
    region VARCHAR(80)
);

CREATE TABLE fact_service (
    service_key BIGINT PRIMARY KEY,
    date_key INTEGER NOT NULL,
    vehicle_key INTEGER NOT NULL,
    dealer_key INTEGER NOT NULL,
    labor_amount NUMERIC(14,2) DEFAULT 0,
    parts_amount NUMERIC(14,2) DEFAULT 0,
    service_amount NUMERIC(14,2) GENERATED ALWAYS AS (labor_amount + parts_amount) STORED
);
