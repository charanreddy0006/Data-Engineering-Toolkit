# Project 6 — Automobile Data Quality Platform 🚗

Build a portfolio-grade quality platform for connected vehicles.

## Sources

- telemetry
- vehicle master
- service orders
- diagnostics
- charging sessions

## Quality

- completeness
- validity
- uniqueness
- integrity
- consistency
- freshness
- coverage
- temporal correctness
- reconciliation

## Architecture

```text
Vehicle/IoT
   |
Kafka/API
   |
Contract Validation
   |
 +-------------+
 |             |
valid        invalid
 |             |
Bronze      Quarantine/DLQ
 |
Spark/dbt
 |
Silver
 |
Gold
 |
BI / ML / Analytics

Quality Metrics -> Dashboard -> Alerts -> Incidents
```

Deliver architecture, rule catalog, Python validator, SQL checks, Spark job, metrics table, dashboard, runbook, tests, and README.
