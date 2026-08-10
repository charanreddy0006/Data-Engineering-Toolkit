# Database Scaling

## 1. Introduction

Database scaling is the process of increasing a database system's capacity to handle more:

- Data
- Users
- Queries
- Transactions
- Traffic

As a Data Engineering system grows, a database that worked for thousands of records may need to support billions of records.

---

## 2. Why Scaling Is Required

A growing application may experience:

```text
More Users
    +
More Data
    +
More Queries
    +
More Transactions
    |
    v
Higher Database Load
```

Eventually, the existing infrastructure may not provide sufficient performance.

---

## 3. Vertical Scaling

Vertical scaling means increasing the resources of an existing server.

For example:

```text
Before

CPU  → 4 cores
RAM  → 16 GB
Storage → 500 GB

        ↓

After

CPU  → 16 cores
RAM  → 64 GB
Storage → 2 TB
```

This is also called **scaling up**.

---

## 4. Advantages of Vertical Scaling

- Simple architecture
- Easier to manage
- Usually requires fewer infrastructure changes
- Useful for moderate workloads

## 5. Limitations

- Hardware has limits
- Larger machines can become expensive
- A single-server architecture can create a failure point
- Scaling may eventually become difficult

---

## 6. Horizontal Scaling

Horizontal scaling means adding more machines or database nodes.

```text
Database Cluster
│
├── Node 1
├── Node 2
├── Node 3
└── Node 4
```

This is also called **scaling out**.

---

## 7. Vertical vs Horizontal

| Feature | Vertical | Horizontal |
|---|---|---|
| Method | Bigger machine | More machines |
| Complexity | Lower | Higher |
| Hardware limit | Yes | Can scale further |
| Distributed system | Not required | Usually required |
| Cost | Can become expensive | Depends on architecture |

---

## 8. Read Scaling

Applications often perform many more reads than writes.

A primary database can use read replicas:

```text
                 Application
                /     |     \
               v      v      v
          Replica 1 Replica 2 Primary
             Reads     Reads   Writes
```

This can distribute read traffic.

The exact routing and consistency behavior depends on the database system.

---

## 9. Sharding

Sharding divides data across multiple database nodes.

```text
                Database
                   |
          -------------------
          |        |        |
          v        v        v
       Shard 1  Shard 2  Shard 3
```

Each shard stores part of the total dataset.

---

## 10. Example of Sharding

Suppose vehicle records are distributed using `vehicle_id`.

```text
Vehicle ID
    |
    v
Shard Key
    |
    +---- 1 → Shard 1
    +---- 2 → Shard 2
    +---- 3 → Shard 3
```

A good shard key should distribute data effectively and support common access patterns.

---

## 11. Sharding Challenges

Poor sharding can cause:

- Uneven data distribution
- Hotspots
- Complex queries
- Cross-shard operations
- Operational complexity

Example of bad distribution:

```text
Shard 1 → 90% of data
Shard 2 → 5%
Shard 3 → 5%
```

This creates a hotspot.

---

## 12. Database Scaling in Data Engineering

A large Data Engineering platform may use:

```text
Applications
      |
      v
Operational Databases
      |
      v
Replication
      |
      v
Data Ingestion
      |
      v
Distributed Storage
      |
      v
Warehouse / Lakehouse
```

Scaling decisions should be made at each layer.

---

## 13. Automobile Example

Imagine a vehicle company receives:

```text
10,000 vehicles
       ↓
1 million sensor records/day
       ↓
100 million records/day
       ↓
billions of historical records
```

A single database may eventually become difficult to manage.

The architecture may evolve:

```text
Single Database
      ↓
Read Replicas
      ↓
Partitioning
      ↓
Distributed Storage
      ↓
Data Lake / Lakehouse
```

---

## 14. Scaling Storage

Large data platforms may distribute storage across multiple nodes.

```text
Data
 |
 +---- Storage Node 1
 +---- Storage Node 2
 +---- Storage Node 3
 +---- Storage Node 4
```

Distributed systems can provide large aggregate storage capacity.

---

## 15. Scaling Compute

Compute resources can also be distributed.

```text
Large Job
   |
   +---- Worker 1
   +---- Worker 2
   +---- Worker 3
   +---- Worker 4
```

This concept becomes important when we study Apache Spark and distributed processing.

---

## 16. Scaling Strategy

Before scaling, identify the bottleneck:

```text
CPU?
RAM?
Storage?
Network?
Disk I/O?
Query Design?
Indexes?
Data Model?
```

Increasing hardware is not always the best solution.

A poorly written query may remain slow even on a larger machine.

---

## 17. Best Practices

- Measure performance before scaling.
- Identify the actual bottleneck.
- Optimize queries first where appropriate.
- Use indexes carefully.
- Consider partitioning for large tables.
- Use replicas for suitable read workloads.
- Choose shard keys carefully.
- Monitor resource utilization.
- Plan capacity based on expected growth.

---

## Interview Questions

1. What is database scaling?
2. What is vertical scaling?
3. What is horizontal scaling?
4. Difference between scaling up and scaling out?
5. What is sharding?
6. What is a shard key?
7. What is a database hotspot?
8. How can read replicas improve scalability?
9. How would you scale a vehicle telemetry database?
10. Why should bottlenecks be identified before scaling?

## Summary

Database scaling allows systems to handle increasing workloads. Vertical scaling increases the resources of existing machines, while horizontal scaling adds machines or distributes workloads across multiple nodes.