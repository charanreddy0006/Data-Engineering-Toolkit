# Jobs and CronJobs

Data engineering has many run-to-completion workloads.

## Job

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: telemetry-quality
spec:
  backoffLimit: 2
  template:
    spec:
      restartPolicy: Never
      containers:
        - name: quality
          image: company/quality:1.0
          command: ["python", "/app/check.py"]
```

A Job represents work that should eventually complete.

## CronJob

```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: daily-aggregation
spec:
  schedule: "0 2 * * *"
  concurrencyPolicy: Forbid
  jobTemplate:
    spec:
      template:
        spec:
          restartPolicy: Never
          containers:
            - name: aggregation
              image: company/aggregation:1.0
              command: ["python", "/app/run.py"]
```

## Data-engineering examples

Job:

- backfill,
- migration,
- one-time quality check.

CronJob:

- daily ETL,
- hourly aggregation,
- scheduled cleanup.

## Critical principle

Retries can duplicate writes.

Make batch processing idempotent where practical.
