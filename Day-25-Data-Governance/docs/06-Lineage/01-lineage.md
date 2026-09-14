# Data Lineage

## Purpose
Trace where data comes from and where it goes.

## Lineage Levels

- System lineage: system A -> system B.
- Dataset lineage: table A -> table B.
- Column lineage: source column -> target column.
- Transformation lineage: expression/business rule between them.

## Example

```text
Vehicle ECU
   |
   v
Telemetry Gateway
   |
   v
Kafka Topic: vehicle.events
   |
   v
Raw Bronze Table
   |
   v
Curated vehicle_telemetry
   |
   +--> Fleet Dashboard
   +--> Warranty Model
   +--> Maintenance Data Product
```
