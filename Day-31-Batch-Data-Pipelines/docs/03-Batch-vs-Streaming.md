# 3. Batch vs Streaming

| Area | Batch | Streaming |
|---|---|---|
| Trigger | Schedule/window | Event arrival |
| Data | Grouped | Continuous |
| Latency | Higher | Low |
| Operational complexity | Usually lower | Usually higher |
| Example | Daily sales | Live vehicle alerts |

## Hybrid systems

```text
Vehicle Events → Streaming Path → Immediate Alerts
              ↘ Batch Path → Historical Aggregates
```

Choose based on business latency requirements.

## Automobile example

Safety alerts may need streaming, while daily fleet utilization can be calculated in batch.
