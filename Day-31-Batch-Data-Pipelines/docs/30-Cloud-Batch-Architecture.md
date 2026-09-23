# 30. Cloud Batch Architecture

## Generic pattern

```text
Sources
  ↓
Managed Ingestion
  ↓
Object Storage / Data Lake
  ↓
Batch Compute
  ↓
Warehouse / Lakehouse
  ↓
BI / ML
```

## Supporting services

A cloud implementation commonly needs:
- object storage
- compute
- orchestration
- data catalog/metadata
- monitoring
- IAM

## Cost areas

- storage
- compute
- network
- orchestration

## Automobile

Daily sales and service pipelines can process in cloud storage and publish curated warehouse tables for analytics.
