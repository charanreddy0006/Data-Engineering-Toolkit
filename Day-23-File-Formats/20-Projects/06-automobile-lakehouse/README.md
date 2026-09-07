# Project 6 — Automobile File-Format Lakehouse 🚗

## Sources

```text
Vehicle Gateway -> JSONL
Dealer          -> CSV
Supplier        -> XML
Business        -> XLSX
Streaming       -> Avro
```

## Bronze

Preserve source representation.

## Silver

Canonical Parquet with explicit types and units.

## Gold

```text
trip
telemetry
service
warranty
charging
vehicle_daily
```

## Production requirements

- schema contract;
- quality checks;
- partitioning;
- compression;
- file-size strategy;
- lineage;
- recovery;
- schema evolution.

This is the portfolio centerpiece for Day 23.
