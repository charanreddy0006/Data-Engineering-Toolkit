# Day 10 Run Guide

## Study Order

Read the root README, then study folders 01–05 before writing your first DAG.
Continue through scheduling, dependencies, TaskFlow, reliability, testing,
scaling and integrations.

## Testing

```powershell
pip install pytest
pytest examples/tests
```

## Airflow Installation

Airflow has version-specific Python and dependency requirements. Use the
official documentation for the exact version you install.

## DAG Workflow

```text
extract
   |
validate
   |
transform
   |
load
   |
quality
```

## Final Project

Integrate the Day 09 automobile ETL with Airflow, then progressively add
PostgreSQL, object storage, Spark, dbt, Kafka, monitoring and cloud deployment.
