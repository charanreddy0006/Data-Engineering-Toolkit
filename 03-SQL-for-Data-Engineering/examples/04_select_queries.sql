-- Display All Vehicles

SELECT *
FROM Vehicles;

-- Electric Vehicles

SELECT *
FROM Vehicles
WHERE FuelType='Electric';

-- Vehicles Above ₹20 Lakhs

SELECT Brand,Model,Price
FROM Vehicles
WHERE Price>2000000;

-- Sort by Price

SELECT *
FROM Vehicles
ORDER BY Price DESC;