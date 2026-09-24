# 🚗 Connected Vehicle Real-Time Intelligence Capstone

## Goal
Process telemetry, faults, location and charging events continuously and publish live operational metrics, alerts and ML features.

## Architecture

```text
Connected Vehicle
      ↓
Vehicle Gateway
      ↓
Event Broker
      ↓
Stream Processor
 ├→ Fault Alerts
 ├→ Fleet Metrics
 ├→ Online Features
 └→ Historical Storage
      ↓
Dashboard / ML / Applications
```

## Events
- vehicle.telemetry
- vehicle.faults
- vehicle.location
- vehicle.charging
- vehicle.trip

## Production Goals
Low latency, event-time correctness, scalable partitions, recovery, monitoring, security and cost control.
