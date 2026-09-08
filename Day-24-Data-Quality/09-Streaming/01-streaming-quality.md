# Streaming Data Quality

Streaming data arrives continuously and may be late, duplicated, malformed, or out of order.

Typical checks:

- schema
- required fields
- ranges
- duplicate IDs
- event-time validity
- source lag
- throughput
- malformed messages
- DLQ rate

```text
Kafka
  |
Schema validation
  |
  +-- invalid --> DLQ
  |
  v
Stream processing
  |
Business validation
  |
  +-- invalid --> quarantine
  |
  v
Curated stream
```

Distinguish event_time, ingestion_time, and processing_time.

A disconnected vehicle may upload valid historical events later. Late does not automatically mean bad.
