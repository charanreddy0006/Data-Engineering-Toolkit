# Databases for Data Engineering

Databases are one of the core components of modern Data Engineering systems.

Data Engineers use databases to store, organize, query, process, and serve data for applications, analytics, reporting, and data pipelines.

## Learning Objectives

This module covers:

- Database fundamentals
- Database types
- Relational databases
- NoSQL databases
- Database architecture
- Tables, rows, and columns
- Keys and constraints
- Indexes
- Transactions
- ACID properties
- Normalization
- Database schemas
- OLTP and OLAP
- Replication
- Partitioning
- Scaling
- Backup and recovery
- Database security
- Performance optimization

## Databases Covered

```text
Relational
├── PostgreSQL
├── MySQL
└── SQLite

NoSQL
├── MongoDB
├── Cassandra
├── Redis
└── Elasticsearch
```

## Data Engineering Role

A typical pipeline may use databases like:

```text
Source Systems
      |
      v
Ingestion
      |
      v
Operational Database
      |
      v
ETL / ELT
      |
      v
Data Warehouse / Lakehouse
      |
      v
Analytics
```

## Automobile Example

Vehicle-related systems can generate data such as:

- Vehicle information
- Customer information
- Sales transactions
- GPS coordinates
- Sensor readings
- Battery information
- Service records
- Spare parts
- Charging sessions

Example:

```text
Vehicle
   |
   +---- Sensor Data
   |
   +---- Service History
   |
   +---- GPS Data
   |
   +---- Sales
   |
   +---- Charging
```

## Module Structure

```text
theory/
examples/
datasets/
mini-project/
resources/
```

## Mini Project

The module includes a Vehicle Sales Database that demonstrates:

- Database design
- Tables
- Relationships
- Keys
- Constraints
- Queries
- Indexes
- Transactions

## Outcome

After completing this module, you should understand how databases fit into modern Data Engineering architectures and how to select the appropriate database technology for different workloads.