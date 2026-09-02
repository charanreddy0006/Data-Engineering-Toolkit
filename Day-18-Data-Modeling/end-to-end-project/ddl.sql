-- Core warehouse DDL.

CREATE TABLE dim_date (
    date_key INTEGER PRIMARY KEY,
    calendar_date DATE NOT NULL UNIQUE,
    month_number SMALLINT NOT NULL,
    year_number SMALLINT NOT NULL,
    quarter_number SMALLINT NOT NULL
);

CREATE TABLE dim_vehicle (
    vehicle_key BIGSERIAL PRIMARY KEY,
    vehicle_id VARCHAR(50) NOT NULL,
    vin VARCHAR(17),
    model_name VARCHAR(100),
    manufacturer VARCHAR(100),
    fuel_type VARCHAR(30),
    owner_customer_id VARCHAR(50),
    valid_from DATE NOT NULL,
    valid_to DATE,
    current_flag BOOLEAN NOT NULL
);

CREATE TABLE dim_customer (
    customer_key BIGSERIAL PRIMARY KEY,
    customer_id VARCHAR(50) NOT NULL,
    segment VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    valid_from DATE NOT NULL,
    valid_to DATE,
    current_flag BOOLEAN NOT NULL
);

CREATE TABLE dim_dealer (
    dealer_key BIGSERIAL PRIMARY KEY,
    dealer_id VARCHAR(50) NOT NULL,
    dealer_name VARCHAR(150),
    city VARCHAR(100),
    state VARCHAR(100),
    region VARCHAR(100)
);

CREATE TABLE fact_sales (
    sale_id BIGSERIAL PRIMARY KEY,
    date_key INTEGER REFERENCES dim_date(date_key),
    vehicle_key BIGINT REFERENCES dim_vehicle(vehicle_key),
    customer_key BIGINT REFERENCES dim_customer(customer_key),
    dealer_key BIGINT REFERENCES dim_dealer(dealer_key),
    invoice_number VARCHAR(50) NOT NULL,
    quantity INTEGER NOT NULL,
    net_amount NUMERIC(18,2) NOT NULL
);

CREATE TABLE fact_telemetry (
    event_id VARCHAR(100) PRIMARY KEY,
    event_date DATE NOT NULL,
    vehicle_key BIGINT NOT NULL REFERENCES dim_vehicle(vehicle_key),
    event_time TIMESTAMPTZ NOT NULL,
    ingest_time TIMESTAMPTZ NOT NULL,
    event_type VARCHAR(50) NOT NULL,
    speed_kmh NUMERIC(8,2),
    battery_level NUMERIC(5,2),
    engine_temperature_c NUMERIC(7,2)
);

CREATE TABLE fact_service (
    service_order_id VARCHAR(100) PRIMARY KEY,
    service_date_key INTEGER REFERENCES dim_date(date_key),
    vehicle_key BIGINT REFERENCES dim_vehicle(vehicle_key),
    dealer_key BIGINT REFERENCES dim_dealer(dealer_key),
    service_type VARCHAR(100),
    labor_cost NUMERIC(18,2) DEFAULT 0,
    parts_cost NUMERIC(18,2) DEFAULT 0,
    total_cost NUMERIC(18,2) NOT NULL
);
