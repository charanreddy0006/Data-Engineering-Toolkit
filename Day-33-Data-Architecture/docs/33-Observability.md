# 33. Observability Architecture

Observability helps engineers understand system behavior.

## Signals
- metrics
- logs
- traces
- lineage
- freshness
- pipeline status

## End-to-end
```text
Vehicle Event
 ↓
Broker
 ↓
Processor
 ↓
Storage
 ↓
Dashboard
```

Track each transition so a missing dashboard record can be traced to the correct layer.

## Automobile
Operations should be able to distinguish vehicle connectivity issues from ingestion, transformation or serving failures.
