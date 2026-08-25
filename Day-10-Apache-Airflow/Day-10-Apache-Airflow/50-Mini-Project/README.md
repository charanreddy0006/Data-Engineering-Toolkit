# Mini Project — Automobile Service Airflow Pipeline

## Objective

Turn the Day 09 service ETL into a scheduled and observable Airflow workflow.

## Pipeline

```text
Extract -> Validate -> Transform -> Load -> Quality -> Report
```

## Requirements

- Read vehicle service records.
- Validate IDs, dates and costs.
- Standardize values.
- Deduplicate service IDs.
- Produce curated output.
- Calculate quality metrics.
- Configure retries.
- Use secure connection configuration.
- Make the load idempotent.

## Extension

Add PostgreSQL as the destination, use an Airflow Connection and create a
failure notification.

## Portfolio Outcome

The project demonstrates orchestration, reliability and data-quality design
instead of only Python scripting.
