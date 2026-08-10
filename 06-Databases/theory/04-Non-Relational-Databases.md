# Non-Relational Databases

## 1. Introduction

Non-relational databases, commonly called NoSQL databases, store data using models other than traditional relational tables.

They were developed to support workloads where flexible schemas, high scalability, distributed architectures, or specialized access patterns are important.

Common categories include:

```text
NoSQL
│
├── Document
├── Key-Value
├── Wide-Column
└── Graph
```

## 2. Why NoSQL Exists

Relational databases are excellent for many structured workloads.

However, some systems require:

- Flexible schemas
- Horizontal scaling
- Very high write throughput
- Distributed storage
- Specialized access patterns

NoSQL systems provide alternative data models for these situations.

## 3. Document Database

MongoDB is an example.

A vehicle could be represented as:

```json
{
  "vehicle_id": 101,
  "brand": "BMW",
  "model": "X5",
  "year": 2025,
  "features": {
    "fuel": "Petrol",
    "automatic": true
  }
}
```

Different documents can contain different fields.

## 4. Key-Value Database

Redis stores information using keys and values.

```text
vehicle:101 → BMW X5
vehicle:102 → Audi Q5
```

This model is useful when the application primarily needs fast key-based access.

Common use cases:

- Caching
- Sessions
- Temporary state
- Rate limiting

## 5. Wide-Column Database

Cassandra is a common example.

It is designed for distributed systems and large-scale workloads.

A conceptual structure:

```text
Partition Key
     |
     +-- Column 1
     +-- Column 2
     +-- Column 3
```

Cassandra is often used where high availability and distributed writes are important.

## 6. Graph Database

Graph databases represent relationships directly.

```text
Customer
   |
 purchased
   |
 Vehicle
   |
 serviced_at
   |
Service Center
```

This is useful for relationship-heavy workloads.

## 7. NoSQL vs SQL

| Feature | Relational | NoSQL |
|---|---|---|
| Data model | Tables | Multiple models |
| Schema | Usually structured | Often flexible |
| Query | SQL | Technology-specific |
| Scaling | Vertical + horizontal options | Often designed for horizontal scaling |
| Relationships | Strong | Depends on database |
| Transactions | Strong support | Depends on system |

## 8. Data Modeling

NoSQL systems often model data according to application access patterns.

Instead of starting with:

```text
What tables should exist?
```

the design may start with:

```text
How will the application query the data?
```

## 9. Automobile Example

Vehicle telemetry can have rapidly changing attributes:

```json
{
  "vehicle_id": "EV001",
  "timestamp": "2026-08-10T10:30:00",
  "speed": 72,
  "battery": 84,
  "temperature": 31.5,
  "gps": {
    "lat": 22.30,
    "lon": 70.80
  }
}
```

A document-oriented system can naturally represent this structure.

## 10. Advantages

NoSQL systems can provide:

- Flexible data models
- Horizontal scalability
- High availability
- Specialized performance
- Distributed architectures

## 11. Limitations

Depending on the technology:

- Complex relationships may be harder.
- Query languages vary.
- Data consistency models differ.
- Data modeling can become application-specific.
- Some systems provide fewer traditional relational features.

## 12. Choosing NoSQL

Consider:

```text
Data Model
Query Pattern
Scale
Latency
Consistency
Availability
Distribution
```

## 13. Data Engineering Usage

NoSQL databases may appear as:

```text
Application
     |
     v
NoSQL Database
     |
     v
Data Ingestion
     |
     v
Data Lake
     |
     v
Analytics
```

## 14. Best Practices

- Choose the database based on access patterns.
- Understand consistency guarantees.
- Design for the expected scale.
- Avoid choosing NoSQL simply because the data is large.
- Understand partitioning and replication.
- Monitor database performance.

## Interview Questions

1. What is NoSQL?
2. Why were NoSQL databases developed?
3. What is a document database?
4. What is a key-value database?
5. What is a wide-column database?
6. What is a graph database?
7. SQL vs NoSQL?
8. When would you choose MongoDB?
9. When would you choose Cassandra?
10. Why is data modeling important in NoSQL systems?

## Summary

Non-relational databases provide alternative data models and scaling approaches for workloads that do not fit traditional relational database patterns.