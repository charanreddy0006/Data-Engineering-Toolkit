# 32. Production Batch Architecture

```text
DB / API / Files / SaaS / CDC
           ↓
      Orchestrator
           ↓
       Staging
           ↓
        Quality
           ↓
      Transform
           ↓
   Curated Data Products
           ↓
    Warehouse/Lakehouse
        /                 BI           ML
```

## Cross-cutting concerns

```text
Security
Monitoring
Audit
Data Quality
Cost
```

## Production requirements

- explicit dependencies
- idempotent writes
- watermarks
- retries
- backfills
- reconciliation
- observability
