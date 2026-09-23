# 🚗 Automobile Batch Data Pipeline Capstone

## Project

**Daily Automotive Operations Batch Platform**

## Goal

Combine vehicle sales, service, warranty, EV charging and manufacturing data into trusted analytical datasets through reliable batch processing.

## Sources

- Dealer sales
- Service orders
- Warranty claims
- Vehicle master
- EV charging sessions
- Manufacturing records

## Flow

```text
Sources
  ↓
Ingestion
  ↓
Raw / Staging
  ↓
Quality
  ↓
Incremental Transform
  ↓
Curated Tables
  ↓
Warehouse / Lakehouse
  ↓
BI / ML
```

## Reliability

The capstone demonstrates:
- incremental loads
- watermarks
- deduplication
- partitioning
- retries
- backfills
- reconciliation
- monitoring
- security

## Outputs

- daily sales
- service revenue
- warranty analytics
- EV energy summary
- vehicle fleet snapshot
