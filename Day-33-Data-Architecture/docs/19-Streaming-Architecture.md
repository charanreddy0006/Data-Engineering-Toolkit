# 19. Streaming Architecture

```text
Events
 ↓
Broker
 ↓
Stream Processor
 ↓
State / Serving
 ↓
Alerts / Features / Dashboards
```

## Requirements
- event schemas
- partition strategy
- ordering
- state
- checkpointing
- recovery
- monitoring

## Automobile
```text
Vehicle → Gateway → Kafka → Flink/Spark → Online Store
```

Use streaming where low-latency updates provide business value.
