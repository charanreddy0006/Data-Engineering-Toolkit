# 32. Real-Time Dashboards

## Flow
```text
Events → Stream Processor → Serving Store → Dashboard
```

## Fleet metrics
- vehicles online
- faults in last 5 minutes
- critical alerts
- charging activity
- data freshness

## Design
Display last-event time and processing lag. Never make stale data look current.

## Automobile
Operations can monitor current fleet faults without running expensive analytical queries over raw telemetry.
