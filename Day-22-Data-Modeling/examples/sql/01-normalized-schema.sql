CREATE TABLE manufacturer (
    manufacturer_id INTEGER PRIMARY KEY,
    manufacturer_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE vehicle_model (
    model_id INTEGER PRIMARY KEY,
    manufacturer_id INTEGER NOT NULL REFERENCES manufacturer(manufacturer_id),
    model_name VARCHAR(100) NOT NULL,
    powertrain_type VARCHAR(20) NOT NULL,
    UNIQUE (manufacturer_id, model_name)
);

CREATE TABLE vehicle (
    vehicle_id INTEGER PRIMARY KEY,
    vin VARCHAR(17) NOT NULL UNIQUE,
    model_id INTEGER NOT NULL REFERENCES vehicle_model(model_id),
    production_date DATE NOT NULL
);

CREATE TABLE trip (
    trip_id BIGINT PRIMARY KEY,
    vehicle_id INTEGER NOT NULL REFERENCES vehicle(vehicle_id),
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    distance_km NUMERIC(12,3) NOT NULL CHECK (distance_km >= 0),
    CHECK (end_time >= start_time)
);
