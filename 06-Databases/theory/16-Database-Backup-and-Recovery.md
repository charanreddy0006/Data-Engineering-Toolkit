# Database Backup and Recovery

## 1. Introduction

Database backup and recovery are processes used to protect data from:

- Hardware failures
- Software failures
- Accidental deletion
- Data corruption
- Security incidents
- Human errors
- Disaster events

A production Data Engineering system should have a well-defined recovery strategy.

---

## 2. Why Backups Are Important

Imagine a production database containing:

```text
Customers
Vehicles
Sales
Payments
Service Records
```

If the database is accidentally deleted:

```text
Production Database
       |
       X
     Failure
       |
       v
No Recovery Plan
       |
       v
Data Loss
```

Backups provide a way to restore data.

---

## 3. Backup vs Replication

Backup and replication are different.

### Backup

A saved copy of data used for recovery.

### Replication

A continuously or periodically maintained copy of data.

```text
Backup
→ Historical recovery

Replication
→ Availability / scaling / failover
```

Replication should not replace backups.

---

## 4. Full Backup

A full backup copies the complete database or selected database contents.

```text
Database
   |
   v
Full Backup
   |
   v
Backup Storage
```

It is simple to understand but may require more storage and time.

---

## 5. Incremental Backup

An incremental backup stores changes since a previous backup according to the backup strategy.

Conceptually:

```text
Full Backup
     |
     v
Increment 1
     |
     v
Increment 2
     |
     v
Increment 3
```

This can reduce backup size compared with repeated full backups.

---

## 6. Differential Backup

A differential backup stores changes since a chosen full backup.

```text
Full Backup
   |
   +---- Differential 1
   +---- Differential 2
   +---- Differential 3
```

The exact implementation varies between database systems.

---

## 7. Point-in-Time Recovery

Point-in-time recovery allows a database to be restored to a particular point in time when supported by the database and backup architecture.

Example:

```text
10:00 → Normal
11:00 → Normal
12:00 → Accidental DELETE
13:00 → Problem discovered
```

A recovery system may allow restoration to a time before the accidental deletion.

---

## 8. Recovery Workflow

```text
Failure
  |
  v
Identify Problem
  |
  v
Select Recovery Point
  |
  v
Restore Backup
  |
  v
Apply Required Logs
  |
  v
Validate Data
  |
  v
Return to Service
```

The exact steps depend on the database technology.

---

## 9. RPO

RPO stands for **Recovery Point Objective**.

It describes how much recent data the organization can afford to lose.

Example:

```text
RPO = 15 minutes
```

This means the recovery strategy should aim to limit data loss to approximately 15 minutes or less, subject to the actual system design.

---

## 10. RTO

RTO stands for **Recovery Time Objective**.

It describes how quickly the system should be restored.

Example:

```text
RTO = 1 hour
```

The system should aim to become operational within approximately one hour.

---

## 11. RPO vs RTO

| Concept | Meaning |
|---|---|
| RPO | Acceptable amount of data loss |
| RTO | Acceptable recovery time |

Example:

```text
RPO → 15 minutes
RTO → 1 hour
```

---

## 12. Backup Storage

Backups should usually be stored separately from the primary database.

```text
Production Database
       |
       v
Backup System
       |
       v
Separate Storage
```

Cloud object storage is commonly used for backup storage.

---

## 13. Backup Security

Backups can contain sensitive information.

Protect them using:

- Encryption
- Access control
- Secure credentials
- Network restrictions
- Retention policies

A backup should not become an easier way to access production data.

---

## 14. Automobile Example

An automobile company may have:

```text
Production Sales Database
        |
        v
Backup System
        |
        +---- Daily Full Backup
        |
        +---- Frequent Incremental / Log Backups
        |
        v
Secure Backup Storage
```

If a critical database failure occurs, the recovery process restores the required data.

---

## 15. Testing Backups

A backup is only useful if it can actually be restored.

Regularly test:

```text
Backup
  |
  v
Restore
  |
  v
Validation
```

Check:

- Tables exist
- Data is present
- Constraints work
- Applications can connect
- Important queries work

---

## 16. Retention

Organizations may define policies such as:

```text
Daily backups → 30 days
Monthly backups → 12 months
Yearly backups → Longer retention
```

Actual retention depends on business, regulatory, and cost requirements.

---

## 17. Disaster Recovery

A disaster recovery strategy may include:

```text
Primary Region
      |
      v
Backup Storage
      |
      v
Secondary Region
      |
      v
Recovery
```

The architecture depends on required RTO, RPO, cost, and availability.

---

## 18. Best Practices

- Automate backups.
- Store backups separately.
- Encrypt sensitive backups.
- Define RPO and RTO.
- Monitor backup jobs.
- Test restoration regularly.
- Define retention policies.
- Document recovery procedures.

## Interview Questions

1. Why are database backups important?
2. Backup vs replication?
3. What is a full backup?
4. What is an incremental backup?
5. What is a differential backup?
6. What is point-in-time recovery?
7. What is RPO?
8. What is RTO?
9. Why should backups be tested?
10. How would you design backup and recovery for a vehicle sales database?

## Summary

Backup and recovery protect databases against failures and data loss. A reliable strategy combines appropriate backups, secure storage, recovery procedures, monitoring, and regular restoration testing.