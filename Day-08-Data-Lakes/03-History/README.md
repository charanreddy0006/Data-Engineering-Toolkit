# 03 — History of Data Lakes

## Evolution

### Stage 1 — Operational Databases

Applications primarily stored data in transactional databases.

### Stage 2 — Data Warehouses

Organizations created analytical warehouses for structured reporting.

### Stage 3 — Big Data

Large datasets introduced distributed systems such as Hadoop and HDFS.

### Stage 4 — Cloud Object Storage

Cloud platforms made highly scalable object storage available without managing
large physical clusters directly.

### Stage 5 — Data Lake Processing

Engines such as Spark enabled large-scale processing over files in storage.

### Stage 6 — Streaming

Kafka and streaming engines enabled continuous event ingestion and processing.

### Stage 7 — Lakehouse

Table formats such as Iceberg, Delta Lake, and Hudi added features such as
transactions, schema evolution, snapshots, and reliable table management.

## Evolution

```text
Databases
   |
Warehouses
   |
Hadoop / HDFS
   |
Cloud Data Lakes
   |
Lakehouse Architecture
```

The modern data platform often combines several of these technologies instead
of completely replacing one with another.
