# 2. Streaming Lifecycle

```text
Produce → Ingest → Validate → Transform → Aggregate → Serve → Monitor
```

### Produce
Generate an event with a stable identity and timestamp.

### Ingest
Place events on a durable stream.

### Validate
Reject malformed records and record the reason.

### Transform
Normalize fields, filter, enrich and derive values.

### Aggregate
Calculate windows, counts, averages and rates.

### Serve
Write to stores, APIs, features or dashboards.

### Monitor
Track throughput, lag, latency, failures and freshness.

## Automobile
Telemetry flows continuously while a second path stores events for historical batch analytics.
