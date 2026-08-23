# 38 — Data Lake Cost Optimization

## Storage

Use lifecycle policies to move old data to cheaper storage tiers when business
requirements allow it.

## Compression

Parquet with compression can reduce storage and data transfer.

## Query Scanning

Avoid scanning unnecessary columns and historical partitions.

## Incremental Processing

Process only changed data.

## Small Files

Compaction can reduce object count and improve processing efficiency.

## Compute

Scale processing resources according to workload.

## Data Retention

Do not retain everything forever without a business requirement.

## Cost Review

Track:

```text
Storage
Compute
Data Transfer
Requests
Streaming Infrastructure
```

The cheapest architecture is not always the best architecture; optimize while
preserving reliability and business requirements.
