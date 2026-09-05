# Data Contracts in CI/CD

A data contract defines producer/consumer expectations.

Example:

```text
event_id        string required
vehicle_id      string required
timestamp       datetime required
speed_kph       float required
battery_pct     float optional
```

## Potentially breaking changes

- changing data type,
- removing a field,
- making optional data required.

## CI

```text
producer
 ↓
contract check
 ↓
consumer
 ↓
compatibility test
```

## Automobile example

Telemetry may feed:

```text
alerts
warehouse
ML
service analytics
```

A contract test prevents a producer change from silently breaking downstream systems.
