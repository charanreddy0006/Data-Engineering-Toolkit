SELECT
c.CustomerName,
v.Brand,
v.Model,
o.OrderDate

FROM Orders o

INNER JOIN Customers c

ON o.CustomerID=c.CustomerID

INNER JOIN Vehicles v

ON o.VehicleID=v.VehicleID;