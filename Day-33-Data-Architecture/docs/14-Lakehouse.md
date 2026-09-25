# 14. Lakehouse Architecture

A lakehouse combines scalable lake storage with managed analytical table capabilities.

```text
Object Storage
 ↓
Table Format / Metadata
 ↓
SQL + Batch + Streaming
 ↓
BI / ML
```

Common table technologies include Apache Iceberg, Delta Lake and Apache Hudi.

## Automobile
A lakehouse can store telemetry, service history and curated vehicle data for both analytics and ML.
