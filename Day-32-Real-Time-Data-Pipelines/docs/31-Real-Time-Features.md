# 31. Real-Time Feature Pipelines

Streaming features feed ML systems with fresh signals.

Examples:
```text
fault_count_15m
harsh_braking_count_1h
battery_soc_latest
charging_sessions_30m
```

## Flow
```text
Events → Processor → Online Features → Model
```

## Requirements
- freshness
- correctness
- time semantics
- low latency
- monitoring

## Automobile
An online maintenance model can consume current vehicle-health features after a severe fault.
