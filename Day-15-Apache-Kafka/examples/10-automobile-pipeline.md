# Automobile Kafka Pipeline

```text
Vehicle Sensors
      |
      v
Kafka Producers
      |
      v
Kafka Cluster
      |
 +----+----------+----------+
 |               |          |
 v               v          v
Telemetry       Alerts    Faults
Topic           Topic     Topic
 |
 v
Spark / Flink
 |
 +----------+-----------+
 |                      |
 v                      v
Data Lake             Alerts
 |
 v
Warehouse
 |
 v
BI / ML
```

Use `vehicle_id` as the key when per-vehicle ordering is required.

Monitor:
- consumer lag
- under-replicated partitions
- offline partitions
- broker disk usage
- producer errors
- consumer errors
- request latency
