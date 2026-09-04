# Spark, Flink and Kafka on Kubernetes

## Kafka

Provides event transport and durable buffering according to its architecture.

## Flink

Supports stateful stream processing and event-time-oriented workloads.

## Spark

Supports large-scale distributed computation and streaming workloads.

## Kubernetes

Provides infrastructure orchestration around these systems.

```text
Kafka
  ↓
Flink
  ↓
Object storage
  ↓
Warehouse
       ↑
   Kubernetes
```

## Do not confuse roles

Kubernetes does not transform records.

It does not replace Kafka's partition/log semantics.

It does not replace Spark's distributed execution model.

It does not replace Flink's state/checkpoint processing model.

It manages the workloads and infrastructure interfaces around them.

## Automobile example

```text
Vehicle events
     ↓
Kafka
     ↓
Flink
 ├── critical alerts
 ├── trip aggregation
 └── raw sink
```

Kubernetes can run the ingestion and processing components.
