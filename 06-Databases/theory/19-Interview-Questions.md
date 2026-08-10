# Database Interview Questions

## 1. Database Fundamentals

### 1. What is a database?

A database is an organized collection of data that can be stored, accessed, modified, and managed efficiently.

### 2. What is a DBMS?

A Database Management System is software used to create, manage, query, and secure databases.

Examples:

```text
PostgreSQL
MySQL
Oracle
MongoDB
SQLite
```

### 3. Database vs DBMS?

```text
Database → The stored data
DBMS     → Software used to manage the data
```

### 4. What is CRUD?

```text
C → Create
R → Read
U → Update
D → Delete
```

### 5. Why are databases used instead of files?

Databases provide:

- Efficient querying
- Data integrity
- Transactions
- Security
- Concurrent access
- Backup and recovery

---

# 2. Relational Databases

### 6. What is a relational database?

A relational database stores structured data in tables containing rows and columns.

Examples:

```text
PostgreSQL
MySQL
Oracle
SQLite
```

### 7. What is a table?

A table stores records about a particular entity.

Example:

```text
vehicles
customers
sales
```

### 8. What is a row?

A row represents one record.

```text
101 | BMW | X5 | 2025
```

### 9. What is a column?

A column represents an attribute.

```text
vehicle_id
brand
model
year
```

### 10. What is a schema?

A schema defines the structure of database objects such as tables, columns, relationships, and constraints.

---

# 3. Keys

### 11. What is a primary key?

A primary key uniquely identifies each record.

```sql
vehicle_id INTEGER PRIMARY KEY
```

### 12. What is a foreign key?

A foreign key references a key in another table.

```sql
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
```

### 13. What is a composite key?

A key consisting of multiple columns.

```sql
PRIMARY KEY (vehicle_id, service_date)
```

### 14. What is a surrogate key?

An artificial identifier created by the system.

Example:

```text
vehicle_id = 1001
```

### 15. What is referential integrity?

It ensures that relationships between related tables remain valid.

---

# 4. Indexes

### 16. What is an index?

An index is a database structure that can improve the efficiency of data retrieval.

```sql
CREATE INDEX idx_vehicle_id
ON vehicles(vehicle_id);
```

### 17. Why aren't all columns indexed?

Indexes require:

- Storage
- Maintenance
- Additional work during writes

Too many indexes can reduce write performance.

### 18. What is a composite index?

An index containing multiple columns.

```sql
CREATE INDEX idx_sales_customer_date
ON sales(customer_id, sale_date);
```

### 19. What is EXPLAIN?

`EXPLAIN` shows the query execution plan selected by the database.

```sql
EXPLAIN
SELECT *
FROM vehicles
WHERE vehicle_id = 101;
```

### 20. What is a full table scan?

A full table scan examines a large portion or all of a table to find matching rows.

---

# 5. Transactions

### 21. What is a transaction?

A transaction is a group of database operations treated as one logical unit.

### 22. What are ACID properties?

```text
A → Atomicity
C → Consistency
I → Isolation
D → Durability
```

### 23. What is COMMIT?

```sql
COMMIT;
```

Makes the transaction's changes permanent.

### 24. What is ROLLBACK?

```sql
ROLLBACK;
```

Undoes uncommitted changes in the current transaction.

### 25. What is isolation?

Isolation controls how concurrent transactions interact with each other.

---

# 6. Normalization

### 26. What is normalization?

Normalization organizes relational data to reduce unnecessary duplication and improve consistency.

### 27. What is 1NF?

1NF generally requires atomic values and eliminates repeating groups.

### 28. What is 2NF?

2NF builds on 1NF and removes partial dependencies on part of a composite key.

### 29. What is 3NF?

3NF addresses transitive dependencies.

### 30. What is denormalization?

Denormalization intentionally introduces some redundancy to improve performance or simplify analytical queries.

---

# 7. OLTP and OLAP

### 31. What is OLTP?

Online Transaction Processing systems handle operational transactions.

Examples:

```text
Payments
Vehicle Sales
Customer Registration
Service Booking
```

### 32. What is OLAP?

Online Analytical Processing systems support analytical workloads.

Examples:

```text
Revenue Analysis
Vehicle Sales Trends
Fleet Analytics
Customer Analysis
```

### 33. OLTP vs OLAP?

```text
OLTP → Transactions
OLAP → Analytics
```

OLTP generally handles many small operational transactions, while OLAP commonly handles large analytical queries.

---

# 8. Replication

### 34. What is database replication?

Replication maintains copies of database data on other database instances.

```text
Primary
   |
   +-- Replica 1
   +-- Replica 2
```

### 35. What is replication lag?

Replication lag occurs when a replica is behind the primary.

### 36. Replication vs backup?

```text
Replication → Availability / scaling
Backup      → Recovery
```

Replication does not replace backups.

---

# 9. Partitioning

### 37. What is partitioning?

Partitioning divides a large table into smaller logical partitions.

```text
vehicle_data
     |
     +-- 2024
     +-- 2025
     +-- 2026
```

### 38. What is partition pruning?

Partition pruning allows the database to avoid scanning irrelevant partitions when the query permits it.

### 39. What is partition skew?

Partition skew occurs when data is distributed unevenly across partitions.

---

# 10. Scaling

### 40. What is vertical scaling?

Increasing the resources of an existing server.

```text
4 CPU → 16 CPU
16 GB RAM → 64 GB RAM
```

### 41. What is horizontal scaling?

Adding more servers or database nodes.

```text
Node 1
Node 2
Node 3
```

### 42. What is sharding?

Sharding distributes portions of data across multiple database nodes.

---

# 11. Backup and Recovery

### 43. What is a database backup?

A backup is a stored copy of database data used for recovery.

### 44. What is RPO?

Recovery Point Objective defines the acceptable amount of data loss.

### 45. What is RTO?

Recovery Time Objective defines the target time required to restore service.

### 46. Why should backups be tested?

A backup is useful only if it can be successfully restored when required.

---

# 12. Database Security

### 47. Authentication vs authorization?

```text
Authentication → Who are you?
Authorization  → What can you access?
```

### 48. What is least privilege?

Users and applications should receive only the permissions required for their tasks.

### 49. What is SQL injection?

SQL injection is an attack where malicious input manipulates dynamically constructed SQL.

Use parameterized queries to prevent it.

### 50. Why should credentials not be stored in Git?

Credentials stored in repositories can be exposed to unauthorized users and may remain in Git history.

---

# 13. Data Engineering Questions

### 51. How are databases used in Data Engineering?

Data Engineers use databases as:

```text
Source Systems
Operational Stores
Staging Areas
Data Warehouses
Metadata Stores
Serving Layers
```

### 52. How would you move data from PostgreSQL to a warehouse?

A common architecture is:

```text
PostgreSQL
    |
    v
Extraction
    |
    v
Staging
    |
    v
Transformation
    |
    v
Data Warehouse
```

### 53. How would you handle a large database table?

Possible techniques include:

```text
Indexing
Partitioning
Batch Processing
Replication
Query Optimization
Horizontal Scaling
```

The correct solution depends on the workload.

### 54. How would you handle schema changes?

Use:

- Schema versioning
- Migration scripts
- Compatibility checks
- Automated testing
- Documentation

### 55. How would you optimize a slow query?

A practical process:

```text
Identify Query
      |
      v
Measure
      |
      v
EXPLAIN
      |
      v
Find Bottleneck
      |
      v
Optimize
      |
      v
Measure Again
```

---

# 14. Scenario Questions

### 56. A vehicle telemetry table contains billions of rows. What would you consider?

Consider:

```text
Partitioning
Indexes
Query Patterns
Storage
Compression
Data Retention
Distributed Processing
```

### 57. Your production database is overloaded by analytics queries. What can you do?

Possible approaches:

```text
Read Replicas
Data Warehouse
Caching
Query Optimization
Workload Separation
```

### 58. A pipeline accidentally deletes production data. What would you do?

```text
Stop Further Damage
       |
       v
Identify Incident
       |
       v
Use Recovery Strategy
       |
       v
Restore / Recover
       |
       v
Validate Data
       |
       v
Investigate Root Cause
```

### 59. How would you design a vehicle sales database?

Possible tables:

```text
customers
vehicles
dealers
sales
payments
service_records
```

Relationships would be established using appropriate primary and foreign keys.

---

# Quick Revision

```text
Database
   ↓
DBMS
   ↓
Tables
   ↓
Keys + Constraints
   ↓
Indexes
   ↓
Transactions
   ↓
Normalization
   ↓
Replication
   ↓
Partitioning
   ↓
Scaling
   ↓
Backup + Recovery
   ↓
Security
   ↓
Performance
```