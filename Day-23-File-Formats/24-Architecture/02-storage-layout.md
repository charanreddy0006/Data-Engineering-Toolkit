# Storage Layout

A conceptual automobile lake:

```text
lake/
├── bronze/
│   ├── telemetry/
│   │   └── ingest_date=2026-09-06/
│   ├── dealer/
│   └── warranty/
├── silver/
│   ├── telemetry/
│   │   └── event_date=2026-09-06/
│   ├── trip/
│   └── service/
└── gold/
    ├── vehicle_daily/
    │   └── snapshot_date=2026-09-06/
    └── fleet_metrics/
```

## Bronze

Preserve source fidelity and operational metadata.

## Silver

Standardize types, units, IDs, timestamps, and quality.

## Gold

Publish business-ready analytical datasets.

## Important

Directory naming is only useful when the processing/catalog layer understands the convention.
A folder called `event_date=...` does not by itself create a managed table.
