# Project 1 — CSV to Parquet

## Goal

Build a repeatable ingestion pipeline.

```text
CSV
 ↓
explicit schema
 ↓
quality
 ↓
Parquet
```

## Requirements

- IDs remain strings;
- required columns checked;
- duplicates rejected;
- invalid years rejected;
- compressed Parquet written;
- row count printed.

## Stretch goals

Add:

- manifest;
- checksum;
- partitioning;
- benchmark;
- data-quality report.
