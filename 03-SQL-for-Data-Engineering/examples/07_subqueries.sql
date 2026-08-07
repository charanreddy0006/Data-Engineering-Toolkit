-- Comparison

SELECT *
FROM Vehicles
WHERE Price > 2000000;

-- LIKE

SELECT *
FROM Customers
WHERE CustomerName LIKE 'R%';

-- BETWEEN

SELECT *
FROM Vehicles
WHERE Price BETWEEN 1500000 AND 3000000;

-- IN

SELECT *
FROM Vehicles
WHERE Brand IN ('Tesla','BMW');