# 23. Performance and Cost

## Main Cost Drivers

- storage
- compute
- online serving infrastructure
- high-frequency updates
- large historical backfills
- unnecessary feature materialization

## Optimization

### Compute
Aggregate upstream where possible.

### Storage
Use efficient analytical formats for offline data.

### Online
Keep only truly required low-latency features online.

### Scheduling
Do not refresh a feature every minute if the use case only needs hourly freshness.

## Automobile Example

A fleet may contain millions of telemetry events per day. Keeping every raw event in the online store would be expensive and unnecessary.

Instead:
```text
Raw Telemetry → Stream Aggregates → Small Online Feature Set
```

## Trade-Off

Lower freshness can reduce cost, but it must still satisfy the business requirement.
