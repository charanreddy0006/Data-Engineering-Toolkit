# Airflow Best Practices

## 1. Introduction

Good Airflow workflows are readable, testable, idempotent, observable and secure.

This is part of **Day 10 — Apache Airflow** in the Data Engineering Toolkit.
The objective is to understand the topic from first principles and connect it
to a production-inspired data engineering workflow.

## 2. Why This Topic Exists

The DAG should remain understandable as workflow complexity grows.

Airflow is most useful when workflows have dependencies, schedules, external
systems, historical runs, failure handling and operational requirements.

## 3. Core Concepts

### Responsibility

A component should have one clear responsibility. Keeping responsibilities
separate makes workflows easier to understand, test and operate.

### Inputs

Inputs can include source data, configuration, task state, runtime context,
credentials or metadata.

### Outputs

Outputs can be task state, a small metadata value, an external dataset,
another workflow event or an operational result.

### Failure Handling

Every production workflow should answer:

1. What can fail?
2. Is the failure transient?
3. Should it retry?
4. Can the task be safely rerun?
5. Where is the failure recorded?
6. Who should be alerted?

### Observability

Logs, task states, metrics, freshness and data-quality results should allow an
engineer to understand what happened without manually guessing.

## 4. Architecture

```text
DAG Code
   |
   v
DAG Processor
   |
   v
Scheduler
   |
   v
Executor
   |
   +----------+----------+
   |          |          |
 Worker 1   Worker 2   Worker 3
   |          |          |
   +----------+----------+
              |
              v
       External Systems

Scheduler / Tasks
       |
       v
Metadata Database

Workers
       |
       v
Logs / Metrics
```

## 5. Detailed Explanation

Airflow should be treated as the **orchestration layer**. It coordinates work
rather than replacing every other data technology.

A useful production workflow separates:

```text
Orchestration
      |
      +--> Data Storage
      |
      +--> Data Processing
      |
      +--> Data Quality
      |
      +--> Analytics
      |
      +--> Monitoring
```

### Workflow as Code

DAGs are Python code. Therefore they can be stored in Git, reviewed through
pull requests, tested in CI and deployed using repeatable processes.

### Dependencies

Dependencies define execution order. A downstream task should not consume an
upstream result before the upstream task has reached an acceptable state.

### Scheduling

A schedule creates workflow runs. Good scheduling considers data availability,
freshness, processing duration and downstream requirements.

### Idempotency

A task is idempotent when retrying the same logical input does not create an
incorrect additional result.

### Separation of Data and Metadata

Large datasets should live in databases, object storage, lakes or warehouses.
Airflow metadata and XCom are intended for orchestration state and lightweight
communication.

## 6. Python Example

```python
from datetime import datetime
from airflow import DAG
from airflow.decorators import task

with DAG(
    dag_id="automobile_service_workflow",
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
    tags=["day10", "automobile"],
) as dag:

    @task
    def extract():
        return "raw/service/date=2026-08-25"

    @task
    def validate(path):
        print("Validating:", path)
        return path

    @task
    def transform(path):
        curated = path.replace("raw/", "curated/")
        print("Transforming:", path)
        return curated

    @task
    def load(path):
        print("Publishing:", path)

    load(transform(validate(extract())))
```

Only a small path is passed between tasks. The actual service records remain
in durable storage.

## 7. Automobile Industry Example

```text
Vehicle Sensors ----> Kafka
Service Database ---> PostgreSQL
Warranty System ----> API
Dealer Files -------> Object Storage
```

Airflow can coordinate batch workflows:

```text
Sources
   |
   v
Extract
   |
   v
Schema Validation
   |
   v
Business Validation
   |
   +------> Quarantine
   |
   v
Transform
   |
   v
Idempotent Load
   |
   v
Quality Report
   |
   +------> BI
   |
   +------> ML
```

For automobile service data, validation can check service IDs, vehicle IDs,
dates and costs. Transformation can standardize identifiers, deduplicate
records and calculate business metrics.

## 8. Reliability

### Retries

Use bounded retries for temporary network, API or infrastructure failures.

### Timeouts

Prevent external systems from blocking workers indefinitely.

### Quarantine

Keep invalid business records separately when they need investigation or
reprocessing.

### Backfills

Keep workflows reproducible so historical intervals can be rebuilt safely.

### Idempotent Loading

Use unique business keys, staging and merge/upsert patterns where appropriate.

## 9. Security

Never write passwords or tokens directly into DAG source code.

Prefer:

- Airflow Connections
- secrets backends
- environment-specific configuration
- least privilege
- RBAC
- network controls
- audit logging

## 10. Performance

Airflow should not perform huge data transformations in the scheduler.

```text
Airflow
  |
  +--> PostgreSQL / SQL
  |
  +--> Spark
  |
  +--> dbt
  |
  +--> Object Storage
  |
  +--> External APIs
```

For billions of vehicle telemetry events, Spark or another distributed engine
should perform the computation while Airflow coordinates the job.

## 11. Testing

Test:

- DAG imports
- expected task IDs
- dependencies
- schedule configuration
- Python business logic
- retry behavior
- quality rules
- idempotency

A useful CI test should fail if a required task disappears or a critical
dependency is accidentally reversed.

## 12. Common Mistakes

1. Hard-coding credentials.
2. Passing large dataframes through XCom.
3. Performing heavy computation in the scheduler.
4. Creating hundreds of unnecessary tiny tasks.
5. Retrying permanent data errors forever.
6. Loading duplicate records after retries.
7. Ignoring data-quality failures.
8. Editing production DAGs manually.
9. Treating Airflow as Kafka.
10. Treating Airflow as Spark.

## 13. Best Practices

1. Keep DAG files readable.
2. Use meaningful task IDs.
3. Keep reusable business logic in modules.
4. Use version control.
5. Externalize secrets.
6. Make loads idempotent.
7. Add quality gates.
8. Test DAGs before deployment.
9. Monitor both workflow and data health.
10. Document ownership and dependencies.

## 14. Practice

### Beginner

Create a three-task workflow:

```text
extract -> transform -> load
```

### Intermediate

Add:

```text
validate -> quality_gate -> load
```

and configure retries.

### Advanced

Connect the workflow to PostgreSQL or object storage and make the load
idempotent.

### Automobile

Process service records and publish:

- total services
- total cost
- average cost
- latest service date
- rejected records

## 15. Interview Questions

### Beginner

1. What is Apache Airflow?
2. What is a DAG?
3. What is a task?
4. What is an operator?
5. What is a scheduler?

### Intermediate

6. What is XCom?
7. What is a sensor?
8. What is catchup?
9. What is backfill?
10. What is TaskFlow?

### Advanced

11. How would you scale Airflow?
12. How do you make a DAG idempotent?
13. How should production secrets be managed?
14. Why should large datasets not be passed through XCom?
15. How would you troubleshoot scheduler latency?

### Scenario

A service-load task writes 500,000 records and a later notification task fails.
The workflow is retried. How do you prevent another 500,000 duplicate records?

A strong answer should mention a stable business key, staging or transactional
loading, merge/upsert semantics and idempotency.

## 16. Key Takeaways

- Airflow is an orchestration platform.
- DAGs represent workflows.
- Tasks represent executable work.
- Dependencies control order.
- Schedules create workflow runs.
- Executors determine execution strategy.
- Workers execute tasks.
- XCom should contain small values.
- Actual datasets belong in durable storage.
- Retries must be safe.
- Backfills require reproducible logic.
- Monitoring should include data quality.
- Secrets must be protected.
- Spark, Kafka, dbt and databases should perform their specialized jobs.
