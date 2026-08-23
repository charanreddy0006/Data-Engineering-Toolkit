# 35 — Data Lineage

Data lineage describes where data originated and how it changed.

## Example

```text
Vehicle Sensor
      |
      v
Kafka Topic
      |
      v
Raw Telemetry
      |
      v
Spark Transformation
      |
      v
Curated Vehicle Health
      |
      v
Dashboard
```

## Types

### Dataset Lineage

Tracks datasets between systems.

### Column Lineage

Tracks individual fields.

Example:

```text
raw.battery
   |
   v
processed.battery
   |
   v
vehicle_health.battery_average
```

## Benefits

- Debugging
- Impact analysis
- Auditing
- Governance
- Trust

If a source field changes, lineage helps identify downstream datasets that may
be affected.
