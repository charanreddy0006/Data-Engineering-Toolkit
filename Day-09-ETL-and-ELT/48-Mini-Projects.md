# Day 09 Mini Projects

## Project 1 — Vehicle Service ETL

Input: CSV service records.

Process:

```text
Extract -> Validate -> Clean -> Deduplicate -> Aggregate -> Load
```

Outputs:

- curated service table
- vehicle summary
- rejected records

## Project 2 — Incremental Vehicle Events

Use `updated_at` as a watermark.

Requirements:

- initial load
- incremental load
- watermark persistence
- duplicate protection
- reconciliation

## Project 3 — Data Quality Monitor

Calculate:

- row count
- null count
- duplicate count
- invalid range count
- freshness

Create a simple pass/fail quality status.

## Project 4 — Automobile Warehouse

Create:

- vehicle dimension
- service fact
- warranty fact
- dealer dimension

Build analytical queries for service cost and warranty rate.

## Project 5 — End-to-End Platform

Combine:

- PostgreSQL
- object storage
- Spark
- Airflow
- dbt
- Kafka
- BI

The final project should demonstrate reliable data engineering rather than
only technology usage.
