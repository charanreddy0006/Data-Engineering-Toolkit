# Database Normalization

## 1. Introduction

Normalization is a database design technique used to organize relational data and reduce unnecessary duplication.

The main goals are:

- Reduce redundancy
- Improve consistency
- Avoid update anomalies
- Improve data organization

---

## 2. Example of Unnormalized Data

Consider:

```text
sales

sale_id | customer | city | vehicle | brand
--------|----------|------|---------|------
1       | Ravi     | Rajkot | X5    | BMW
2       | Ravi     | Rajkot | Q5    | Audi
3       | Priya    | Surat | Model 3 | Tesla
```

Customer information is repeated.

```text
Ravi | Rajkot
Ravi | Rajkot
```

This can create unnecessary duplication.

---

## 3. Problems with Redundancy

Repeated data can cause:

### Update Anomaly

If Ravi moves to another city, multiple records may need updating.

### Insert Anomaly

You may be unable to store a customer until a sale exists.

### Delete Anomaly

Deleting the last sale may accidentally remove the only record of a customer.

---

## 4. First Normal Form

First Normal Form, or 1NF, generally requires atomic values and no repeating groups.

Bad structure:

```text
vehicle_id | features
-----------|-------------------
101        | GPS, ABS, Airbags
```

A design should represent individual values appropriately rather than storing multiple logical values in one field when relational atomicity is required.

---

## 5. Second Normal Form

Second Normal Form, or 2NF, builds on 1NF and addresses partial dependency on part of a composite key.

It is especially relevant when a table has a composite primary key.

Example:

```text
sale_id
vehicle_id
customer_id
customer_name
```

If `customer_name` depends only on `customer_id`, it does not depend on the complete composite key.

The customer information should be separated.

---

## 6. Third Normal Form

Third Normal Form, or 3NF, addresses transitive dependencies.

Example:

```text
customer_id
customer_name
city
city_state
```

If:

```text
customer_id → city
city → city_state
```

then `city_state` indirectly depends on `customer_id`.

A normalized design can separate these relationships.

---

## 7. Normalized Design

Instead of:

```text
sales
--------------------------------
sale_id
customer_name
customer_city
vehicle_brand
vehicle_model
```

use:

```text
customers
----------------
customer_id
name
city

vehicles
----------------
vehicle_id
brand
model

sales
----------------
sale_id
customer_id
vehicle_id
```

---

## 8. Relationships

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

This reduces repeated information.

---

## 9. Normalization Levels

Common normal forms include:

```text
1NF
 ↓
2NF
 ↓
3NF
 ↓
BCNF
 ↓
Higher Normal Forms
```

Most transactional database designs commonly discuss 1NF, 2NF, and 3NF.

---

## 10. Denormalization

Denormalization intentionally introduces some redundancy to improve query performance or simplify analytical access.

Example:

```text
Normalized
customers + vehicles + sales
```

may become a wider analytical structure:

```text
sales_fact
customer_name
customer_city
vehicle_brand
vehicle_model
sale_amount
```

This can be useful in analytics depending on the architecture.

---

## 11. OLTP vs Analytics

Normalization is often important in OLTP systems:

```text
Application
    |
    v
Normalized Database
```

Analytical systems may use different modeling approaches:

```text
Data Warehouse
    |
    +-- Fact Tables
    +-- Dimension Tables
```

The appropriate design depends on workload.

---

## 12. Automobile Example

A dealership database can separate:

```text
customers
vehicles
dealers
sales
service_records
```

Instead of storing all information repeatedly in one large table.

Example:

```text
Customer
   |
   +---- Sales
             |
             +---- Vehicle
             |
             +---- Dealer
```

---

## 13. Advantages

Normalization can provide:

- Reduced redundancy
- Better consistency
- Easier updates
- Better integrity
- Cleaner relational design

## 14. Disadvantages

Highly normalized designs may require more joins.

For analytical workloads, many joins can sometimes make queries more complex or expensive.

This is one reason analytical systems may use dimensional models or carefully designed denormalization.

---

## 15. Best Practices

- Normalize transactional data appropriately.
- Understand functional dependencies.
- Avoid unnecessary duplication.
- Consider query performance.
- Do not blindly normalize every analytical model.
- Choose the design based on workload.

## Interview Questions

1. What is normalization?
2. Why is normalization used?
3. What is 1NF?
4. What is 2NF?
5. What is 3NF?
6. What is a partial dependency?
7. What is a transitive dependency?
8. What is denormalization?
9. Why might data warehouses use denormalized structures?

## Summary

Normalization organizes relational data to reduce redundancy and improve consistency. Data Engineers must balance normalization with performance and workload requirements.
```