# Primary and Foreign Keys

## 1. Introduction

Keys are fundamental components of relational database design.

They help databases:

- Uniquely identify records
- Establish relationships
- Maintain data integrity
- Connect multiple tables

The two important types are:

```text
Primary Key
Foreign Key
```

---

## 2. Primary Key

A primary key uniquely identifies each row in a table.

Example:

```text
vehicle_id | brand | model
-----------|-------|------
101        | BMW   | X5
102        | Audi  | Q5
103        | Tesla | Model 3
```

Here:

```text
vehicle_id
```

can be the primary key.

---

## 3. Primary Key Rules

A primary key should:

- Uniquely identify records
- Not contain NULL
- Remain stable where possible

Example:

```sql
CREATE TABLE vehicles (
    vehicle_id INTEGER PRIMARY KEY,
    brand VARCHAR(50),
    model VARCHAR(50)
);
```

---

## 4. Duplicate Primary Key

This is invalid:

```sql
INSERT INTO vehicles
VALUES (101, 'BMW', 'X3');

INSERT INTO vehicles
VALUES (101, 'Audi', 'Q5');
```

Both records use:

```text
vehicle_id = 101
```

The database will reject the second record because the primary key must be unique.

---

## 5. Foreign Key

A foreign key creates a relationship between tables.

Example:

```text
customers
customer_id
     |
     |
     v
sales
customer_id
```

The `sales.customer_id` column can reference `customers.customer_id`.

```sql
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE sales (
    sale_id INTEGER PRIMARY KEY,
    customer_id INTEGER,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);
```

---

## 6. Why Foreign Keys Matter

Foreign keys help maintain referential integrity.

For example, a sale should normally reference an existing customer.

```text
Customer
   |
   | customer_id = 10
   v
Sale
   |
   | customer_id = 10
```

The relationship is valid because the customer exists.

---

## 7. Referential Integrity

Suppose:

```text
customers

customer_id
-----------
10
20
30
```

And:

```text
sales

sale_id | customer_id
--------|------------
1       | 10
2       | 20
```

The references are valid.

But:

```text
sale_id | customer_id
--------|------------
3       | 99
```

would normally be rejected if `customer_id = 99` does not exist in the parent table and the foreign key constraint is enforced.

---

## 8. One-to-Many Relationship

A common relationship is:

```text
One Customer
     |
     +---- Sale
     +---- Sale
     +---- Sale
```

One customer can make many purchases.

Example:

```text
customers
customer_id
10

sales
sale_id | customer_id
--------|------------
1       | 10
2       | 10
3       | 10
```

---

## 9. Composite Primary Key

A table can use more than one column as its primary key.

Example:

```sql
CREATE TABLE vehicle_service (
    vehicle_id INTEGER,
    service_date DATE,
    service_type VARCHAR(100),

    PRIMARY KEY (vehicle_id, service_date)
);
```

The combination must be unique.

---

## 10. Natural vs Surrogate Keys

### Natural Key

A key that comes from real-world data.

Example:

```text
VIN
```

### Surrogate Key

An artificial identifier created by the system.

Example:

```text
vehicle_id = 1001
```

Data warehouses commonly use surrogate keys for dimensional modeling.

---

## 11. Automobile Example

Consider:

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

SQL:

```sql
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE vehicles (
    vehicle_id INTEGER PRIMARY KEY,
    brand VARCHAR(50),
    model VARCHAR(50)
);

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

---

## 12. Cascading Actions

Foreign keys can define actions when parent records change.

Example:

```sql
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
ON DELETE CASCADE
```

This means dependent records can be automatically deleted when the referenced parent record is deleted.

Such behavior must be designed carefully.

---

## 13. Primary Key vs Foreign Key

| Primary Key | Foreign Key |
|---|---|
| Identifies a row | References another table |
| Must be unique | Can contain repeated values |
| Cannot normally be NULL | May allow NULL depending on design |
| One primary key constraint per table | Multiple foreign keys possible |
| Defines entity identity | Defines relationships |

---

## 14. Data Engineering Importance

Keys are important during:

- ETL
- ELT
- Data modeling
- Deduplication
- Data quality
- Warehouse design
- Data integration

For example, a pipeline may use:

```text
Source Customer ID
       |
       v
Customer Mapping
       |
       v
Warehouse Customer Key
```

---

## Best Practices

- Choose stable primary keys.
- Define foreign keys where relationships matter.
- Avoid duplicate identifiers.
- Validate key relationships during ingestion.
- Understand cascading operations before enabling them.
- Use surrogate keys appropriately in analytical models.

## Interview Questions

1. What is a primary key?
2. What is a foreign key?
3. What is referential integrity?
4. Can a foreign key contain duplicate values?
5. What is a composite key?
6. Natural key vs surrogate key?
7. What is a one-to-many relationship?
8. Why are keys important in Data Engineering?

## Summary

Primary keys identify records, while foreign keys connect related tables and help maintain relationships and data integrity.