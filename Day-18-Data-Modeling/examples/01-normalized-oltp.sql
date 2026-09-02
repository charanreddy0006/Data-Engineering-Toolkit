-- Automobile OLTP model
-- PostgreSQL-oriented example.

CREATE TABLE customer (
    customer_id BIGSERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(30),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE manufacturer (
    manufacturer_id BIGSERIAL PRIMARY KEY,
    manufacturer_name VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE vehicle_model (
    model_id BIGSERIAL PRIMARY KEY,
    manufacturer_id BIGINT NOT NULL
        REFERENCES manufacturer(manufacturer_id),
    model_name VARCHAR(100) NOT NULL,
    fuel_type VARCHAR(30) NOT NULL
);

CREATE TABLE dealer (
    dealer_id BIGSERIAL PRIMARY KEY,
    dealer_name VARCHAR(150) NOT NULL,
    city VARCHAR(100),
    state VARCHAR(100),
    region VARCHAR(100)
);

CREATE TABLE vehicle (
    vehicle_id BIGSERIAL PRIMARY KEY,
    customer_id BIGINT REFERENCES customer(customer_id),
    model_id BIGINT NOT NULL REFERENCES vehicle_model(model_id),
    vin VARCHAR(17) NOT NULL UNIQUE,
    manufacture_year SMALLINT,
    CHECK (manufacture_year IS NULL OR manufacture_year >= 1900)
);

CREATE TABLE sale (
    sale_id BIGSERIAL PRIMARY KEY,
    vehicle_id BIGINT NOT NULL REFERENCES vehicle(vehicle_id),
    dealer_id BIGINT NOT NULL REFERENCES dealer(dealer_id),
    sale_date DATE NOT NULL,
    invoice_number VARCHAR(50) NOT NULL UNIQUE,
    gross_amount NUMERIC(18,2) NOT NULL CHECK (gross_amount >= 0),
    discount_amount NUMERIC(18,2) NOT NULL DEFAULT 0
        CHECK (discount_amount >= 0)
);

-- Normalized design keeps manufacturer and dealer attributes in their
-- respective entities rather than repeating them in every sale.
