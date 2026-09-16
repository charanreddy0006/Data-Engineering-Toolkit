# Automotive Observability Capstone 🚗📊

Design observability for a connected-vehicle platform.

```text
Vehicle → Gateway → Kafka → Processing → Lakehouse → Data Product
   |        |         |         |            |           |
 metrics   logs      lag      latency      quality     freshness
```

## Required

- vehicle event throughput
- gateway errors
- Kafka lag
- processing latency
- data freshness
- invalid telemetry
- duplicate events
- EV signal quality
- product SLO
- incident runbook

The final goal is to diagnose a stale fleet dashboard from end to end.
