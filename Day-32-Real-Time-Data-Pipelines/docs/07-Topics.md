# 7. Topics

A topic is a logical stream/category of events.

## Automobile topics
```text
vehicle.telemetry
vehicle.faults
vehicle.trips
vehicle.charging
vehicle.location
```

## Design
Group events by business domain and consumption pattern.

Avoid one giant topic called `everything`, which makes contracts and ownership difficult.

## Retention
Retention should reflect replay, auditing and storage requirements.

## Governance
Each important topic should document owner, schema, key, retention and allowed consumers.
