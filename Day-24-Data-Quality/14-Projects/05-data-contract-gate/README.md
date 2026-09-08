# Project 5 — Data Contract Quality Gate

Create a producer-facing contract for vehicle telemetry.

Require:

```text
event_id
vehicle_id
event_time
speed_kmh
```

Enforce:

```text
speed 0..350
event_id unique
vehicle_id non-null
event_time valid
```

Failing records are rejected or quarantined with actionable feedback.

This demonstrates preventive quality engineering.
