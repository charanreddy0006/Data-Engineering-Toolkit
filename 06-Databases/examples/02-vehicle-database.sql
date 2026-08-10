-- Vehicle Sales Database
-- Data Engineering Toolkit - Day 06

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    email VARCHAR(150) UNIQUE
);

CREATE TABLE vehicles (
    vehicle_id INTEGER PRIMARY KEY,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INTEGER,
    price DECIMAL(12, 2)
);

CREATE TABLE sales (
    sale_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    vehicle_id INTEGER NOT NULL,
    sale_date DATE NOT NULL,
    sale_amount DECIMAL(12, 2) NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (vehicle_id)
        REFERENCES vehicles(vehicle_id)
);

INSERT INTO customers
VALUES
(1, 'Rahul', 'Rajkot', 'rahul@example.com'),
(2, 'Priya', 'Surat', 'priya@example.com'),
(3, 'Arjun', 'Ahmedabad', 'arjun@example.com');

INSERT INTO vehicles
VALUES
(101, 'BMW', 'X5', 2025, 85000),
(102, 'Audi', 'Q5', 2024, 62000),
(103, 'Tesla', 'Model 3', 2025, 45000);

INSERT INTO sales
VALUES
(1001, 1, 101, '2026-01-15', 85000),
(1002, 2, 103, '2026-02-10', 45000),
(1003, 3, 102, '2026-03-05', 62000);

-- View sales with customer and vehicle details
SELECT
    s.sale_id,
    c.customer_name,
    v.brand,
    v.model,
    s.sale_date,
    s.sale_amount
FROM sales s
JOIN customers c
    ON s.customer_id = c.customer_id
JOIN vehicles v
    ON s.vehicle_id = v.vehicle_id;

-- Total sales revenue
SELECT SUM(sale_amount) AS total_revenue
FROM sales;

-- Sales by vehicle brand
SELECT
    v.brand,
    SUM(s.sale_amount) AS revenue
FROM sales s
JOIN vehicles v
    ON s.vehicle_id = v.vehicle_id
GROUP BY v.brand;

-- Customer purchase history
SELECT
    c.customer_name,
    v.brand,
    v.model,
    s.sale_date
FROM sales s
JOIN customers c
    ON s.customer_id = c.customer_id
JOIN vehicles v
    ON s.vehicle_id = v.vehicle_id
ORDER BY s.sale_date;