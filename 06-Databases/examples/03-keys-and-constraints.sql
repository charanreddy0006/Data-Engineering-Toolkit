-- Keys and Constraints
-- Data Engineering Toolkit - Day 06

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    age INTEGER CHECK (age >= 18)
);

CREATE TABLE vehicles (
    vehicle_id INTEGER PRIMARY KEY,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    price DECIMAL(12, 2) CHECK (price > 0)
);

CREATE TABLE sales (
    sale_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    vehicle_id INTEGER NOT NULL,
    sale_amount DECIMAL(12, 2) CHECK (sale_amount > 0),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (vehicle_id)
        REFERENCES vehicles(vehicle_id)
);

INSERT INTO customers
VALUES
(1, 'Rahul', 'rahul@example.com', 25),
(2, 'Priya', 'priya@example.com', 28);

INSERT INTO vehicles
VALUES
(101, 'BMW', 'X5', 85000),
(102, 'Tesla', 'Model 3', 45000);

INSERT INTO sales
VALUES
(1001, 1, 101, 85000),
(1002, 2, 102, 45000);

-- Primary key prevents duplicate IDs
-- The following statement should fail:

-- INSERT INTO vehicles
-- VALUES (101, 'Audi', 'Q5', 62000);

-- Foreign key prevents invalid customer IDs
-- The following statement should fail:

-- INSERT INTO sales
-- VALUES (1003, 999, 101, 85000);

-- CHECK constraint prevents invalid prices
-- The following statement should fail:

-- INSERT INTO vehicles
-- VALUES (103, 'BMW', 'X3', -1000);

-- UNIQUE constraint prevents duplicate emails
-- The following statement should fail:

-- INSERT INTO customers
-- VALUES (3, 'Arjun', 'rahul@example.com', 24);

SELECT *
FROM customers;

SELECT *
FROM vehicles;

SELECT *
FROM sales;