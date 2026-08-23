# 14 — Data Lake vs Lakehouse

## Traditional Data Lake

Primarily provides scalable file/object storage.

## Lakehouse

Adds table-management capabilities on top of lake storage.

Common technologies include:

- Apache Iceberg
- Delta Lake
- Apache Hudi

## Typical Features

- ACID transactions
- Schema evolution
- Time travel or snapshots
- Upserts
- Better table management
- Concurrent writes
- Metadata management

## Architecture

```text
Object Storage
      |
      v
Table Format
      |
      v
Lakehouse Tables
      |
  +---+---+
  |       |
 BI       ML
```

## Important Idea

A lakehouse does not mean abandoning the data lake. It extends lake storage
with stronger table semantics and management features.
