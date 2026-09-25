# 29. Semantic Architecture

A semantic layer provides consistent business meaning.

```text
Warehouse
 ↓
Semantic Layer
 ├→ Revenue
 ├→ Active Vehicle
 ├→ Service Order
 └→ Warranty Rate
 ↓
BI / Analytics
```

## Benefits
- consistent metrics
- reusable definitions
- simpler dashboards

## Automobile
Define `active_vehicle` once instead of allowing each dashboard to invent its own rule.
