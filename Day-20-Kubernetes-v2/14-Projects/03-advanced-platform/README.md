# Advanced Project — Production-Oriented Vehicle Data Platform

## Architecture

```text
Vehicles
   ↓
Gateway
   ↓
Telemetry API
   ↓
Kafka
   ↓
Flink / Spark
   ├── alerts
   ├── raw lake
   └── aggregates
            ↓
       warehouse/API
```

## Kubernetes responsibilities

| Workload | Kubernetes object |
|---|---|
| API | Deployment |
| Worker | Deployment |
| Scheduled quality | CronJob |
| Backfill | Job |
| Internal endpoint | Service |
| Configuration | ConfigMap |
| Credentials | Secret |
| Scaling | HPA |
| Identity | ServiceAccount |
| Permissions | RBAC |

## Production checklist

- image versions are intentional,
- images are scanned,
- applications run as non-root where possible,
- resources are defined,
- probes are configured,
- secrets are externalized,
- RBAC follows least privilege,
- NetworkPolicies are considered,
- logs and metrics are centralized,
- rollback is tested,
- backups and recovery are documented,
- ETL writes are idempotent.

## Important

Kubernetes should not be the reason to operate every dependency yourself.

Managed databases, object storage and managed streaming services can reduce operational burden when appropriate.
