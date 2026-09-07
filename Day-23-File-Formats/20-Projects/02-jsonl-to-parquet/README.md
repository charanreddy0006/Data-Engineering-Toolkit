# Project 2 — JSONL Telemetry

## Input

One telemetry event per line.

## Output

Canonical Parquet.

## Required

```text
event_id
vehicle_id
event_time
schema_version
```

## Quality

```text
SOC 0..100
speed >= 0
odometer >= 0
unique event ID
```

## Failure handling

Malformed events go to quarantine with source and line metadata.

## Stretch

Support schema v1 and v2 independently.
