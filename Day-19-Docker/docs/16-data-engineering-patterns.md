# 16 — Docker Patterns for Data Engineering

## Pattern 1 — Local Database

```text
Developer
 ↓
Compose
 ↓
PostgreSQL
```

## Pattern 2 — ETL + Database

```text
Python ETL
 ↓
PostgreSQL
```

## Pattern 3 — Scheduler + Job

```text
Scheduler
 ↓
Containerized ETL
 ↓
Warehouse
```

An orchestrator can launch containerized jobs.

## Pattern 4 — Streaming

```text
Producer
 ↓
Kafka
 ↓
Flink / Spark
 ↓
Sink
```

Docker can package local development components.

## Pattern 5 — Quality

```text
Raw
 ↓
Transform
 ↓
Quality
 ↓
Trusted
```

## Pattern 6 — Build Once

```text
Source
 ↓
Image
 ↓
Test
 ↓
Registry
 ↓
Deployment
```

## Idempotency

A retry should not corrupt data.

Techniques:

- event IDs
- unique constraints
- staging
- upserts
- merge
- deduplication
- batch IDs

## Failure Classification

```text
Temporary network error → retry
Temporary DB outage → retry
Invalid schema → fail
Bad business record → quarantine
Authentication error → alert/fail
```

## Container Boundaries

Separate services when they have independent:

- deployment
- scaling
- ownership
- security
- failure behavior

Do not create a container for every small function without an architectural reason.

## Automobile Architecture

```text
Vehicle
 ↓
Gateway
 ↓
Kafka
 ↓
Streaming Processor
 ↓
Lakehouse
 ↓
Warehouse
 ↓
BI / ML
```

A Docker-based local environment can simulate smaller parts of this architecture.
