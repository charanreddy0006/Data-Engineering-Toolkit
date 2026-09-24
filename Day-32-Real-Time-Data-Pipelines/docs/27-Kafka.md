# 27. Kafka

Kafka is a distributed event streaming platform commonly used as the durable broker layer in real-time pipelines.

## Concepts
- producer
- topic
- partition
- offset
- consumer
- consumer group
- retention

## Flow
```text
Producer → Kafka Topic → Consumer Group → Processor
```

## Automobile topics
`vehicle.telemetry`, `vehicle.faults`, `vehicle.charging`.

Use current official Kafka documentation for version-specific configuration.
