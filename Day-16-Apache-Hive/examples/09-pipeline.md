# Automobile Hive Pipeline

```text
Vehicle Sensors
      |
      v
Kafka
      |
      v
Data Lake
      |
      v
Hive Metastore
      |
      v
Partitioned ORC / Parquet
      |
      v
HiveQL
      |
 +----+---------+
 |              |
 v              v
BI             ML
```

Recommended partition:
`event_date`

Recommended analytical formats:
`ORC` or `Parquet`

Monitor:
- query latency
- partition count
- file count
- file sizes
- shuffle volume
- Metastore health
