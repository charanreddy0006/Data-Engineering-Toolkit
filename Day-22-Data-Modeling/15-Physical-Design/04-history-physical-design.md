# Physical Design for Historical Models

SCD Type 2 dimensions grow continuously.

Common access patterns:

```text
business_key + current
business_key + date
```

PostgreSQL example:

```sql
CREATE INDEX idx_vehicle_current
ON dim_vehicle(vehicle_id)
WHERE is_current = TRUE;
```

This can be useful for current-state lookups when supported by the workload.

## Retention

Different layers can have different lifecycles:

```text
raw telemetry       -> shorter hot retention
curated telemetry   -> longer retention
daily aggregates    -> long analytical retention
```

Actual retention is a business, legal, and cost decision.

## Key lesson

Physical design and data lifecycle should be planned together.
