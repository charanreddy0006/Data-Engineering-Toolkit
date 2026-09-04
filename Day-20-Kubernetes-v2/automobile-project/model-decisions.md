# Automobile Project Model Decisions

## Decision 1 — Separate ingestion and quality

Reason:

- different scaling,
- different lifecycle,
- independent failure handling.

## Decision 2 — Use Service for ingestion

Reason:

Pod IPs are ephemeral; consumers need a stable endpoint.

## Decision 3 — Use Job for quality

Reason:

Quality validation is run-to-completion work.

## Decision 4 — Use CronJob for scheduled summaries

Reason:

The workload has a schedule and can be represented as periodic Jobs.

## Decision 5 — Keep durable telemetry outside Pod filesystem

Reason:

Pods are ephemeral and analytical data requires durable scalable storage.

## Decision 6 — Design idempotency

Reason:

Retries can repeat processing.

## Decision 7 — Separate Kubernetes from processing engines

Reason:

Kubernetes orchestrates workloads; Kafka/Flink/Spark provide specialized data-processing capabilities.
