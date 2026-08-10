# Database Architecture

## 1. Introduction

Database architecture describes how applications, database software, storage, users, and supporting components interact.

A well-designed architecture improves:

- Performance
- Reliability
- Security
- Scalability
- Maintainability

## 2. Basic Architecture

```text
User
 |
 v
Application
 |
 v
Database Driver
 |
 v
Database Server
 |
 v
Storage
```

For example:

```text
Python Application
       |
       v
PostgreSQL Driver
       |
       v
PostgreSQL Server
       |
       v
Disk / SSD
```

## 3. Three-Tier Architecture

A common application architecture is:

```text
Presentation Layer
        |
        v
Application Layer
        |
        v
Database Layer
```

### Presentation Layer

The user interface.

### Application Layer

Business logic and processing.

### Database Layer

Persistent data storage.

## 4. Client-Server Architecture

```text
Client
  |
  | Request
  v
Database Server
  |
  | Query
  v
Database
```

The client sends queries to the database server.

## 5. Database Server

A database server manages:

- Connections
- Queries
- Transactions
- Security
- Storage
- Indexes
- Concurrency

## 6. Query Processing

A simplified flow:

```text
SQL Query
    |
    v
Parser
    |
    v
Query Planner
    |
    v
Execution Engine
    |
    v
Storage
```

For example:

```sql
SELECT *
FROM vehicles
WHERE brand = 'BMW';
```

The database determines an efficient way to execute the query.

## 7. Storage Layer

Data may be stored on:

- HDD
- SSD
- Network storage
- Cloud storage

Database systems use storage structures such as:

```text
Tables
Indexes
Logs
Metadata
```

## 8. Database Architecture in Data Engineering

A larger architecture may look like:

```text
Applications
     |
     v
Operational Databases
     |
     v
Data Ingestion
     |
     v
Data Lake
     |
     v
Transformation
     |
     v
Data Warehouse
     |
     v
BI / Analytics
```

## 9. Primary and Replica

A database can use replicas:

```text
                Primary
                   |
          -------------------
          |                 |
          v                 v
       Replica 1         Replica 2
```

Replicas can improve availability and distribute read workloads depending on the architecture.

## 10. Automobile Example

A vehicle company may have:

```text
Vehicle Applications
       |
       v
Operational Databases
       |
       +---- Sales DB
       +---- Service DB
       +---- Customer DB
       +---- Telemetry DB
       |
       v
Data Platform
```

The Data Engineering platform can collect information from these systems.

## 11. Security Layer

Production database architecture should include:

```text
Application
    |
Firewall / Network
    |
Authentication
    |
Authorization
    |
Database
```

Sensitive data should be protected using appropriate access controls and encryption.

## 12. High Availability

A highly available database architecture attempts to minimize downtime.

Possible components include:

- Replication
- Failover
- Backups
- Health checks
- Monitoring

## 13. Scaling

Two major approaches are:

### Vertical Scaling

Increase resources on one machine.

```text
Small Server
     ↓
More CPU / RAM / Storage
```

### Horizontal Scaling

Add more machines.

```text
Server 1
Server 2
Server 3
```

The appropriate strategy depends on the database technology and workload.

## 14. Best Practices

- Separate application and database responsibilities.
- Use backups.
- Monitor database health.
- Secure connections.
- Limit database permissions.
- Design for expected workload.
- Plan for failure.
- Test recovery procedures.

## Interview Questions

1. What is database architecture?
2. What is client-server architecture?
3. What is a database server?
4. What is query processing?
5. What is database replication?
6. Vertical vs horizontal scaling?
7. How does a database fit into a Data Engineering architecture?
8. Why is high availability important?

## Summary

Database architecture defines how applications, database engines, storage, networking, security, and reliability mechanisms work together to provide data services.