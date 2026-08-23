# 05 — Data Lake Architecture

## Reference Architecture

```text
+--------------------+
| Data Sources       |
| DB | API | IoT |Log|
+---------+----------+
          |
          v
+--------------------+
| Ingestion          |
| Batch | CDC | Kafka|
+---------+----------+
          |
          v
+--------------------+
| Raw / Bronze       |
+---------+----------+
          |
          v
+--------------------+
| Processing         |
| Spark / Flink      |
+---------+----------+
          |
          v
+--------------------+
| Processed / Silver |
+---------+----------+
          |
          v
+--------------------+
| Curated / Gold     |
+---------+----------+
          |
     +----+----+
     |         |
    BI         ML
```

## Supporting Services

A production lake also needs:

- Catalog
- Metadata
- Data quality
- Governance
- Security
- Lineage
- Monitoring
- Cost management
- Backup and recovery

## Design Principle

Storage should be separated from compute where possible. This allows
processing engines to scale independently from the underlying data.

## Automobile Architecture

Vehicle sensors produce events that are streamed into Kafka. A streaming
processor validates and transforms events before writing optimized data to
the lake. Curated tables are consumed by dashboards and ML pipelines.
