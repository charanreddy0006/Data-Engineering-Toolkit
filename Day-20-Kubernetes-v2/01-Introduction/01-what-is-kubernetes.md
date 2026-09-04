# What Is Kubernetes?

Kubernetes, commonly called K8s, is an open-source platform for orchestrating containerized workloads.

It manages workloads across a cluster and provides abstractions for:

- scheduling,
- service discovery,
- scaling,
- health checking,
- rolling updates,
- rollback,
- configuration,
- storage,
- access control.

## The core idea

You declare what you want.

Example:

```yaml
spec:
  replicas: 3
```

Controllers continuously compare desired state with observed state.

```text
Desired state
      ↓
Kubernetes API
      ↓
Controllers
      ↓
Actual cluster
      ↑
      └── status
```

## What Kubernetes does not do

Kubernetes is not:

- a database,
- a data warehouse,
- a programming language,
- a streaming engine,
- automatically a complete monitoring solution,
- automatically a complete security solution.

## Data engineering

Kubernetes can run:

- Python ETL workers,
- Airflow components,
- Spark workloads,
- Flink workloads,
- APIs,
- data-quality jobs,
- scheduled aggregations.

## Automobile example

A connected vehicle sends:

```json
{
  "vehicle_id": "VH-1001",
  "timestamp": "2026-09-03T08:00:00Z",
  "speed_kph": 61.4,
  "battery_pct": 72.5
}
```

A Kubernetes platform could operate the ingestion API, stream processors and quality jobs while durable data lives in appropriate storage systems.
