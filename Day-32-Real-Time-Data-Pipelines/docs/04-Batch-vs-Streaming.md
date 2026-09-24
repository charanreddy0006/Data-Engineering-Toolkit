# 4. Batch vs Streaming

| Area | Batch | Streaming |
|---|---|---|
| Trigger | Schedule/window | Event arrival |
| Processing | Groups | Continuous |
| Latency | Higher | Low |
| State | Periodic | Continuous |
| Complexity | Often lower | Often higher |

## Hybrid
```text
Events
 ├→ Streaming → Alerts
 └→ Storage → Batch → Historical Analytics
```

## Automobile
Use streaming for live fault notifications and batch processing for daily fleet reporting.

The correct choice comes from the business latency requirement.
