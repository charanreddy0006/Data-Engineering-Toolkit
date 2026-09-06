CREATE TABLE vehicle_model (
    model_id BIGINT PRIMARY KEY,
    manufacturer VARCHAR(100) NOT NULL,
    model_name VARCHAR(100) NOT NULL,
    powertrain_type VARCHAR(20) NOT NULL
        CHECK (powertrain_type IN ('ICE','HEV','PHEV','BEV')),
    UNIQUE (manufacturer, model_name)
);

CREATE TABLE customer (
    customer_id BIGINT PRIMARY KEY,
    customer_name VARCHAR(200) NOT NULL
);

CREATE TABLE vehicle (
    vehicle_id BIGINT PRIMARY KEY,
    vin VARCHAR(17) NOT NULL UNIQUE,
    model_id BIGINT NOT NULL REFERENCES vehicle_model(model_id),
    model_year SMALLINT NOT NULL CHECK (model_year BETWEEN 1980 AND 2100)
);

CREATE TABLE dealer (
    dealer_id BIGINT PRIMARY KEY,
    dealer_name VARCHAR(200) NOT NULL,
    city VARCHAR(100) NOT NULL
);

CREATE TABLE service_order (
    service_order_id BIGINT PRIMARY KEY,
    vehicle_id BIGINT NOT NULL REFERENCES vehicle(vehicle_id),
    dealer_id BIGINT NOT NULL REFERENCES dealer(dealer_id),
    opened_at TIMESTAMP NOT NULL,
    closed_at TIMESTAMP,
    status VARCHAR(30) NOT NULL,
    CHECK (closed_at IS NULL OR closed_at >= opened_at)
);

CREATE TABLE part (
    part_id BIGINT PRIMARY KEY,
    part_number VARCHAR(50) NOT NULL UNIQUE,
    part_name VARCHAR(200) NOT NULL
);

CREATE TABLE service_order_part (
    service_order_id BIGINT NOT NULL REFERENCES service_order(service_order_id),
    line_number INTEGER NOT NULL CHECK (line_number > 0),
    part_id BIGINT NOT NULL REFERENCES part(part_id),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC(12,2) NOT NULL CHECK (unit_price >= 0),
    PRIMARY KEY (service_order_id, line_number)
);
