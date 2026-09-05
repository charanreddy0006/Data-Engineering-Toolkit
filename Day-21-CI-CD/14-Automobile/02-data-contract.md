# Automotive Telemetry Data Contract

Example fields:

```text
event_id        string required
vehicle_id      string required
timestamp       datetime required
speed_kph       float required
battery_pct     float optional
engine_temp_c   float optional
```

## Rules

```text
speed_kph >= 0
battery_pct between 0 and 100
```

## Breaking changes

- remove required field,
- change type,
- make optional field required.

## CI

```text
producer
 ↓
contract test
 ↓
consumer
 ↓
compatibility
```

A connected-vehicle platform can have many consumers, so schema evolution must be deliberate.
