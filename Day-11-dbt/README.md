# Day 11 — dbt

Complete dbt learning module for the Data Engineering Toolkit.

## Architecture

```text
Sources -> Staging -> Intermediate -> Marts -> BI / ML
                    ^
                    |
                   dbt
```

dbt provides transformation, testing, documentation, lineage and reusable
analytics-engineering workflows. It complements Airflow, Spark, Kafka,
warehouses and lakehouses rather than replacing them.

## Automobile Platform

```text
Vehicle Sensors -> Kafka
Service DB -----> Airflow
Dealer Files ---> Airflow
Warranty API ---> Airflow
                      |
                      v
                 Raw Storage
                      |
                      v
                     dbt
                /                     Staging          Marts
                \          /
                 v        v
                    BI / ML
```

## Study Order

Start with fundamentals, then models and dependencies, sources and tests,
Jinja/macros, materializations, incremental models, performance, security,
CI/CD and finally integrations and the automobile end-to-end project.

## Official Documentation

https://docs.getdbt.com/
