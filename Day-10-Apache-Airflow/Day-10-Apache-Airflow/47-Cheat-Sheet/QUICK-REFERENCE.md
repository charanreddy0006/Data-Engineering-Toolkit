# Apache Airflow Quick Reference

```text
DAG -> Scheduler -> Executor -> Worker -> External System
                    |
                    v
                Metadata DB
```

DAG = workflow graph
Task = unit of work
Operator = reusable task definition
Scheduler = schedules task instances
Executor = execution strategy
Worker = executes tasks
XCom = small cross-task values
Sensor = waits for a condition
Dataset = data-aware dependency
Backfill = historical processing
Catchup = automatic historical scheduled runs

## Rules

- Keep large datasets out of XCom.
- Keep credentials out of Git.
- Make loads idempotent.
- Test DAGs.
- Monitor data quality.
- Use Spark for distributed processing.
- Use Kafka for event streaming.
- Use dbt for SQL transformation.
- Use Airflow for orchestration.
