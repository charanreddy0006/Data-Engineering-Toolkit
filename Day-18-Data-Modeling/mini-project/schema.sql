CREATE TABLE dim_date (
    date_key INTEGER PRIMARY KEY,
    calendar_date DATE NOT NULL UNIQUE,
    month_number INTEGER NOT NULL,
    year_number INTEGER NOT NULL
);

CREATE TABLE dim_vehicle (
    vehicle_key BIGSERIAL PRIMARY KEY,
    vehicle_id VARCHAR(50) NOT NULL,
    model_name VARCHAR(100) NOT NULL,
    manufacturer VARCHAR(100) NOT NULL,
    fuel_type VARCHAR(30) NOT NULL
);

CREATE TABLE dim_customer (
    customer_key BIGSERIAL PRIMARY KEY,
    customer_id VARCHAR(50) NOT NULL,
    customer_segment VARCHAR(50) NOT NULL,
    city VARCHAR(100)
);

CREATE TABLE dim_dealer (
    dealer_key BIGSERIAL PRIMARY KEY,
    dealer_id VARCHAR(50) NOT NULL,
    dealer_name VARCHAR(150) NOT NULL,
    region VARCHAR(100)
);

CREATE TABLE fact_sales (
    sale_id BIGSERIAL PRIMARY KEY,
    date_key INTEGER NOT NULL REFERENCES dim_date(date_key),
    vehicle_key BIGINT NOT NULL REFERENCES dim_vehicle(vehicle_key),
    customer_key BIGINT NOT NULL REFERENCES dim_customer(customer_key),
    dealer_key BIGINT NOT NULL REFERENCES dim_dealer(dealer_key),
    invoice_number VARCHAR(50) NOT NULL UNIQUE,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    net_amount NUMERIC(18,2) NOT NULL CHECK (net_amount >= 0)
);
