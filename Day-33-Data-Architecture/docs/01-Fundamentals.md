# 1. Data Architecture Fundamentals

Data architecture describes how data is created, moved, stored, transformed, governed and consumed.

## Why it exists
Without architecture, systems often become disconnected databases and point-to-point pipelines.

Common symptoms:
- duplicate data
- unclear ownership
- inconsistent metrics
- security gaps
- unpredictable cost

## Layers
```text
Sources → Ingestion → Storage → Processing → Serving → Consumption
```

Architecture describes responsibilities and interfaces, not only products.

## Automobile
Vehicle telemetry, dealer systems, service and warranty data can share one governed platform while remaining separate source domains.
