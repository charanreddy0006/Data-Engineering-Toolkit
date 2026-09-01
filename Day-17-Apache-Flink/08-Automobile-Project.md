# Automobile Real-Time Flink Project

## Project Goal

Build a production-inspired real-time vehicle telemetry platform using
Kafka and Flink.

## Data Flow

```text
Vehicle Sensors
      ↓
Kafka Topic
      ↓
Flink Source
      ↓
JSON Parsing
      ↓
Validation
      ↓
Event Time + Watermarks
      ↓
keyBy(vehicle_id)
      ↓
Windows + State
      ↓
+-----------+-------------+
|           |             |
Speed     Temperature    Fault
Analysis   Analysis     Detection
|           |             |
+-----------+-------------+
            ↓
      Output Streams
       /                v            v
  Alerts       Data Lake
```

## Event

```json
{
  "vehicle_id": "V001",
  "event_time": "2026-09-01T10:30:00Z",
  "speed": 118,
  "engine_temperature": 103.5,
  "fuel_level": 42,
  "latitude": 17.385,
  "longitude": 78.486
}
```

## Business Rules

### Overspeed

```text
speed > 100 km/h
```

Generate an alert.

### High Temperature

```text
engine_temperature > 100°C
```

Generate a thermal alert.

### Low Fuel

```text
fuel_level < 15%
```

Generate a fuel alert.

## Window Metrics

Every five minutes calculate:

```text
Average Speed
Maximum Speed
Maximum Temperature
Event Count
Average Fuel Level
```

## State

Maintain per-vehicle:

```text
latest speed
latest temperature
latest fuel level
alert count
```

## Invalid Events

Send invalid records to:

```text
vehicle.telemetry.dlq
```

Examples:

```text
Missing vehicle_id
Negative speed
Invalid timestamp
Temperature outside expected range
```

## Example Flink SQL

```sql
SELECT
    vehicle_id,
    AVG(speed) AS avg_speed,
    MAX(speed) AS max_speed,
    MAX(engine_temperature) AS max_temperature,
    COUNT(*) AS event_count
FROM TABLE(
    TUMBLE(
        TABLE telemetry,
        DESCRIPTOR(event_time),
        INTERVAL '5' MINUTE
    )
)
GROUP BY vehicle_id;
```

## Production Architecture

```text
                     Connected Vehicles
                            |
                            v
                       Kafka Cluster
                            |
                            v
                      Flink Cluster
                            |
       +--------------------+-------------------+
       |                    |                   |
       v                    v                   v
   Telemetry             Alerts             Enrichment
       |                    |                   |
       v                    v                   v
 Data Lake             Alert API          Reference DB
       |
       v
 Warehouse / BI / ML
```

## Reliability

Use:

- checkpoints
- durable checkpoint storage
- restart strategies
- idempotent or transactional sinks
- schema validation
- monitoring
- alerting

## Project Deliverables

```text
1. Kafka topic
2. Flink source
3. JSON parser
4. Watermark strategy
5. Windowed analytics
6. Stateful alert detection
7. DLQ
8. Kafka/Data Lake sink
9. Monitoring
10. Recovery test
```
