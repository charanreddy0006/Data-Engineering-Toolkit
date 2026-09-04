# Intermediate Project — Automobile Telemetry ETL

This project models a batch telemetry pipeline.

## Flow

```text
CSV
 ↓
Python validation
 ↓
ETL Job
 ↓
Database / object storage
 ↓
Quality Job
 ↓
Analytics
```

## Kubernetes objects

- Namespace
- ConfigMap
- Secret
- Job
- CronJob

## Sample rules

- required vehicle ID,
- valid event timestamp,
- speed >= 0,
- battery 0..100,
- event ID uniqueness.

## Production evolution

```text
Local CSV
   ↓
Kafka
   ↓
Flink
   ↓
Object storage
   ↓
Warehouse
```

Kubernetes can manage the processing workloads while the storage and messaging systems provide their own durability semantics.
