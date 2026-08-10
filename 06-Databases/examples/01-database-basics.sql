-- Database Basics
-- Data Engineering Toolkit - Day 06

CREATE TABLE vehicles (
    vehicle_id INTEGER PRIMARY KEY,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    manufacturing_year INTEGER,
    price DECIMAL(12, 2),
    is_electric BOOLEAN
);

INSERT INTO vehicles
    (vehicle_id, brand, model, manufacturing_year, price, is_electric)
VALUES
    (101, 'BMW', 'X5', 2025, 85000.00, FALSE),
    (102, 'Audi', 'Q5', 2024, 62000.00, FALSE),
    (103, 'Tesla', 'Model 3', 2025, 45000.00, TRUE),
    (104, 'Hyundai', 'Ioniq 5', 2025, 52000.00, TRUE),
    (105, 'Toyota', 'Camry', 2024, 32000.00, FALSE);

-- View all vehicles
SELECT *
FROM vehicles;

-- Select specific columns
SELECT brand, model, price
FROM vehicles;

-- Filter vehicles
SELECT *
FROM vehicles
WHERE is_electric = TRUE;

-- Vehicles above a specific price
SELECT *
FROM vehicles
WHERE price > 50000;

-- Sort vehicles by price
SELECT *
FROM vehicles
ORDER BY price DESC;

-- Count vehicles
SELECT COUNT(*) AS total_vehicles
FROM vehicles;

-- Average vehicle price
SELECT AVG(price) AS average_price
FROM vehicles;

-- Group vehicles by brand
SELECT brand, COUNT(*) AS vehicle_count
FROM vehicles
GROUP BY brand;

-- Update a vehicle
UPDATE vehicles
SET price = 47000
WHERE vehicle_id = 103;

-- Delete a vehicle
DELETE FROM vehicles
WHERE vehicle_id = 105;

-- Check final data
SELECT *
FROM vehicles;