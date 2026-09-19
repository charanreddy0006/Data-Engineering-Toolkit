# 7. Online Feature Store

## What Is It?

An online store contains feature values optimized for low-latency retrieval.

Typical use:
```text
Request
  ↓
Entity ID
  ↓
Feature Lookup
  ↓
Model Inference
```

## Example

A maintenance recommendation API receives:
```text
vehicle_id = V1001
```

It may retrieve:
```text
days_since_service = 43
fault_count_24h = 7
battery_soc = 31
avg_distance_7d = 68.2
```

## Typical Characteristics

- Low latency
- High read throughput
- Key-based retrieval
- Recent values
- Availability requirements

## Key-Value Model

Conceptually:

```text
Key: V1001
Value:
  fault_count_24h=7
  battery_soc=31
  ...
```

## Design Considerations

- consistency
- latency
- availability
- memory/storage cost
- TTL
- update frequency

## Automobile Example

A connected-vehicle service continuously evaluates vehicle health and needs the latest features quickly. The online store can provide them to an inference service.
