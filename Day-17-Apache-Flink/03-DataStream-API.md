# DataStream API

The DataStream API provides programmatic stream processing.

## Basic Program

```java
StreamExecutionEnvironment env =
    StreamExecutionEnvironment.getExecutionEnvironment();

DataStream<String> input =
    env.fromElements("A", "B", "C");

input
    .map(String::toLowerCase)
    .filter(value -> !value.isEmpty())
    .print();

env.execute("Basic Flink Job");
```

## Main Operators

```text
map
flatMap
filter
keyBy
reduce
aggregate
process
window
join
union
connect
```

## Map

One input produces one output.

```java
stream.map(value -> value.toUpperCase());
```

## Filter

```java
stream.filter(value -> value.length() > 5);
```

## FlatMap

One input can produce multiple outputs.

```text
"hello flink"
     ↓
hello
flink
```

## keyBy

```java
events.keyBy(event -> event.vehicleId());
```

Records with the same key are logically grouped together.

## Reduce

```java
stream
    .keyBy(...)
    .reduce((a, b) -> a.combine(b));
```

Reduce is useful for incremental aggregation.

## ProcessFunction

ProcessFunction gives low-level control over records, state and timers.

Use it when standard operators are not expressive enough.

## Side Outputs

Invalid records can be separated:

```text
Input
  ↓
Validation
 /      Valid   Invalid
 |         |
Main      DLQ
```

## Automobile Example

```java
telemetry
    .filter(event -> event.speed() >= 0)
    .keyBy(event -> event.vehicleId())
    .map(event -> event);
```

## Best Practices

- Keep transformations small.
- Use meaningful names.
- Avoid unnecessary serialization.
- Key streams deliberately.
- Keep state bounded.
- Test event-time behavior.
- Monitor operator latency and backpressure.

## Summary

DataStream is ideal when application code requires fine control over streaming
logic, state, timers and transformations.
