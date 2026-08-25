# End-to-End Automobile Data Platform

## Business Scenario

An automobile company needs a unified platform for connected vehicles,
service centers, warranty systems and dealer data.

## Architecture

```text
Vehicle Sensors -> Kafka ------------------+
                                            |
Service DB -----> Airflow -> Raw Lake -> Spark
Warranty API ---> Airflow                   |
Dealer Files ---> Airflow                   v
                                      Curated Data
                                           |
                                      dbt / Warehouse
                                        /                                              BI        ML
```

## Airflow Responsibilities

- scheduling
- dependency management
- retries
- orchestration
- quality gates
- alerts
- backfills
- coordination of Spark, dbt and SQL

## Other Technologies

Kafka handles event streaming.
Spark handles distributed processing.
dbt handles warehouse SQL transformations.
PostgreSQL handles structured source data.
The data lake stores raw and curated files.
The warehouse serves analytical consumers.

## Development Stages

1. Python ETL.
2. PostgreSQL.
3. Object storage.
4. Spark.
5. Airflow.
6. dbt.
7. Kafka.
8. Monitoring.
9. CI/CD.
10. Cloud deployment.

## Definition of Done

Architecture diagram, tested DAGs, data-quality checks, retries, idempotent
loading, secure configuration, documentation and automobile business use case.
