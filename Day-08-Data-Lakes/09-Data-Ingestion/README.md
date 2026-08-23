# 09 — Data Ingestion

## Batch Ingestion

Data arrives periodically.

```text
Database
   |
   v
Extract
   |
   v
Raw Lake
```

## Streaming Ingestion

Events arrive continuously.

```text
Vehicle
   |
   v
Kafka
   |
   v
Stream Processor
   |
   v
Lake
```

## CDC

Change Data Capture transfers inserts, updates, and deletes from operational
databases.

## Important Requirements

### Idempotency

Running the same operation twice should not create incorrect duplicates.

### Validation

Reject malformed records before they contaminate curated data.

### Retry

Transient failures should be retried safely.

### Quarantine

Invalid records should be isolated for investigation.

## Example

```python
def validate_event(event):
    required = ["vehicle_id", "timestamp", "speed"]

    for key in required:
        if key not in event:
            return False

    return event["speed"] >= 0
```
