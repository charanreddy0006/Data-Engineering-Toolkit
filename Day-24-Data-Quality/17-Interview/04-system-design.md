# System Design — Quality Platform for 100M Vehicle Events/Day

## Architecture answer

### Ingestion
Kafka/API/file ingestion with source metadata.

### Contract
Schema and semantic validation at the boundary.

### Storage
Bronze for raw evidence, Silver for validated data, Gold for consumer products.

### Validation
Distributed checks with partition-aware execution.

### Quarantine
Bad rows with rule IDs, reasons, and replay metadata.

### Metrics
Persist results by dataset, partition, rule, and run.

### Monitoring
Freshness, volume, validity, duplicates, coverage, drift.

### Alerting
Severity + owner + business impact.

### Lineage
Source-to-consumer relationships for impact analysis.

### Recovery
Replay, backfill, deterministic upsert, and post-recovery validation.

### Scaling
Incremental checks, column pruning, distributed aggregates, avoiding unnecessary shuffles, and small-file management.
