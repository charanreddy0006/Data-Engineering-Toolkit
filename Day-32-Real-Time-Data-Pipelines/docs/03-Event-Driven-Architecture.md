# 3. Event-Driven Architecture

Components communicate through events instead of tightly coupling services directly.

```text
Vehicle
  ↓
vehicle.telemetry
  ↓
Event Broker
  ├── Fleet Dashboard
  ├── Fault Detection
  ├── Feature Pipeline
  └── Historical Storage
```

## Benefits
- loose coupling
- independent consumers
- asynchronous processing
- scalable fan-out

## Event contract
```json
{
  "event_id":"E1001",
  "vehicle_id":"V1001",
  "event_type":"vehicle_fault",
  "event_time":"2026-09-24T10:05:00Z"
}
```

Producers and consumers should depend on documented contracts rather than internal implementation details.
