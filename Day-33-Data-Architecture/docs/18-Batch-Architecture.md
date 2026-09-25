# 18. Batch Architecture

```text
Sources
 ↓
Scheduled Ingestion
 ↓
Raw / Staging
 ↓
Transform
 ↓
Quality
 ↓
Warehouse
 ↓
BI / ML
```

## Good fits
- daily reporting
- monthly processing
- historical aggregates
- periodic ML scoring

## Automobile
Sales and service reporting may be daily, while live vehicle fault alerts use streaming.

## Reliability
Use watermarks, retries, idempotency, reconciliation and backfills.
