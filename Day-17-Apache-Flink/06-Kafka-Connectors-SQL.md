# Kafka, Connectors and Flink SQL

## Kafka Integration

A common architecture is:

```text
Vehicle
  ↓
Kafka
  ↓
Flink
  ↓
Kafka / Data Lake / Database
```

Kafka provides durable event transport while Flink performs computation.

## Kafka Source

Conceptually:

```java
DataStream<String> input = ...;
```

The production implementation should use the Kafka connector compatible with
the selected Flink version.

## Kafka Sink

Results can be written to another topic:

```text
Flink
 ↓
vehicle.alerts
```

## JDBC

Flink can write results to relational systems.

```text
Flink
 ↓
JDBC
 ↓
PostgreSQL
```

Batching and database capacity must be planned for high-volume workloads.

## Filesystem

Streaming output can be written to:

```text
S3
HDFS
Object Storage
Local Filesystem
```

Partitioning by date is common:

```text
events/
  event_date=2026-09-01/
  event_date=2026-09-02/
```

## CDC

Change Data Capture converts database changes into events.

```text
PostgreSQL
    ↓
   CDC
    ↓
  Kafka
    ↓
  Flink
```

This is useful for real-time enrichment.

## Flink SQL

Flink SQL gives a declarative interface.

```sql
SELECT
    vehicle_id,
    COUNT(*) AS events,
    AVG(speed) AS avg_speed
FROM telemetry
GROUP BY vehicle_id;
```

## Table Definition

Conceptually:

```sql
CREATE TABLE telemetry (
    vehicle_id STRING,
    event_time TIMESTAMP(3),
    speed DOUBLE,
    WATERMARK FOR event_time AS
        event_time - INTERVAL '10' SECOND
) WITH (...);
```

## Temporal Join

A temporal join can enrich an event using reference data valid at a
particular time.

```text
Telemetry Event
      +
Historical Vehicle Metadata
      ↓
Enriched Event
```

## Window SQL

```sql
SELECT
    window_start,
    window_end,
    vehicle_id,
    AVG(speed) AS avg_speed
FROM TABLE(
    TUMBLE(
        TABLE telemetry,
        DESCRIPTOR(event_time),
        INTERVAL '5' MINUTE
    )
)
GROUP BY window_start, window_end, vehicle_id;
```

Exact SQL syntax can vary by Flink version.

## Schema Evolution

Example:

```text
Version 1:
vehicle_id
speed

Version 2:
vehicle_id
speed
fuel_level
```

Production pipelines should define compatibility rules before schema changes.

## Best Practices

- Pin connector versions.
- Use compatible serialization formats.
- Validate schemas.
- Monitor Kafka lag.
- Make sink writes resilient.
- Test restart behavior.
