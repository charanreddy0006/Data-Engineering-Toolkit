SELECT
FuelType,
COUNT(*) AS TotalVehicles

FROM Vehicles

GROUP BY FuelType;

SELECT
Brand,
AVG(Price)

FROM Vehicles

GROUP BY Brand;