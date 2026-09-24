# ⚡ Mini Project — Real-Time Vehicle Fault Pipeline

## Goal
Read fault events, validate them, deduplicate them, maintain per-vehicle state and expose live metrics.

```text
Events → Validate → Deduplicate → Window/State → Metrics → Monitor
```

## Features
- fault_count_5m
- last_fault_time
- high_severity_alert_count
- unique_fault_codes

## Deliverables
Event schema, producer, consumer, processor, tests, monitoring and recovery design.

## Extension
Use Kafka as broker and Spark Structured Streaming or Flink as the processor.
