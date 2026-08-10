# Transactions and ACID

## 1. Introduction

A transaction is a group of database operations treated as a single logical unit.

For example, a vehicle purchase may involve:

```text
Create Sale
     |
     v
Update Vehicle Inventory
     |
     v
Record Payment
```

These operations should be handled reliably.

---

## 2. Transaction Example

```sql
BEGIN;

INSERT INTO sales
VALUES (1001, 25, 501);

UPDATE vehicles
SET status = 'SOLD'
WHERE vehicle_id = 501;

COMMIT;
```

If all operations succeed, the transaction is committed.

---

## 3. ROLLBACK

If something goes wrong:

```sql
ROLLBACK;
```

The database can undo changes made within the transaction.

Example:

```sql
BEGIN;

UPDATE vehicles
SET status = 'SOLD'
WHERE vehicle_id = 501;

ROLLBACK;
```

The update is discarded.

---

## 4. ACID Properties

Reliable transactions commonly follow four important properties:

```text
A → Atomicity
C → Consistency
I → Isolation
D → Durability
```

---

## 5. Atomicity

Atomicity means a transaction is treated as one unit.

Either all required operations succeed or the transaction is rolled back.

```text
Transaction
   |
   +--> Operation 1 ✓
   |
   +--> Operation 2 ✓
   |
   +--> Operation 3 ✗
             |
             v
         Rollback
```

---

## 6. Consistency

Consistency means a transaction should leave the database in a valid state according to its constraints and rules.

For example:

```text
vehicle_id must be unique
customer_id must exist
price cannot be negative
```

A valid transaction preserves these rules.

---

## 7. Isolation

Isolation controls how concurrent transactions interact.

Imagine:

```text
Transaction A
     |
     v
Update Vehicle

Transaction B
     |
     v
Read Vehicle
```

The database's isolation mechanisms determine what Transaction B can see while A is running.

---

## 8. Durability

Once a transaction is successfully committed, its changes should survive failures according to the database's durability guarantees.

```text
COMMIT
  |
  v
Persistent State
```

---

## 9. ACID Summary

| Property | Meaning |
|---|---|
| Atomicity | All or nothing |
| Consistency | Valid database state |
| Isolation | Controls concurrent transactions |
| Durability | Committed changes persist |

---

## 10. COMMIT

```sql
COMMIT;
```

makes the transaction's changes permanent.

Example:

```sql
BEGIN;

INSERT INTO customers
VALUES (101, 'Charan');

COMMIT;
```

---

## 11. ROLLBACK

```sql
ROLLBACK;
```

undoes changes from the current transaction that have not been committed.

---

## 12. SAVEPOINT

A savepoint allows partial rollback within a transaction.

```sql
BEGIN;

UPDATE vehicles
SET status = 'SOLD'
WHERE vehicle_id = 501;

SAVEPOINT vehicle_update;

UPDATE vehicles
SET price = 0
WHERE vehicle_id = 501;

ROLLBACK TO vehicle_update;

COMMIT;
```

The second update can be rolled back while retaining the earlier operation.

---

## 13. Transactions in Data Engineering

Transactions are important when pipelines write to operational databases.

Example:

```text
ETL Job
  |
  v
Insert Records
  |
  v
Update Metadata
  |
  v
Commit
```

If the pipeline fails before completion, appropriate transaction handling can prevent partial updates.

For large analytical pipelines, however, transaction behavior depends on the storage system and architecture.

---

## 14. Automobile Example

A dealership sells a vehicle.

Operations:

```text
1. Create sale
2. Update vehicle status
3. Record payment
```

Without transaction management:

```text
Sale Created ✓
Vehicle Updated ✓
Payment Failed ✗
```

The system may be left in an inconsistent state.

With an appropriate transaction:

```text
Sale ✓
Vehicle ✓
Payment ✗
   |
   v
Rollback
```

---

## 15. Isolation Levels

Common isolation levels include:

```text
Read Uncommitted
Read Committed
Repeatable Read
Serializable
```

Different databases implement and document these levels differently.

Higher isolation can provide stronger guarantees but may reduce concurrency or increase locking overhead.

---

## 16. Transactions vs Batch Processing

A database transaction usually focuses on maintaining consistency for a logical unit of work.

A Data Engineering batch job may process millions of records.

```text
Batch Job
   |
   +--> Read
   +--> Transform
   +--> Validate
   +--> Load
```

The pipeline may use multiple transactions or database-specific bulk loading mechanisms rather than one enormous transaction.

---

## Best Practices

- Keep transactions logically scoped.
- Commit successful work.
- Roll back failed operations when appropriate.
- Understand isolation levels.
- Avoid unnecessarily long transactions.
- Test failure scenarios.
- Understand the transaction guarantees of your database.

## Interview Questions

1. What is a transaction?
2. What are ACID properties?
3. What is atomicity?
4. What is consistency?
5. What is isolation?
6. What is durability?
7. Difference between COMMIT and ROLLBACK?
8. What is a SAVEPOINT?
9. What are isolation levels?
10. Why are transactions important in Data Engineering?

## Summary

Transactions provide a controlled way to execute related database operations while maintaining correctness, reliability, and consistency.