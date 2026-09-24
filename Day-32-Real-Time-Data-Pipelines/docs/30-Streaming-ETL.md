# 30. Streaming ETL

Streaming ETL transforms events continuously.

```text
Raw Event
 ↓
Parse
 ↓
Validate
 ↓
Normalize
 ↓
Enrich
 ↓
Filter
 ↓
Curated Stream
```

## Automobile
Convert device speed into `speed_kmh`, normalize timestamps, attach vehicle metadata and publish a clean telemetry stream.

## Outputs
- dashboards
- alerts
- feature stores
- historical lake
