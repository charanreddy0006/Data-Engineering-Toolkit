# Flink Architecture

## High-Level Architecture

```text
                  Client
                    |
                    v
              JobManager
                    |
          +---------+---------+
          |                   |
          v                   v
     TaskManagers        Checkpoint Storage
          |
    +-----+-----+
    |     |     |
  Slot  Slot  Slot
    |
    v
 Operators
    |
    v
 Sources / Processing / Sinks
```

## JobManager

The JobManager coordinates execution.

Major responsibilities include:

- accepting jobs
- building execution plans
- scheduling tasks
- coordinating checkpoints
- handling recovery
- coordinating resources

## TaskManager

TaskManagers execute the actual processing work.

```text
TaskManager
├── Slot 1
├── Slot 2
├── Slot 3
└── Slot 4
```

## Dispatcher

The Dispatcher provides job submission and REST/Web UI services in relevant
deployment architectures.

## ResourceManager

The ResourceManager manages available processing resources and task slots.

## Task Slot

A task slot is a unit of resource allocation inside a TaskManager.

More slots allow more task instances to share a TaskManager, subject to CPU,
memory and workload requirements.

## Operator Graph

A Flink program becomes a logical graph:

```text
Kafka Source
     ↓
Deserialize
     ↓
Filter
     ↓
keyBy(vehicle_id)
     ↓
Window
     ↓
Aggregate
     ↓
Kafka Sink
```

The runtime transforms this logical graph into executable tasks.

## Parallelism

```text
Source
 ├── Task 1
 ├── Task 2
 ├── Task 3
 └── Task 4
```

Parallelism should match available resources and source partitioning.

## Network Shuffle

Operations such as `keyBy` may redistribute records.

```text
T1 ──┐
T2 ──┼── Network Shuffle ──> Keyed Tasks
T3 ──┤
T4 ──┘
```

Shuffles can become expensive because they use network bandwidth.

## Production Considerations

Plan for:

- high availability
- durable checkpoint storage
- resource limits
- metrics
- logs
- security
- deployment automation
- disaster recovery

## Summary

```text
JobManager = Coordination
TaskManager = Execution
Slot = Resource Unit
Operator = Processing Logic
Checkpoint = Recovery State
```
