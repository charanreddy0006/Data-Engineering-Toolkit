# 44 — Mini Project: Automotive Data Lake

## Objective

Build a small local data lake for vehicle telemetry and service information.

## Inputs

```text
vehicles.csv
telemetry.csv
service.csv
```

## Pipeline

```text
CSV
 |
 v
Raw
 |
 v
Validation
 |
 +----> Quarantine
 |
 v
Processed Parquet
 |
 v
Curated Analytics
```

## Required Rules

```text
vehicle_id required
timestamp valid
speed >= 0
battery 0-100
event_id unique
```

## Suggested Curated Tables

```text
vehicle_daily_summary
vehicle_battery_summary
vehicle_service_summary
```

## Folder

```text
mini-project/
├── data/
│   ├── raw/
│   ├── processed/
│   ├── curated/
│   └── quarantine/
├── src/
├── tests/
└── README.md
```

## Extension

Add PySpark for distributed processing and MinIO for S3-compatible object
storage.

## Portfolio Outcome

The project demonstrates practical understanding of ingestion, validation,
storage, transformation, partitioning, and analytics.
