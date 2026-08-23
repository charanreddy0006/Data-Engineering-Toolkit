# 11 — Data Lake Zones

## Raw / Bronze

Contains source-preserving information.

Responsibilities:

- Preserve source data.
- Record ingestion time.
- Avoid destructive transformations.
- Support replay.

## Processed / Silver

Contains validated and standardized data.

Typical operations:

- Type conversion
- Deduplication
- Cleaning
- Standardization
- Enrichment

## Curated / Gold

Contains consumer-ready datasets.

Examples:

```text
daily_vehicle_health
monthly_sales
warranty_summary
```

## Quarantine

Contains records that failed validation.

## Flow

```text
Raw
 |
 v
Validate
 |
 +----> Quarantine
 |
 v
Processed
 |
 v
Curated
```

The exact names may differ across organizations, but the separation of
responsibilities is the important concept.
