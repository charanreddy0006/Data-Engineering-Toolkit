-- Most Expensive Vehicle

SELECT *

FROM Vehicles

WHERE Price =

(
    SELECT MAX(Price)

    FROM Vehicles
);

-- Customers Who Purchased Vehicles

SELECT *

FROM Customers

WHERE CustomerID IN

(
    SELECT CustomerID

    FROM Orders
);