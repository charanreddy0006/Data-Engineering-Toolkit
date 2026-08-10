# Database Cheat Sheet

## Database Basics

```text
Database → Organized collection of data
DBMS     → Software that manages databases
CRUD     → Create, Read, Update, Delete
Schema   → Structure of database objects
```

---

## Relational Database

```text
Database
   |
   +-- Table
        |
        +-- Columns
        +-- Rows
        +-- Values
```

Examples:

```text
PostgreSQL
MySQL
SQLite
Oracle
SQL Server
```

---

## Common Data Types

```sql
INTEGER
BIGINT
DECIMAL
VARCHAR
TEXT
BOOLEAN
DATE
TIMESTAMP
```

---

## Primary Key

```sql
CREATE TABLE vehicles (
    vehicle_id INTEGER PRIMARY KEY,
    brand VARCHAR(50)
);
```

```text
Unique
+
Not NULL
+
Identifies record
```

---

## Foreign Key

```sql
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
```

Used to connect related tables.

---

## Index

```sql
CREATE INDEX idx_vehicle_id
ON vehicles(vehicle_id);
```

Useful for suitable read/query patterns.

Trade-off:

```text
Indexes
  +
Faster Reads
  -
Additional Storage
  -
Write Overhead
```

---

## Transactions

```sql
BEGIN;

-- operations

COMMIT;
```

Cancel:

```sql
ROLLBACK;
```

---

## ACID

```text
A → Atomicity
C → Consistency
I → Isolation
D → Durability
```

---

## Normalization

```text
1NF
 ↓
2NF
 ↓
3NF
 ↓
BCNF
```

Purpose:

```text
Reduce Redundancy
Improve Consistency
Avoid Anomalies
```

---

## OLTP vs OLAP

```text
OLTP
 ↓
Operational Transactions
 ↓
Sales / Payments / Orders


OLAP
 ↓
Analytical Queries
 ↓
Reports / Dashboards / Analytics
```

---

## Replication

```text
Primary
   |
   +-- Replica 1
   +-- Replica 2
```

Used for appropriate:

```text
Availability
Read Scaling
Disaster Recovery
```

---

## Partitioning

```text
Large Table
    |
    +-- Partition 1
    +-- Partition 2
    +-- Partition 3
```

Common strategies:

```text
Range
List
Hash
```

---

## Scaling

### Vertical

```text
Bigger Server
```

### Horizontal

```text
More Servers
```

### Sharding

```text
Data
 |
 +-- Shard 1
 +-- Shard 2
 +-- Shard 3
```

---

## Backup

```text
Full
Incremental
Differential
Point-in-Time Recovery
```

---

## RPO / RTO

```text
RPO → How much data loss is acceptable?

RTO → How quickly must service be restored?
```

---

## Security

```text
Authentication
Authorization
Least Privilege
Encryption
Secrets Management
Auditing
Network Security
```

---

## Performance

Important areas:

```text
Query Design
Indexes
Partitioning
Query Plans
Connection Pooling
Batch Processing
Storage
Monitoring
```

Check query plan:

```sql
EXPLAIN
SELECT *
FROM vehicles
WHERE vehicle_id = 101;
```

---

## Data Engineering Architecture

```text
Source Database
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
Data Warehouse / Lakehouse
       |
       v
BI / Analytics
```

---

## Automobile Data Example

```text
Customers
Vehicles
Dealers
Sales
Payments
Service Records
Vehicle Sensors
GPS Data
Charging Data
```

Possible architecture:

```text
Vehicle Systems
      |
      v
Operational Databases
      |
      v
Data Pipelines
      |
      v
Data Lake / Warehouse
      |
      v
Analytics
```

---

## Important SQL

```sql
SELECT *
FROM vehicles;

SELECT brand, COUNT(*)
FROM vehicles
GROUP BY brand;

INSERT INTO vehicles
VALUES (101, 'BMW', 'X5', 2025);

UPDATE vehicles
SET year = 2026
WHERE vehicle_id = 101;

DELETE FROM vehicles
WHERE vehicle_id = 101;
```

---

## Database Design Checklist

```text
[ ] Identify entities
[ ] Define tables
[ ] Define columns
[ ] Select data types
[ ] Define primary keys
[ ] Define foreign keys
[ ] Add constraints
[ ] Normalize where appropriate
[ ] Design indexes
[ ] Consider partitioning
[ ] Plan backups
[ ] Secure credentials
[ ] Monitor performance
```