# Kubernetes in Data Engineering

Kubernetes is an orchestration layer, not a replacement for data-processing engines.

## Batch

```text
CronJob
   ↓
Python ETL Job
   ↓
Object storage / DB
   ↓
Quality Job
```

## Streaming

```text
Producers
   ↓
Kafka
   ↓
Flink / Spark Streaming
   ↓
Lake / Warehouse
```

## Common workloads

- Python ETL
- dbt jobs
- Airflow tasks
- Spark jobs
- Flink jobs
- quality checks
- API services

## Responsibility boundary

```text
Kubernetes → scheduling/lifecycle/networking
Kafka      → event transport
Flink      → stream processing
Spark      → distributed computation
PostgreSQL → relational operational storage
Object store → durable analytical/raw storage
Airflow    → workflow orchestration
```

A production data platform may use several of these together.
