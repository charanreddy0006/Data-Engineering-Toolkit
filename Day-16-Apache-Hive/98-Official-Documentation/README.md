# 98 Official Documentation

> Day 16 — Apache Hive | Data Engineering Toolkit

## What You Learn

This topic is part of the Day 16 Apache Hive module. The goal is to understand
how Hive provides SQL-oriented analytics over large datasets stored in HDFS
or cloud/object storage.

## Architecture

```text
Users / BI / Applications
            |
            v
       HiveServer2
            |
            v
          Driver
            |
      +-----+------+
      |            |
      v            v
  Compiler      Metastore
      |
      v
   Optimizer
      |
      v
Execution Engine
   |        |
   v        v
  Tez      Spark
   |        |
   +----+---+
        |
        v
 HDFS / Object Storage
```

## Core Ideas

Hive separates **metadata** from **data**. The Metastore describes databases,
tables, columns, partitions, locations and storage formats. The actual data
normally remains in files.

For analytical workloads, Hive commonly works with partitioned columnar
formats such as ORC and Parquet.

```text
Table Metadata
     |
     v
Metastore
     |
     +---- schema
     +---- partitions
     +---- location
     +---- format

Actual Records
     |
     v
HDFS / Object Storage
```

## Automobile Example

Connected vehicles continuously produce telemetry.

```json
{
  "vehicle_id": "V001",
  "event_time": "2026-08-31T10:30:00Z",
  "speed": 72,
  "engine_temperature": 91.2,
  "fuel_level": 61
}
```

A Hive table can organize this data by date:

```text
vehicle_events/
  event_date=2026-08-29/
  event_date=2026-08-30/
  event_date=2026-08-31/
```

Query:

```sql
SELECT vehicle_id,
       AVG(speed) AS average_speed,
       MAX(engine_temperature) AS max_temperature
FROM vehicle_events
WHERE event_date = '2026-08-31'
GROUP BY vehicle_id;
```

Partition pruning allows Hive to avoid scanning unrelated dates.

## Practical Commands

```sql
SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS automobile_dw;

USE automobile_dw;

SHOW TABLES;

DESCRIBE vehicle_events;

DESCRIBE FORMATTED vehicle_events;
```

## Example Table

```sql
CREATE EXTERNAL TABLE vehicle_events (
    vehicle_id STRING,
    event_time TIMESTAMP,
    speed DOUBLE,
    engine_temperature DOUBLE,
    fuel_level DOUBLE
)
PARTITIONED BY (event_date DATE)
STORED AS PARQUET
LOCATION '/data/automobile/vehicle_events';
```

## Performance Notes

For large Hive workloads:

- partition using useful filtering columns
- avoid high-cardinality partitions
- prefer columnar formats for analytics
- avoid unnecessary columns
- collect useful statistics
- inspect plans with EXPLAIN
- reduce small-file creation
- choose appropriate join strategies
- measure before changing configuration

## Common Mistakes

1. Treating Hive like an OLTP database.
2. Creating a partition for every vehicle.
3. Generating huge numbers of tiny files.
4. Using `ORDER BY` when global sorting is unnecessary.
5. Ignoring partition pruning.
6. Selecting every column for every query.
7. Forgetting that the Metastore contains metadata, not the actual data.
8. Ignoring security and access control.

## Interview Questions

1. What is Apache Hive?
2. What is the Hive Metastore?
3. Hive managed table vs external table?
4. What is partition pruning?
5. Partitioning vs bucketing?
6. ORC vs Parquet?
7. What is a SerDe?
8. What is Tez?
9. What is the Hive execution flow?
10. How would you optimize a slow Hive query?

## Key Takeaways

```text
Hive       -> SQL analytics
Metastore  -> Metadata
HiveServer2-> Client service
Partition  -> Data organization
Bucket     -> Hash distribution
ORC        -> Columnar format
Parquet    -> Columnar format
Tez/Spark  -> Execution engines
EXPLAIN    -> Query-plan inspection
```

## Practice Task

Create an automobile telemetry table, load sample data, partition it by date,
and write queries that calculate average speed, maximum engine temperature,
event counts, and vehicle-level statistics.

## Production Mindset

A professional Hive deployment needs more than SQL. It requires storage
design, metadata management, file-size management, security, monitoring,
data-quality checks, workload scheduling and recovery procedures.

The correct implementation depends on the Hive version, Hadoop distribution,
execution engine and storage platform being used.
