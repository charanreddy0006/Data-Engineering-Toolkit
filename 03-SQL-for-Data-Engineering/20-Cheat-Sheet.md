# SQL Cheat Sheet

## Create Database

```sql
CREATE DATABASE vehicle_sales;
```

## Create Table

```sql
CREATE TABLE Vehicles(...);
```

## Insert

```sql
INSERT INTO Vehicles VALUES(...);
```

## Select

```sql
SELECT * FROM Vehicles;
```

## Update

```sql
UPDATE Vehicles
SET Price=2000000
WHERE VehicleID=1;
```

## Delete

```sql
DELETE FROM Vehicles
WHERE VehicleID=1;
```

## Group By

```sql
GROUP BY Brand;
```

## Having

```sql
HAVING COUNT(*)>1;
```

## Join

```sql
INNER JOIN
LEFT JOIN
RIGHT JOIN
```

## View

```sql
CREATE VIEW
```

## Index

```sql
CREATE INDEX
```

## Trigger

```sql
CREATE TRIGGER
```

## Window Functions

```sql
ROW_NUMBER()

RANK()

DENSE_RANK()
```