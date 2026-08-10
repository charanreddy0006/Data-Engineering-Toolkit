-- Transactions and ACID
-- Data Engineering Toolkit - Day 06

CREATE TABLE vehicle_inventory (
    vehicle_id INTEGER PRIMARY KEY,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL
);

CREATE TABLE vehicle_sales (
    sale_id INTEGER PRIMARY KEY,
    vehicle_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    sale_amount DECIMAL(12, 2) NOT NULL
);

INSERT INTO vehicle_inventory
VALUES
(101, 'BMW', 'X5', 'AVAILABLE'),
(102, 'Audi', 'Q5', 'AVAILABLE'),
(103, 'Tesla', 'Model 3', 'AVAILABLE');

-- Start transaction
BEGIN;

INSERT INTO vehicle_sales
VALUES
(1001, 101, 501, 85000);

UPDATE vehicle_inventory
SET status = 'SOLD'
WHERE vehicle_id = 101;

-- Save the transaction
COMMIT;

-- Check the result
SELECT *
FROM vehicle_inventory;

SELECT *
FROM vehicle_sales;

-- Example of rollback
BEGIN;

UPDATE vehicle_inventory
SET status = 'SOLD'
WHERE vehicle_id = 102;

-- Cancel the change
ROLLBACK;

-- Verify that vehicle 102 remains AVAILABLE
SELECT *
FROM vehicle_inventory
WHERE vehicle_id = 102;

-- Savepoint example
BEGIN;

UPDATE vehicle_inventory
SET status = 'SOLD'
WHERE vehicle_id = 103;

SAVEPOINT vehicle_update;

UPDATE vehicle_inventory
SET status = 'INVALID'
WHERE vehicle_id = 103;

ROLLBACK TO vehicle_update;

COMMIT;

SELECT *
FROM vehicle_inventory;