# Apache Flink Fundamentals

Apache Flink is a distributed processing framework designed for stateful
processing of bounded and unbounded data streams.

## Why It Matters

Modern systems continuously produce data:

```text
IoT → Kafka → Events → Processing → Alerts
```

A batch-oriented design waits for a dataset to finish. A streaming design
processes records as they arrive.

Flink is designed for continuous processing while preserving useful concepts
such as state, event time, windows and fault tolerance.

## Key Concepts

### Stream

A stream is a sequence of records.

```text
E1 → E2 → E3 → E4 → E5 → ...
```

### Bounded Stream

A bounded stream has an end:

```text
E1 → E2 → E3 → END
```

### Unbounded Stream

An unbounded stream continuously receives events:

```text
E1 → E2 → E3 → E4 → ... → ∞
```

### Stateful Processing

State remembers information between events.

```text
V001: 60
V001: 70
V001: 72

State:
latest_speed = 72
```

### Event Time

Event time represents when an event actually happened.

### Processing Time

Processing time represents when Flink processes the event.

## Simple Example

```java
DataStream<String> events = env.fromElements(
    "V001,72",
    "V002,85",
    "V001,90"
);

events
    .filter(event -> event.contains("V001"))
    .print();
```

## Automobile Example

A vehicle sends:

```json
{
  "vehicle_id": "V001",
  "speed": 118,
  "temperature": 103.5
}
```

Flink can continuously determine whether the vehicle is overspeeding or
experiencing a thermal problem.

## Advantages

- Stateful stream processing
- Event-time processing
- Watermarks
- Windowing
- Checkpoint-based recovery
- Scalable distributed execution
- Kafka integration
- SQL and Table API

## Limitations

- Distributed deployment is operationally complex.
- State requires careful capacity planning.
- Incorrect watermark configuration can affect correctness.
- External sink semantics must be designed separately.

## Remember

```text
Flink = Distributed + Stateful + Stream Processing
```
