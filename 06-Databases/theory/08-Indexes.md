# Database Indexes

## 1. Introduction

An index is a database structure that helps the database find rows more efficiently.

Without an appropriate index, the database may need to examine many rows.

```text
Query
  |
  v
Index
  |
  v
Required Rows
```

Indexes are especially important for large tables.

---

## 2. Without an Index

Suppose a table contains:

```text
10 million vehicle records
```

Query:

```sql
SELECT *
FROM vehicles
WHERE vehicle_id = 5000000;
```

Without a suitable index, the database may need to scan a large portion of the table.

---

## 3. With an Index

Create:

```sql
CREATE INDEX idx_vehicle_id
ON vehicles(vehicle_id);
```

The database can use the index to locate matching rows more efficiently.

Conceptually:

```text
Query
 |
 v
Index
 |
 +--> vehicle_id = 5000000
 |
 v
Table Row
```

The actual execution depends on the database optimizer and data distribution.

---

## 4. Creating an Index

Example:

```sql
CREATE INDEX idx_vehicle_brand
ON vehicles(brand);
```

Query:

```sql
SELECT *
FROM vehicles
WHERE brand = 'BMW';
```

The optimizer may choose the index if it is beneficial.

---

## 5. Primary Key Index

Many relational databases automatically create or use an index associated with a primary key.

Example:

```sql
CREATE TABLE vehicles (
    vehicle_id INTEGER PRIMARY KEY,
    brand VARCHAR(50)
);
```

The primary key can efficiently support lookups by `vehicle_id`.

---

## 6. Composite Index

An index can contain multiple columns:

```sql
CREATE INDEX idx_vehicle_brand_model
ON vehicles(brand, model);
```

This can help queries using the indexed column order.

Example:

```sql
SELECT *
FROM vehicles
WHERE brand = 'BMW'
AND model = 'X5';
```

---

## 7. Column Order Matters

Consider:

```sql
CREATE INDEX idx_sales_customer_date
ON sales(customer_id, sale_date);
```

This is different from:

```sql
CREATE INDEX idx_sales_date_customer
ON sales(sale_date, customer_id);
```

Index design should be based on actual query patterns.

---

## 8. Indexes and INSERT

Indexes improve some read operations but can increase write overhead.

When a row is inserted:

```text
INSERT
  |
  +--> Table
  |
  +--> Index
```

The database may need to update the relevant indexes.

Therefore, adding indexes without considering workload can hurt write performance.

---

## 9. Indexes and Storage

Indexes require additional storage.

```text
Database
├── Table Data
└── Index Data
```

Large tables with many indexes can consume significant storage.

---

## 10. When to Use Indexes

Indexes are often useful for columns frequently used in:

```text
WHERE
JOIN
ORDER BY
GROUP BY
```

depending on the database and query.

Example:

```sql
SELECT *
FROM sales
WHERE customer_id = 101;
```

An index on `customer_id` may help.

---

## 11. When Not to Add an Index

Avoid blindly indexing every column.

Indexes may not help much when:

- The table is very small.
- The column has very low selectivity.
- The column is rarely queried.
- Write performance is critical.
- The optimizer determines a scan is cheaper.

---

## 12. Checking Query Performance

Database systems provide tools to inspect query execution.

For PostgreSQL:

```sql
EXPLAIN
SELECT *
FROM vehicles
WHERE vehicle_id = 101;
```

For more detailed information:

```sql
EXPLAIN ANALYZE
SELECT *
FROM vehicles
WHERE vehicle_id = 101;
```

---

## 13. Automobile Example

Suppose:

```text
vehicle_sensor_data
```

contains millions of records:

```text
vehicle_id
timestamp
speed
battery_level
temperature
```

A common query might be:

```sql
SELECT *
FROM vehicle_sensor_data
WHERE vehicle_id = 'EV1001'
ORDER BY timestamp DESC;
```

An appropriate index might involve:

```text
vehicle_id
timestamp
```

The exact design should be based on actual query patterns and database behavior.

---

## 14. Index Trade-Off

```text
More Indexes
     |
     +--> Faster Reads
     |
     +--> More Storage
     |
     +--> Slower Writes
     |
     +--> More Maintenance
```

The goal is balance.

---

## Best Practices

- Index based on real query patterns.
- Avoid unnecessary indexes.
- Monitor query performance.
- Use `EXPLAIN` where available.
- Consider composite indexes carefully.
- Remember that indexes have storage and write costs.
- Re-evaluate indexes as workloads change.

## Interview Questions

1. What is a database index?
2. Why are indexes used?
3. What is a composite index?
4. How do indexes affect INSERT operations?
5. Why shouldn't every column be indexed?
6. What is `EXPLAIN`?
7. How would you index a large vehicle telemetry table?
8. What is the trade-off between reads and writes?

## Summary

Indexes can dramatically improve query performance, but they introduce storage and write overhead. Effective indexing requires understanding actual workloads and query patterns.