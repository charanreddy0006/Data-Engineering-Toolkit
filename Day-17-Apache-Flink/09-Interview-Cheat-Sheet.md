# Flink Interview Cheat Sheet

## Beginner

### What is Flink?

A distributed processing engine designed for stateful processing of bounded
and unbounded data streams.

### Event Time vs Processing Time

```text
Event Time       = when event happened
Processing Time  = when system processed it
```

### Watermark

A mechanism representing progress through event time.

### Window

A finite computation interval over a stream.

### TaskManager

Executes tasks.

### JobManager

Coordinates job execution.

## Intermediate

### Checkpoint vs Savepoint

Checkpoint is primarily for automatic fault recovery. Savepoint is generally
a user-controlled snapshot for planned operations.

### Keyed State

State associated with individual keys.

```text
V001 → State A
V002 → State B
```

### Backpressure

Occurs when downstream operators cannot keep up with upstream production.

### Operator Chaining

Compatible operators may run in the same task to reduce overhead.

### Task Slot

A resource allocation unit within a TaskManager.

### Parallelism

Number of parallel task instances.

## Advanced

### Exactly-Once

An end-to-end processing guarantee requires compatible source, state and sink
semantics.

### Late Event Handling

Define:

```text
Watermark
Allowed Lateness
Late Output
Correction Strategy
```

### State Growth

Control through:

```text
TTL
Key Design
Window Boundaries
Cleanup
Compaction
```

### Slow Job Diagnosis

Check:

```text
CPU
Memory
Backpressure
Kafka Lag
Network Shuffle
Checkpoint Duration
State Size
Sink Throughput
```

## Flink vs Kafka

```text
Kafka = Durable Event Streaming
Flink = Stateful Stream Processing
```

## Flink vs Spark

Flink is strongly optimized for continuous stream processing and event-time
stateful applications. Spark provides a broad unified analytics platform
covering batch and streaming workloads.

## Flink vs Kafka Streams

Kafka Streams is a Kafka-native library. Flink is a distributed processing
engine with broader deployment and processing capabilities.

## Automobile Scenario

Question:

> Design a system to detect vehicle overheating within seconds.

Answer:

```text
Vehicle
  ↓
Kafka
  ↓
Flink
  ↓
Parse + Validate
  ↓
keyBy(vehicle_id)
  ↓
State / Event Time
  ↓
Temperature Rule
  ↓
Alert Topic
  ↓
Notification Service
```

Add checkpoints, monitoring, DLQ, schema validation and scalable parallelism.

## Quick Revision

```text
Flink
├── DataStream
├── Table API
├── SQL
├── Event Time
├── Watermarks
├── Windows
├── State
├── Timers
├── Checkpoints
├── Savepoints
├── Fault Tolerance
├── Kafka
├── CEP
├── Monitoring
└── Production Deployment
```
