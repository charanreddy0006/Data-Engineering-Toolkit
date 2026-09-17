# 7. Semantic Layer

## What Is It?
A semantic layer sits between analytical data and BI consumers and provides consistent business meaning.

```text
Warehouse
   ↓
Semantic Layer
   ├── Dimensions
   ├── Measures
   ├── Metrics
   ├── Relationships
   └── Security
   ↓
BI Tools
```

## Why It Matters
Without a semantic layer, analysts may independently implement:
- Revenue
- Customer
- Active vehicle
- Warranty rate
- Date logic

This can create inconsistent results.

## Metrics Layer
A metrics layer defines reusable calculations centrally.

Example:
```yaml
metric: service_revenue
type: sum
expression: labor_amount + parts_amount
```

## Semantic Model Responsibilities
- Relationships
- Naming
- Business definitions
- Measures
- Filters
- Security rules
- Documentation

## Automobile Example
Define `fleet_utilization` once and expose it to executive, dealer and operations dashboards with controlled filters.

## Best Practice
Treat metric definitions as governed code. Version them and review changes.
