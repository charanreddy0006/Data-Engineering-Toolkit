# 14. Streaming Features

## Definition

Streaming features are updated continuously or frequently from event streams.

Examples:
- faults in last 15 minutes
- harsh braking in last hour
- charging session state
- current battery temperature
- recent telemetry anomaly count

## Architecture

```text
Vehicle
  ↓
Event Gateway
  ↓
Kafka / Stream Bus
  ↓
Stream Processor
  ↓
Online Feature Store
  ↓
Model API
```

## Windows

Common windows:
- tumbling
- sliding
- session

## Automobile Example

Calculate:
```text
harsh_braking_count_1h
```

from telemetry events.

## Challenges

- out-of-order events
- duplicates
- late events
- state management
- recovery
- exactly-once or effectively-once requirements
