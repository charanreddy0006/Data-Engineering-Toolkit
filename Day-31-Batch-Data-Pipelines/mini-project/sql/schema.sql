CREATE TABLE service_orders (
    service_order_id VARCHAR(50) PRIMARY KEY,
    vehicle_id VARCHAR(50) NOT NULL,
    dealer_id VARCHAR(50) NOT NULL,
    service_date DATE NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    labor_amount NUMERIC(14,2) NOT NULL,
    parts_amount NUMERIC(14,2) NOT NULL
);

CREATE TABLE daily_service_revenue (
    service_date DATE NOT NULL,
    dealer_id VARCHAR(50) NOT NULL,
    service_orders INTEGER NOT NULL,
    service_revenue NUMERIC(16,2) NOT NULL,
    PRIMARY KEY (service_date, dealer_id)
);
