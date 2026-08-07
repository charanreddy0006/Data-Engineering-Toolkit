-- Good Practice

SELECT

Brand,

Price

FROM Vehicles

WHERE FuelType='Electric';

-- Use Index

CREATE INDEX idx_fuel

ON Vehicles(FuelType);