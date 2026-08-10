# Tables, Rows, and Columns

## 1. Introduction

Relational databases organize structured data into tables.

A table consists mainly of:

- Columns
- Rows
- Values

Example:

```text
vehicles

vehicle_id | brand | model | year
-----------|-------|-------|-----
101        | BMW   | X5    | 2025
102        | Audi  | Q5    | 2024
103        | Tesla | Model 3 | 2025
```

---

## 2. Table

A table represents a particular type of information.

Examples:

```text
customers
vehicles
sales
employees
service_records
```

A database can contain many related tables.

```text
Vehicle Database
      |
      +-- customers
      +-- vehicles
      +-- sales
      +-- service_records
```

---

## 3. Rows

A row represents one record.

For example:

```text
101 | BMW | X5 | 2025
```

represents one vehicle.

Another row:

```text
102 | Audi | Q5 | 2024
```

represents another vehicle.

Therefore:

```text
1 Row = 1 Record
```

in a typical relational table.

---

## 4. Columns

A column represents one attribute of the data.

Example:

```text
vehicle_id
brand
model
year
```

Each column normally has a defined data type.

```text
vehicle_id → INTEGER
brand      → VARCHAR
model      → VARCHAR
year       → INTEGER
```

---

## 5. Values

A value is the actual piece of information stored at the intersection of a row and column.

```text
vehicle_id | brand
-----------|------
101        | BMW
```

Here:

```text
101 → value
BMW → value
```

---

## 6. Creating a Table

Example:

```sql
CREATE TABLE vehicles (
    vehicle_id INTEGER,
    brand VARCHAR(50),
    model VARCHAR(50),
    year INTEGER
);
```

Insert data:

```sql
INSERT INTO vehicles
VALUES
(101, 'BMW', 'X5', 2025),
(102, 'Audi', 'Q5', 2024),
(103, 'Tesla', 'Model 3', 2025);
```

Retrieve data:

```sql
SELECT *
FROM vehicles;
```

---

## 7. Data Types

Common relational database types include:

```text
INTEGER
DECIMAL
VARCHAR
TEXT
DATE
TIMESTAMP
BOOLEAN
```

Example:

```sql
CREATE TABLE vehicles (
    vehicle_id INTEGER,
    price DECIMAL(12,2),
    brand VARCHAR(50),
    manufacturing_date DATE,
    electric BOOLEAN
);
```

Choosing appropriate data types improves storage efficiency and data integrity.

---

## 8. NULL Values

`NULL` represents missing or unknown information.

Example:

```text
vehicle_id | brand | battery_capacity
-----------|-------|-----------------
101        | Tesla | 75
102        | BMW   | NULL
```

`NULL` does not mean:

```text
0
empty string
false
```

It represents the absence of a known value.

---

## 9. Updating Rows

Example:

```sql
UPDATE vehicles
SET year = 2026
WHERE vehicle_id = 101;
```

Always use an appropriate `WHERE` condition.

Without it:

```sql
UPDATE vehicles
SET year = 2026;
```

every row may be updated.

---

## 10. Deleting Rows

Example:

```sql
DELETE FROM vehicles
WHERE vehicle_id = 103;
```

Again, the `WHERE` condition is important.

---

## 11. Filtering Rows

```sql
SELECT *
FROM vehicles
WHERE year >= 2025;
```

This returns vehicles manufactured in 2025 or later.

---

## 12. Selecting Columns

Instead of:

```sql
SELECT *
FROM vehicles;
```

select only required columns:

```sql
SELECT brand, model, year
FROM vehicles;
```

This is often preferable in production queries because it makes the query clearer and can reduce unnecessary data processing.

---

## 13. Row Count

Count records:

```sql
SELECT COUNT(*)
FROM vehicles;
```

Group records:

```sql
SELECT brand, COUNT(*)
FROM vehicles
GROUP BY brand;
```

---

## 14. Automobile Example

A vehicle sales database may contain:

```text
customers
--------------------------------
customer_id | name | city

vehicles
--------------------------------
vehicle_id | brand | model

sales
--------------------------------
sale_id | customer_id | vehicle_id
```

Relationships between these tables allow the organization to analyze sales.

---

## 15. Data Engineering Importance

Data Engineers frequently work with:

```text
Tables
Rows
Columns
Schemas
Data Types
Constraints
Indexes
```

During ingestion, a Data Engineer may need to map incoming data to database columns.

```text
CSV
 |
 v
Schema Validation
 |
 v
Column Mapping
 |
 v
Database Table
```

---

## Best Practices

- Use meaningful column names.
- Choose appropriate data types.
- Avoid unnecessary columns.
- Define keys and constraints.
- Handle NULL values carefully.
- Avoid `SELECT *` in production queries when unnecessary.
- Document important schemas.

## Interview Questions

1. What is a table?
2. What is a row?
3. What is a column?
4. What is a value?
5. What is NULL?
6. Why are data types important?
7. What is the difference between NULL and zero?
8. Why should `SELECT *` sometimes be avoided?
9. How are tables used in Data Engineering?

## Summary

Tables organize data into rows and columns. Understanding this structure is fundamental to working with relational databases and building reliable data pipelines.