# 29. Apache Flink

Flink is a stream-processing engine with strong support for event-time processing, state and checkpoints.

## Core concepts
- streams
- state
- windows
- watermarks
- checkpoints

## Architecture
```text
Kafka → Flink → State → Sink
```

## Automobile
Use keyed vehicle streams to maintain rolling health metrics.

The right engine depends on workload, team skills, existing stack and operational requirements.
