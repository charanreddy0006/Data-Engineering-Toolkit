# Data Contracts

A data contract is an explicit agreement between producers and consumers covering schema, semantics, quality, ownership, and delivery expectations.

Example:

```yaml
dataset: vehicle_telemetry
version: 2
owner: connected-vehicle-platform

fields:
  event_id:
    type: string
    required: true
    unique: true
  vehicle_id:
    type: string
    required: true
  speed_kmh:
    type: number
    min: 0
    max: 350

sla:
  freshness_minutes: 5
```

Benefits:

- fewer surprise changes
- producer accountability
- clearer semantics
- automated compatibility tests
- faster feedback

```text
Producer -> Contract Test -> Pass -> Publish
                         \
                          -> Fail -> Reject/Quarantine
```
