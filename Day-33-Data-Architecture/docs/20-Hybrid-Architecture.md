# 20. Hybrid Architecture

Enterprise platforms commonly combine batch and streaming.

```text
                   ┌→ Streaming → Live Use Cases
Sources ───────────┤
                   └→ Lake/Warehouse → Batch Analytics
```

## Example
Vehicle telemetry:
- streaming → alerts
- batch → long-term fleet analytics

Service:
- batch → finance/BI
- CDC → timely operational updates

Keep shared business definitions consistent across paths.
