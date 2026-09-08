# Automobile Data Quality Platform — Capstone 🚗

## Business problem

A connected-vehicle organization receives telemetry from thousands of vehicles. Data is consumed by operations, service analytics, EV dashboards, warranty analytics, and ML systems.

The platform must prevent bad data from silently reaching consumers.

## Sources

```text
Telemetry
Vehicle Master
Service Orders
Diagnostics
Charging Sessions
```

## Target architecture

```text
Vehicle/IoT -> Kafka/API -> Contract
                              |
                       +------+------+
                       |             |
                     valid         invalid
                       |             |
                    Bronze       Quarantine/DLQ
                       |
                   Spark/dbt
                       |
                    Silver
                       |
                     Gold
                       |
                  BI / ML / Apps

Quality Results -> Dashboard -> Alerts -> Incidents
```

## Required checks

- schema
- completeness
- validity
- uniqueness
- referential integrity
- consistency
- freshness
- coverage
- temporal correctness
- reconciliation

## Portfolio deliverables

- architecture
- rule catalog
- data dictionary
- SQL checks
- Python validator
- Spark job
- quality-results table
- quality report
- runbook
- automated tests
- dashboard design

## Production extensions

Kafka + Schema Registry, Great Expectations, dbt, Airflow, lineage, cloud object storage, warehouse, and alerting.
