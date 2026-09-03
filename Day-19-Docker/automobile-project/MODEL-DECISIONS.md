# Model Decisions

## PostgreSQL

Chosen because it is easy to run locally and supports realistic SQL.

## Compose

Chosen because PostgreSQL, ETL and quality checks need coordinated networking and lifecycle management.

## CSV

Chosen for clarity. A real connected-vehicle platform could use APIs, Kafka or other protocols.

## Named Volume

PostgreSQL is stateful, so the data directory is persisted.

## Quality Service

Validation is separated from ingestion to demonstrate pipeline-stage separation.

## Production Evolution

```text
Vehicle
 ↓
Gateway
 ↓
Kafka
 ↓
Flink / Spark
 ↓
Object Storage
 ↓
Lakehouse
 ↓
Warehouse
 ↓
BI / ML
```
