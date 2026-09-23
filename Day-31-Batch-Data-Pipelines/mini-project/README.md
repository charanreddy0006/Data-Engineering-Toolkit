# 🧪 Mini Project — Daily Service Batch ETL

## Objective

Build a daily batch pipeline that reads service orders, validates them, removes duplicate versions, calculates service revenue and creates a dealer-level analytical output.

## Flow

```text
Source
 ↓
Extract
 ↓
Validate
 ↓
Deduplicate
 ↓
Transform
 ↓
Aggregate
 ↓
Reconcile
 ↓
Publish
```

## Deliverables

- source dataset
- batch script
- data-quality checks
- incremental query
- aggregation
- reconciliation
- output dataset

## Extension

Replace the CSV source with PostgreSQL and schedule the workflow using Airflow.
