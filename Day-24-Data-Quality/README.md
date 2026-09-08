# Day 24 — Data Quality 📊🚗

A complete, production-oriented learning module for designing, testing, monitoring, and operating data quality in modern data platforms.

## What you will learn

- Data quality fundamentals and lifecycle
- Completeness, accuracy, consistency, validity, uniqueness, integrity, timeliness, freshness, and coverage
- Quality rules, metrics, thresholds, and quality gates
- SQL and Python validation
- Profiling and reconciliation
- Quarantine and dead-letter patterns
- dbt tests and freshness
- Great Expectations concepts
- PySpark quality checks
- Streaming data quality
- Data contracts and schema evolution
- Quality monitoring, SLOs, dashboards, and alerting
- Incident response, root-cause analysis, replay, and backfill
- Automobile/connected-vehicle data quality
- Portfolio projects and system-design interview preparation

## Quality mental model

```text
Source
  |
  v
Contract / Schema Validation
  |
  +------ invalid ------> Quarantine / DLQ
  |
  v
Raw / Bronze
  |
  v
Transform + Quality Rules
  |
  +------ invalid ------> Quarantine
  |
  v
Silver / Curated
  |
  v
Gold / Data Products
  |
  +------> BI / ML / Analytics
  |
  v
Quality Metrics ---> Dashboard ---> Alerts ---> Incident ---> Remediation
```

A production quality system does not merely say "test passed." It defines what good data means, measures it continuously, preserves bad data for investigation, and provides an operational response.

## Automobile focus

Connected vehicles can generate:

- vehicle_id
- event_id
- event_time
- ingestion_time
- speed_kmh
- battery_soc
- odometer_km
- latitude
- longitude
- diagnostic_code

The module uses these fields throughout realistic examples.

## Folder structure

- `01-Fundamentals/` — concepts and lifecycle
- `02-Dimensions/` — quality dimensions
- `03-Rules-and-Checks/` — rule engineering
- `04-SQL-Quality/` — SQL assertions
- `05-Python-Quality/` — Python/pandas validation
- `06-dbt/` — dbt quality
- `07-Great-Expectations/` — expectations framework concepts
- `08-Spark/` — distributed validation
- `09-Streaming/` — continuous quality
- `10-Data-Contracts/` — preventive quality
- `11-Monitoring/` — metrics, alerts, SLOs
- `12-Incidents/` — operations and recovery
- `13-Automobile/` — domain-specific quality
- `14-Projects/` — practical projects
- `15-Architecture/` — reference designs
- `16-Comparisons/` — approaches and trade-offs
- `17-Interview/` — interview preparation
- `18-Cheat-Sheets/` — quick revision
- `19-Resources/` — official documentation and study plan
- `examples/` — sample data and code
- `automobile-project/` — capstone
- `tests/` — automated tests

## Recommended order

Foundations → Dimensions → Rules → SQL → Python → dbt → Spark → Contracts → Monitoring → Incidents → Automobile → Projects → Interview.

## Core principle

Every quality rule should answer:

1. What can be wrong?
2. How will we detect it?
3. What happens to invalid data?
4. Who owns remediation?
