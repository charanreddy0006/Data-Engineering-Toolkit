# 18. BI Performance

## Common Bottlenecks
- Too much data imported
- Poor dimensional modeling
- High-cardinality columns
- Inefficient SQL
- Expensive calculations
- Many visuals on one page
- Slow source queries
- Excessive cross-filtering

## Optimization Order
```text
Data Model
   ↓
Source Query
   ↓
Transformation
   ↓
Measures
   ↓
Visual Design
```

## Techniques
- Filter source data where appropriate.
- Select only needed columns.
- Use star schemas.
- Aggregate large event data.
- Partition large tables.
- Use incremental refresh.
- Avoid unnecessary calculated columns.
- Cache where supported.

## Automobile Example
Raw telemetry can contain millions of events. Instead of loading every event into an executive report, create daily vehicle aggregates for dashboard consumption while retaining raw events in analytical storage.
