# Small-File Problem

Suppose a partition contains:

```text
50,000 Parquet files
average size = 80 KB
```

Even if each file is valid, the dataset can be operationally inefficient.

## Why?

Every file can create:

- metadata work;
- object-store requests;
- task scheduling;
- open/close overhead;
- query planning overhead.

## Common causes

- micro-batches too small;
- excessive partitioning;
- too many concurrent writers;
- streaming output without compaction.

## Fix

```text
many small files
       ↓
controlled compaction
       ↓
fewer reasonably sized files
```

## Prevention

Monitor:

```text
file_count_per_partition
average_file_size
p95_file_size
small_file_rate
```

## Automobile example

A connected fleet can generate telemetry continuously. If every minute from every small source
creates a new object, a day's partition can contain an enormous number of files.

Tune ingestion batching and use controlled compaction.

## Warning

Compaction must be idempotent and coordinated with concurrent writers.
