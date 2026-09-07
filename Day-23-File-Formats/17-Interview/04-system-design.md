# System Design — Connected Vehicle File Architecture

## Requirement

Millions of vehicles generate telemetry while dealer, warranty, and manufacturing systems send
batch files.

## Design

```text
Vehicles
  ↓
JSONL / Avro events
  ↓
Raw landing
  ↓
Validation
  ↓
Canonical Parquet
  ↓
time-oriented partitioning
  ↓
Gold facts/aggregates
  ↓
BI / ML / APIs
```

## Important metadata

```text
event_id
vehicle_id
event_time
ingestion_time
schema_version
source
```

## Quality

```text
unique IDs
valid ranges
schema validation
freshness
partition completeness
```

## Operations

Monitor file count, file size, schema drift, late events, corrupt files, and duplicate rate.

The design should explain why different formats are used at different boundaries.
