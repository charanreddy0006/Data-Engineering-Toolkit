# Automobile Telemetry Kubernetes Project 🚗

## Objective

Build a portfolio-grade Kubernetes project around connected-vehicle telemetry.

## Architecture

```text
Vehicles
   ↓
Telemetry API
   ↓
Kafka
   ↓
Flink
   ├── alerts
   ├── raw data lake
   └── aggregates
            ↓
       PostgreSQL/Warehouse
            ↓
           BI/API
```

## Kubernetes layer

```text
telemetry-api     → Deployment
telemetry-service → Service
quality-check     → Job
daily-summary     → CronJob
config            → ConfigMap
credentials       → Secret
access            → RBAC
scaling           → HPA
```

## Domain data

Signals:

- speed,
- battery percentage,
- engine temperature,
- odometer,
- GPS,
- diagnostic codes.

## Sample event

```json
{
  "event_id": "evt-20001",
  "vehicle_id": "VH-5001",
  "timestamp": "2026-09-03T10:20:00Z",
  "speed_kph": 68.2,
  "battery_pct": 76.1,
  "engine_temp_c": 92.0
}
```

## Portfolio questions

Be ready to explain:

- Why Deployment?
- Why Service?
- Why Job/CronJob?
- How would you scale ingestion?
- What happens if a Pod fails?
- Where is durable telemetry stored?
- How are secrets protected?
- How would you prevent duplicate events?
- How would you monitor lag and failures?
