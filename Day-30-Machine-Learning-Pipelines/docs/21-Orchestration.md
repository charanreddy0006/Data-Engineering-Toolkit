# 21. Orchestration

Orchestration manages scheduling, dependencies, retries, logs and operational execution.

## Example

```text
ingest
 ↓
validate
 ↓
features
 ↓
training
 ↓
evaluate
 ↓
register
 ↓
deploy
```

## Tools

Examples:
- Apache Airflow
- Kubeflow Pipelines
- Dagster
- managed cloud workflow services

## Data Engineering Connection

The orchestration concepts used for ETL pipelines also apply to ML workflows, with extra artifact and model lifecycle steps.

## Automobile

Run weekly training and daily batch scoring as separate workflows.
