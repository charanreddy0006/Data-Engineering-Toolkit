# Day 16 — Apache Hive

Complete Apache Hive module for the Data Engineering Toolkit.

## Learning Path

```text
Hive Fundamentals
      ↓
Architecture
      ↓
Metastore / HiveServer2 / Beeline
      ↓
Tables / Partitions / Buckets
      ↓
File Formats / SerDe
      ↓
HiveQL
      ↓
Joins / Aggregations / Windows
      ↓
ACID / Compaction
      ↓
Execution Engines
      ↓
Optimization / Statistics / EXPLAIN
      ↓
Security
      ↓
Kafka / Spark / Airflow
      ↓
Production Architecture
      ↓
Automobile Data Warehouse
```

## Core Architecture

```text
Client
  ↓
HiveServer2
  ↓
Driver
  ↓
Compiler / Optimizer
  ↓
Metastore
  ↓
Tez / Spark
  ↓
HDFS / Object Storage
```

## Included

- 101 detailed topic folders
- Hive architecture and components
- Metastore and HiveServer2
- Beeline and HiveQL
- Managed and external tables
- Partitions and bucketing
- TextFile, SequenceFile, Avro, Parquet and ORC
- Compression and SerDe
- Hive data types
- DDL and DML
- Filtering, aggregation and window functions
- CTEs, subqueries and joins
- Views and materialized views
- ACID and compaction
- MapReduce, Tez, Spark and LLAP
- Query optimization and EXPLAIN
- Statistics and performance
- Security, Kerberos and Ranger
- Kafka, Spark and Airflow integration
- Data-lake architecture
- Automobile industry example
- Mini and end-to-end project
- SQL and Beeline examples

## Examples

```bash
pip install --upgrade pip
```

Use Beeline:

```bash
beeline -u jdbc:hive2://localhost:10000/default
```

Then execute the SQL files from `examples/`.

## Automobile Use Case

```text
Vehicle Sensors
      ↓
Kafka
      ↓
Data Lake
      ↓
Hive Metastore
      ↓
Partitioned ORC / Parquet
      ↓
HiveQL
      ↓
BI / ML / Reporting
```

## Official Documentation

https://hive.apache.org/docs/
