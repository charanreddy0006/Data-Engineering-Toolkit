# 5. Producers

A producer creates and publishes events.

## Responsibilities
- validate required fields
- serialize
- select a key
- publish
- handle transient delivery failures
- attach useful metadata

## Metadata
- event_id
- event_type
- event_time
- source
- schema_version

## Automobile
The vehicle gateway can publish telemetry keyed by `vehicle_id`.

## Design
Use stable IDs and explicit contracts. Keep individual events bounded in size and avoid embedding unnecessary sensitive data.
