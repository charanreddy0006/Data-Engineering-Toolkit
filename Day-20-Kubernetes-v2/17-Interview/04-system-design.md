# Kubernetes System Design — Connected Vehicle Platform

## Requirement

Process telemetry from a large vehicle fleet.

## Architecture

```text
Vehicles
   ↓
API Gateway
   ↓
Telemetry API
   ↓
Kafka
   ↓
Flink
   ├── Real-time alerts
   ├── Raw object storage
   └── Aggregations
            ↓
        Warehouse
            ↓
         BI/API
```

## Kubernetes-managed workloads

- telemetry API Deployment,
- worker Deployments,
- quality Jobs,
- scheduled aggregation CronJobs,
- Services,
- configuration,
- RBAC,
- autoscaling.

## Reliability

Use:

- multiple replicas,
- readiness/liveness/startup probes,
- resource requests,
- graceful shutdown,
- idempotent processing,
- centralized observability,
- tested rollback.

## Security

Use:

- least-privilege RBAC,
- dedicated ServiceAccounts,
- secret management,
- NetworkPolicy,
- image scanning,
- encryption,
- audit logs.

## Storage

Raw telemetry should use durable storage appropriate for analytics rather than relying on Pod filesystems.

## Interview conclusion

Kubernetes is the orchestration layer. Kafka, Flink, object storage and the warehouse each retain their specialized responsibilities.
