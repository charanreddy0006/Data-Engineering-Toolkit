# 07 — Data Lake Storage

## Object Storage

Cloud object storage is commonly used because it provides scalable and durable
storage without requiring a traditional filesystem hierarchy.

Examples:

```text
Amazon S3
Azure Data Lake Storage
Google Cloud Storage
MinIO
```

## Logical Layout

```text
bucket/
  raw/
  processed/
  curated/
  quarantine/
```

## Partitioned Layout

```text
telemetry/
  year=2026/
    month=08/
      day=23/
        part-000.parquet
```

## Important Storage Concerns

### Small Files

Thousands of tiny files create metadata and scheduling overhead.

### Partitioning

Partition columns should reflect common filtering patterns.

### Compression

Compression reduces storage and I/O.

### Encryption

Sensitive data should be encrypted at rest and in transit.

### Lifecycle

Old data may move to cheaper storage tiers or be deleted according to policy.

## Local Development

MinIO can provide an S3-compatible object-storage environment for local
development and testing.
