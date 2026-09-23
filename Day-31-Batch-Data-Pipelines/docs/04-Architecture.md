# 4. Batch Architecture

```text
Operational DB / API / Files / SaaS
              ↓
          Ingestion
              ↓
        Raw / Staging
              ↓
      Data Quality Checks
              ↓
        Transformation
              ↓
      Curated Data Products
              ↓
       Warehouse / Lakehouse
          ↙           ↘
         BI            ML
```

## Production additions

- orchestration
- audit tables
- retries
- monitoring
- access control
- alerting
- backfills

## Design principle

Separate source extraction from business transformation so failures are easier to isolate and historical data can be replayed.
