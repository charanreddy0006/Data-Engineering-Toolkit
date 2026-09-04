# Data Quality as a Kubernetes Job

Data quality is a natural batch workload.

## Flow

```text
Raw data
   ↓
ETL
   ↓
Quality Job
   ├── null checks
   ├── range checks
   ├── duplicates
   └── referential checks
   ↓
Pass / Fail
```

## Automobile checks

- vehicle_id exists,
- timestamp is valid,
- speed >= 0,
- battery is between 0 and 100,
- event_id is unique,
- diagnostic code belongs to an allowed domain.

## Operational metadata

Store:

```text
run_id
dataset
partition
rule_id
total_records
failed_records
duration
pipeline_version
```

## Retry safety

A quality job should be safe to repeat.

Use unique result keys such as:

```text
run_id + rule_id + partition
```

or another strategy suitable for the target database.

## Kubernetes

```text
CronJob → creates Job → Pod → quality script
```
