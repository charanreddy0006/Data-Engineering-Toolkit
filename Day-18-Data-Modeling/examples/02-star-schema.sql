-- Analytical star schema for automobile sales.

CREATE TABLE dim_date (
    date_key INTEGER PRIMARY KEY,
    calendar_date DATE NOT NULL UNIQUE,
    day_number SMALLINT NOT NULL,
    month_number SMALLINT NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    quarter_number SMALLINT NOT NULL,
    year_number SMALLINT NOT NULL,
    fiscal_year SMALLINT,
    is_weekend BOOLEAN NOT NULL
);

CREATE TABLE dim_vehicle (
    vehicle_key BIGSERIAL PRIMARY KEY,
    vehicle_id VARCHAR(50) NOT NULL,
    vin VARCHAR(17),
    model_name VARCHAR(100),
    manufacturer VARCHAR(150),
    fuel_type VARCHAR(30),
    segment VARCHAR(50),
    valid_from DATE NOT NULL,
    valid_to DATE,
    current_flag BOOLEAN NOT NULL
);

CREATE TABLE dim_customer (
    customer_key BIGSERIAL PRIMARY KEY,
    customer_id VARCHAR(50) NOT NULL,
    customer_segment VARCHAR(50),
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
    date_key INTEGER NOT NULL REFERENCES dim_date(date_key),
    vehicle_key BIGINT NOT NULL REFERENCES dim_vehicle(vehicle_key),
    customer_key BIGINT NOT NULL REFERENCES dim_customer(customer_key),
    dealer_key BIGINT NOT NULL REFERENCES dim_dealer(dealer_key),
    invoice_number VARCHAR(50) NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    gross_amount NUMERIC(18,2) NOT NULL CHECK (gross_amount >= 0),
    discount_amount NUMERIC(18,2) NOT NULL CHECK (discount_amount >= 0),
    net_amount NUMERIC(18,2) NOT NULL CHECK (net_amount >= 0)
);

-- Grain:
-- One row represents one completed vehicle sale transaction.
