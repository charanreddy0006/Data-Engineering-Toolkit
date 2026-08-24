# Day 09 Cheat Sheet

## ETL

```text
Extract -> Transform -> Load
```

## ELT

```text
Extract -> Load -> Transform
```

## Incremental loading

```text
Old Watermark
      |
      v
Changed Records
      |
      v
Target Write
      |
      v
New Watermark
```

## CDC

CDC captures inserts, updates and deletes from a source system.

## Quality

Check:

- completeness
- validity
- consistency
- uniqueness
- accuracy
- timeliness

## Reliability

Use:

- idempotent writes
- retries
- checkpoints
- quarantine
- logging
- monitoring

## Automobile flow

```text
Vehicle Sensors
      |
      v
Kafka / API
      |
      v
Raw Lake
      |
      v
Spark / SQL
      |
      v
Vehicle Health
      |
   +--+--+
   |     |
  BI     ML
```

## Interview keywords

ETL, ELT, CDC, watermark, upsert, merge, batch, incremental, partition,
shuffle, idempotency, data quality, lineage, orchestration, backfill,
quarantine, schema evolution, lake, warehouse and lakehouse.
