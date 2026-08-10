# Relational Databases

## 1. Introduction

A relational database stores structured data using tables.

Each table contains:

- Rows
- Columns

Relationships can be created between tables using keys.

Examples:

- PostgreSQL
- MySQL
- Oracle Database
- SQL Server
- SQLite

## 2. Table Structure

Consider a vehicle table:

```text
vehicles

vehicle_id | brand | model | year
-----------|-------|-------|-----
101        | BMW   | X5    | 2025
102        | Audi  | Q5    | 2024
103        | Tesla | Model 3 | 2025
```

Each row represents one vehicle.

Each column represents an attribute.

## 3. Rows

A row represents one record.

Example:

```text
101 | BMW | X5 | 2025
```

represents one vehicle.

## 4. Columns

A column defines a particular attribute.

```text
vehicle_id
brand
model
year
```

Each column has a data type.

Example:

```text
vehicle_id → INTEGER
brand      → VARCHAR
year       → INTEGER
```

## 5. Primary Key

A primary key uniquely identifies each record.

Example:

```sql
CREATE TABLE vehicles (
    vehicle_id INTEGER PRIMARY KEY,
    brand VARCHAR(50),
    model VARCHAR(50),
    year INTEGER
);
```

Here:

```text
vehicle_id
```

is the primary key.

## 6. Relationships

Relational databases can connect multiple tables.

Example:

```text
customers
    |
    | customer_id
    v
sales
    |
    | vehicle_id
    v
vehicles
```

This avoids storing the same information repeatedly.

## 7. Foreign Key

A foreign key references a key in another table.

```sql
CREATE TABLE sales (
    sale_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    vehicle_id INTEGER,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (vehicle_id)
        REFERENCES vehicles(vehicle_id)
);
```

## 8. SQL

Relational databases commonly use SQL.

Example:

```sql
SELECT *
FROM vehicles;
```

Filter:

```sql
SELECT *
FROM vehicles
WHERE year >= 2025;
```

Aggregation:

```sql
SELECT brand, COUNT(*)
FROM vehicles
GROUP BY brand;
```

## 9. Relational Model

A simplified relational model:

```text
Database
   |
   +-- customers
   |
   +-- vehicles
   |
   +-- sales
   |
   +-- service_records
```

Tables can be related using keys.

## 10. Advantages

Relational databases provide:

- Structured schema
- SQL support
- Transactions
- Data integrity
- Relationships
- Constraints
- Mature tooling

## 11. Limitations

Traditional relational systems can become challenging when dealing with:

- Extremely large distributed workloads
- Highly variable data structures
- Massive unstructured datasets
- Certain low-latency distributed use cases

However, modern relational systems can scale significantly depending on architecture.

## 12. Relational Database Architecture

```text
Application
     |
     v
SQL Query
     |
     v
Database Engine
     |
     +---- Query Processor
     |
     +---- Storage Engine
     |
     v
Tables / Indexes
```

## 13. Data Engineering Usage

Relational databases are commonly used for:

```text
Source Systems
      |
      v
Operational Database
      |
      v
Extraction
      |
      v
Data Warehouse
```

Data Engineers frequently extract data from relational databases using SQL and connectors.

## 14. Automobile Example

A vehicle sales system could contain:

```text
customers
vehicles
dealers
sales
payments
service_records
```

Relationships:

```text
Customer
   |
   v
Sale
   |
   v
Vehicle
   |
   v
Dealer
```

## 15. Best Practices

- Define appropriate primary keys.
- Use foreign keys where relationships matter.
- Select suitable data types.
- Normalize transactional data appropriately.
- Add indexes based on query patterns.
- Use transactions for related operations.
- Protect database credentials.

## Interview Questions

1. What is a relational database?
2. What is a table?
3. What is a row?
4. What is a column?
5. What is a primary key?
6. What is a foreign key?
7. Why are relationships useful?
8. What are the advantages of relational databases?
9. How are relational databases used in Data Engineering?

## Summary

Relational databases organize structured information into related tables and provide SQL, constraints, transactions, and strong data integrity mechanisms.