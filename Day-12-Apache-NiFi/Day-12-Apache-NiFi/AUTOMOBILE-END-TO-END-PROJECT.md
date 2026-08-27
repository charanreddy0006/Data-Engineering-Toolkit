# Automobile Connected Vehicle — Apache NiFi Project

## Objective

Build a production-inspired data-flow pipeline for connected vehicles.

## Input Event

```json
{
  "vehicle_id": "V001",
  "timestamp": "2026-08-27T10:30:00Z",
  "speed": 72,
  "engine_temperature": 91.2,
  "fuel_level": 61
}
```

## Complete Flow

```text
Vehicle Sensors
      |
      v
     Kafka
      |
      v
 ConsumeKafka
      |
      v
 ValidateRecord
      |
      v
 UpdateAttribute
      |
      v
 RouteOnAttribute
      |
      +------------------+
      |                  |
      v                  v
    VALID              INVALID
      |                  |
      v                  v
 Enrichment         Error Storage
      |
      v
 Data Lake
      |
      v
 Spark / dbt
      |
      v
 Warehouse
      |
      v
 Power BI / ML
```

## Quality Rules

```text
vehicle_id         -> required
timestamp          -> required
speed              -> >= 0
fuel_level         -> valid range
engine_temperature -> valid range
```

## Operational Requirements

- preserve invalid events
- add ingestion timestamp
- add source metadata
- configure backpressure
- configure controlled retries
- monitor failures
- secure credentials
- version flows
- separate environments

## Expected Result

The project demonstrates how NiFi can act as the integration and data-flow
layer inside a larger modern data engineering architecture.
