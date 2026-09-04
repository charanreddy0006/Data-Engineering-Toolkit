# Connected Vehicle Kubernetes Architecture

## Event

```json
{
  "event_id": "evt-10001",
  "vehicle_id": "VH-2048",
  "timestamp": "2026-09-03T08:10:22Z",
  "speed_kph": 61.4,
  "battery_pct": 72.5,
  "engine_temp_c": 91.2
}
```

## Architecture

```text
Vehicles
   ↓
API Gateway
   ↓
Telemetry Ingestion Deployment
   ↓
Kafka
   ↓
Flink / Spark
   ├── Alerts
   ├── Raw lake
   └── Aggregations
             ↓
       Analytics DB
             ↓
          BI/API
```

## Kubernetes objects

```text
Ingestion API → Deployment
API endpoint   → Service
Stream engine  → Deployment/operator/platform
Quality        → Job
Daily metrics  → CronJob
Config         → ConfigMap
Credentials    → Secret
Access         → RBAC
```

## Scaling

During a fleet traffic spike:

```text
API replicas:
3 → 6 → 12
```

But scaling should be driven by measurements and bottlenecks.

## Durable data

Do not depend on Pod filesystem for the telemetry data lake.

Use appropriate durable systems such as object storage, databases or streaming infrastructure.
