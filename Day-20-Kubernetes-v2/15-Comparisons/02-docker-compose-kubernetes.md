# Docker Compose vs Kubernetes

## Compose

Excellent for local multi-container development.

```text
Python ETL
PostgreSQL
Kafka
```

can be described in one Compose project.

## Kubernetes

Designed for cluster orchestration and provides:

- scheduling,
- reconciliation,
- controllers,
- scaling,
- rolling deployment,
- service abstraction,
- cluster resource management.

## Typical workflow

```text
Local development → Compose
Cluster deployment → Kubernetes
```

This is a common pattern, not a mandatory rule.

## Data engineering

Compose can provide a laptop environment.

Kubernetes can provide a cluster environment for:

```text
ETL workers
quality jobs
APIs
stream processors
scheduled workloads
```
