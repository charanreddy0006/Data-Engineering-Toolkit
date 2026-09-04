# Airflow + Kubernetes Pattern

Airflow can execute tasks using Kubernetes-based execution patterns.

Concept:

```text
Airflow Scheduler
       ↓
Kubernetes API
       ↓
Task Pod
       ↓
Python / dbt / Spark
```

## Benefits

- dependency isolation,
- reproducible images,
- resource isolation,
- standardized execution.

## Image strategy

Build a task image containing:

```text
Python
drivers
libraries
application code
```

Then promote the same image through environments.

## Retry warning

You can accidentally combine:

```text
Airflow retry
+
Kubernetes Job retry
+
application retry
```

and execute work many more times than expected.

Make the sink operation idempotent and define retry ownership explicitly.
