# Database Schema

## 1. Introduction

A database schema defines the structure and organization of data inside a database.

It describes:

- Tables
- Columns
- Data types
- Keys
- Constraints
- Relationships
- Indexes

Example:

```text
Vehicle Database
│
├── customers
├── vehicles
├── dealers
└── sales
```

## 2. Schema Example

A simple vehicle table:

```sql
CREATE TABLE vehicles (
    vehicle_id INTEGER PRIMARY KEY,
    brand VARCHAR(50),
    model VARCHAR(50),
    year INTEGER
);
```

The schema defines the structure of the `vehicles` table.

## 3. Database Schema vs Database

A database is the complete data environment.

A schema describes the logical organization within that environment.

Conceptually:

```text
Database
│
├── Schema
│   ├── customers
│   ├── vehicles
│   └── sales
│
└── Other database objects
```

The exact meaning of "schema" varies between database systems.

## 4. Tables

Tables are the main objects used to organize relational data.

Example:

```text
vehicles
--------------------------------
vehicle_id
brand
model
year
price
```

## 5. Relationships

A schema can describe relationships between tables.

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

This structure represents how entities are connected.

## 6. Constraints

Schemas can define rules for data.

Example:

```sql
CREATE TABLE vehicles (
    vehicle_id INTEGER PRIMARY KEY,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    price DECIMAL(12,2) CHECK (price >= 0)
);
```

Here:

```text
PRIMARY KEY
NOT NULL
CHECK
```

help maintain data quality.

## 7. Schema Evolution

Data systems change over time.

For example:

```text
Version 1
vehicle_id
brand
model

        ↓

Version 2
vehicle_id
brand
model
battery_capacity
```

Adding a new column changes the schema.

Data Engineers must consider how schema changes affect downstream systems.

## 8. Schema-on-Write

In schema-on-write systems, data must generally conform to a defined schema before being stored in the target structure.

```text
Raw Data
   |
   v
Validation
   |
   v
Schema
   |
   v
Database
```

Relational databases commonly use this approach.

## 9. Schema-on-Read

Schema-on-read systems apply structure when data is accessed.

```text
Raw Data
   |
   v
Storage
   |
   v
Query
   |
   v
Schema Applied
```

This approach is common in data lake architectures.

## 10. Database Schema in Data Engineering

A pipeline may move data through multiple schemas:

```text
Source Schema
      |
      v
Staging Schema
      |
      v
Transformation
      |
      v
Warehouse Schema
```

Each stage can have different requirements.

## 11. Automobile Example

A vehicle platform might contain:

```text
sales
--------------------------------
sale_id
customer_id
vehicle_id
sale_date
sale_amount

vehicles
--------------------------------
vehicle_id
brand
model
fuel_type
year

customers
--------------------------------
customer_id
name
city
```

The schema defines how these entities are stored and connected.

## 12. Schema Documentation

A professional project should document important schemas.

Example:

| Table | Column | Type | Description |
|---|---|---|---|
| vehicles | vehicle_id | INTEGER | Unique vehicle ID |
| vehicles | brand | VARCHAR | Vehicle manufacturer |
| vehicles | model | VARCHAR | Vehicle model |
| vehicles | year | INTEGER | Manufacturing year |

## 13. Schema Validation

A pipeline can verify:

```text
Column exists
Data type correct
Required field present
NULL rules satisfied
Expected values present
```

Example:

```text
vehicle_id → required
year       → integer
price      → >= 0
```

## 14. Best Practices

- Define schemas clearly.
- Use meaningful names.
- Document important columns.
- Use appropriate data types.
- Track schema changes.
- Test schema compatibility.
- Consider downstream dependencies.

## Interview Questions

1. What is a database schema?
2. Database vs schema?
3. What is schema-on-write?
4. What is schema-on-read?
5. What is schema evolution?
6. Why is schema management important in Data Engineering?
7. How can schema changes break a pipeline?

## Summary

A database schema defines how data is organized and constrained. Schema management is especially important in Data Engineering because changes can affect entire data pipelines.