# Linux for Data Pipelines

## Introduction

Linux provides many tools required to build and automate data pipelines.

A Data Engineer can use Linux commands and shell scripts to collect, validate, transform, move, and archive data.

## Typical Pipeline

```text
Source
  |
  v
Raw Data
  |
  v
Validation
  |
  v
Transformation
  |
  v
Processed Data
  |
  v
Database / Data Lake
```

## Directory Structure

```text
/data/vehicle-pipeline/
├── raw/
├── processed/
├── archive/
├── logs/
└── scripts/
```

## Pipeline Steps

### 1. Receive Data

```bash
cp incoming/vehicles.csv raw/
```

### 2. Validate

```bash
test -f raw/vehicles.csv
```

### 3. Process

```bash
tail -n +2 raw/vehicles.csv > processed/vehicles.csv
```

### 4. Archive

```bash
mv raw/vehicles.csv archive/
```

### 5. Log

```bash
echo "$(date) Pipeline completed" >> logs/pipeline.log
```

## File Validation

Check whether a file exists:

```bash
if [ ! -f "$INPUT" ]; then
    echo "File not found"
    exit 1
fi
```

Check file size:

```bash
wc -c vehicles.csv
```

Check number of records:

```bash
wc -l vehicles.csv
```

## Pipeline Automation

A Bash pipeline can combine multiple commands:

```bash
#!/bin/bash

set -euo pipefail

INPUT="raw/vehicles.csv"
OUTPUT="processed/vehicles.csv"

if [ ! -f "$INPUT" ]; then
    echo "Input file missing"
    exit 1
fi

tail -n +2 "$INPUT" > "$OUTPUT"

echo "$(date) Pipeline completed" >> logs/pipeline.log
```

## 🚗 Vehicle Data Pipeline

```text
Vehicle
  |
  v
Sensor / Application
  |
  v
CSV
  |
  v
Linux Server
  |
  +--> Validation
  |
  +--> Transformation
  |
  v
Processed Data
  |
  v
PostgreSQL / Data Lake
```

## Best Practices

- Keep raw data unchanged.
- Validate incoming files.
- Use absolute paths in scheduled jobs.
- Log pipeline execution.
- Handle failures.
- Separate raw and processed data.
- Use meaningful directory names.
- Avoid hard-coded credentials.

## Limitations

Linux shell pipelines are excellent for simple workflows but become difficult to manage when pipelines require:

- Complex dependencies
- Distributed processing
- Retry mechanisms
- Advanced scheduling
- Workflow visualization

For complex workflows, tools such as Airflow, Spark, and cloud orchestration platforms are more appropriate.

## Interview Questions

1. How can Linux be used in ETL pipelines?
2. Why should raw data be preserved?
3. How can Bash validate an input file?
4. Why is logging important?
5. When should Bash be replaced by a workflow orchestration tool?

## Summary

Linux provides a powerful foundation for building simple data ingestion, processing, and automation workflows.