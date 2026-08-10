# Types of Databases

## 1. Introduction

Different applications require different ways of storing and accessing data.

Database systems can therefore be classified into several categories.

The major categories include:

```text
Databases
│
├── Relational
│
├── Document
│
├── Key-Value
│
├── Wide-Column
│
├── Graph
│
└── Search / Specialized
```

## 2. Relational Databases

Relational databases store structured data in tables.

Examples:

- PostgreSQL
- MySQL
- Oracle
- SQL Server
- SQLite

Example:

```text
vehicles

vehicle_id | brand | model
-----------|-------|-------
101        | BMW   | X5
102        | Audi  | Q5
```

Relational databases commonly use SQL.

## 3. Document Databases

Document databases store data as documents, commonly JSON-like structures.

Example:

```json
{
  "vehicle_id": 101,
  "brand": "BMW",
  "model": "X5",
  "features": {
    "fuel": "Petrol",
    "automatic": true
  }
}
```

Example technology:

```text
MongoDB
```

Document databases are useful when data structures vary or evolve frequently.

## 4. Key-Value Databases

Data is stored as key-value pairs.

```text
Key              Value
-------------------------
vehicle:101      BMW X5
vehicle:102      Audi Q5
```

Example:

```text
Redis
```

They are commonly used for:

- Caching
- Sessions
- Fast lookups
- Temporary data

## 5. Wide-Column Databases

Wide-column databases organize data using rows and flexible columns.

Examples:

```text
Apache Cassandra
Google Bigtable
```

They are useful for large-scale distributed workloads.

## 6. Graph Databases

Graph databases represent:

- Nodes
- Relationships
- Properties

Example:

```text
Customer
   |
   | purchased
   v
Vehicle
   |
   | serviced at
   v
Service Center
```

Graph databases are useful when relationships are central to the application.

## 7. Search Databases

Search-oriented systems are optimized for text search and analytics.

Example:

```text
Elasticsearch
```

They are useful for:

- Log analysis
- Text search
- Observability
- Application search

## 8. Time-Series Databases

Time-series databases are optimized for data recorded over time.

Example:

```text
timestamp           speed
2026-08-10 10:00    65
2026-08-10 10:01    68
2026-08-10 10:02    72
```

This is useful for:

- IoT
- Vehicle sensors
- Monitoring
- Industrial systems

## 9. In-Memory Databases

In-memory databases keep frequently accessed data in memory for very fast access.

Redis is commonly used for this purpose.

Example:

```text
Application
     |
     v
Redis Cache
     |
     v
Database
```

## 10. OLTP Databases

OLTP systems handle operational transactions.

Examples:

```text
Customer registration
Vehicle purchase
Payment
Service booking
```

Characteristics:

- Many small transactions
- Frequent updates
- Low latency
- Strong consistency requirements

## 11. OLAP Systems

OLAP systems are designed for analytical workloads.

Example:

```text
Sales
   |
   v
Data Warehouse
   |
   v
BI Dashboard
```

They handle large analytical queries.

## 12. Comparison

| Type | Example | Typical Use |
|---|---|---|
| Relational | PostgreSQL | Structured data |
| Document | MongoDB | Flexible documents |
| Key-Value | Redis | Caching |
| Wide-Column | Cassandra | Distributed workloads |
| Graph | Neo4j | Relationships |
| Search | Elasticsearch | Search/logs |
| Time-Series | InfluxDB | Sensor data |

## 13. Choosing a Database

Selection depends on:

```text
Data Structure
+
Query Pattern
+
Scale
+
Consistency
+
Latency
+
Availability
+
Cost
```

## 14. Automobile Example

Different automobile workloads may use different databases:

```text
Vehicle Sales
      ↓
PostgreSQL

Vehicle Sensor Data
      ↓
Time-Series / Distributed Database

Application Cache
      ↓
Redis

Vehicle Search
      ↓
Elasticsearch
```

## Interview Questions

1. What are the major database types?
2. What is a relational database?
3. What is a document database?
4. What is a key-value database?
5. Why is Redis used?
6. What is a wide-column database?
7. What is a graph database?
8. How would you select a database for vehicle sensor data?

## Summary

There is no single database that is ideal for every workload. Database selection should be based on data structure, access patterns, scale, consistency, latency, and business requirements.