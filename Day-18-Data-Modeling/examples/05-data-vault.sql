-- Simplified Data Vault structures.

CREATE TABLE hub_vehicle (
    vehicle_hk VARCHAR(64) PRIMARY KEY,
    vehicle_id VARCHAR(100) NOT NULL,
    load_datetime TIMESTAMPTZ NOT NULL,
    record_source VARCHAR(100) NOT NULL
);

CREATE TABLE hub_customer (
    customer_hk VARCHAR(64) PRIMARY KEY,
    customer_id VARCHAR(100) NOT NULL,
    load_datetime TIMESTAMPTZ NOT NULL,
    record_source VARCHAR(100) NOT NULL
);

CREATE TABLE link_vehicle_customer (
    link_hk VARCHAR(64) PRIMARY KEY,
    vehicle_hk VARCHAR(64) NOT NULL REFERENCES hub_vehicle(vehicle_hk),
    customer_hk VARCHAR(64) NOT NULL REFERENCES hub_customer(customer_hk),
    load_datetime TIMESTAMPTZ NOT NULL,
    record_source VARCHAR(100) NOT NULL
);

CREATE TABLE sat_vehicle (
    vehicle_hk VARCHAR(64) NOT NULL REFERENCES hub_vehicle(vehicle_hk),
    load_datetime TIMESTAMPTZ NOT NULL,
    hash_diff VARCHAR(64) NOT NULL,
    model_name VARCHAR(100),
    fuel_type VARCHAR(30),
    color VARCHAR(50),
    record_source VARCHAR(100) NOT NULL,
    PRIMARY KEY (vehicle_hk, load_datetime)
);

-- Hub = identity
-- Link = relationship
-- Satellite = descriptive history
