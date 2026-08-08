## `18-Best-Practices.md`

````markdown
# Linux Best Practices for Data Engineers

## Introduction

Good Linux practices improve security, reliability, maintainability, and operational efficiency.

Data Engineering systems often process large and valuable datasets, so careless commands can cause serious problems.

## 1. Use Least Privilege

Do not use `root` unless necessary.

Prefer:

```bash
sudo command
```

only when administrative privileges are required.

## 2. Avoid chmod 777

Avoid:

```bash
chmod 777 file
```

Use only the permissions required by the application.

## 3. Protect Sensitive Data

Never store passwords or API keys directly inside scripts.

Bad:

```bash
PASSWORD="my-password"
```

Use environment variables or a proper secrets manager.

## 4. Preserve Raw Data

A pipeline should generally keep the original source data:

```text
raw/
processed/
archive/
```

Never overwrite raw datasets unnecessarily.

## 5. Use Meaningful Names

Prefer:

```text
vehicle_sensor_pipeline.sh
```

instead of:

```text
script1.sh
```

## 6. Use Absolute Paths

Scheduled jobs may run from an unexpected working directory.

Prefer:

```bash
/data/vehicle/raw/data.csv
```

instead of:

```bash
data.csv
```

## 7. Validate Inputs

Before processing:

```bash
if [ ! -f "$INPUT" ]; then
    echo "Input file missing"
    exit 1
fi
```

## 8. Use Error Handling

For Bash scripts:

```bash
set -euo pipefail
```

This helps detect failures early.

## 9. Maintain Logs

Record:

- Start time
- End time
- Input files
- Records processed
- Errors
- Output location

## 10. Test Before Production

Test scripts with sample data before running them against production datasets.

## 11. Use Version Control

Store scripts in Git:

```bash
git add pipeline.sh
git commit -m "Add vehicle data pipeline"
```

## 12. Avoid Dangerous Commands

Commands such as:

```bash
rm -rf
```

can permanently delete large amounts of data.

Always verify paths before executing destructive commands.

## 13. Keep Software Updated

Regular updates provide security fixes and bug fixes.

However, production systems should be updated through controlled processes.

## 🚗 Automobile Example

A production vehicle pipeline should follow:

```text
Incoming Data
     |
     v
Validation
     |
     v
Raw Storage
     |
     v
Processing
     |
     v
Quality Checks
     |
     v
Database
     |
     v
Monitoring
```

Each stage should have clear ownership, logging, and error handling.

## Interview Questions

1. What is least privilege?
2. Why should raw data be preserved?
3. Why should absolute paths be used?
4. Why is `chmod 777` discouraged?
5. Why is error handling important?
6. Why should scripts be stored in Git?

## Summary

Professional Linux practices reduce operational risks and make Data Engineering pipelines easier to maintain, secure, and troubleshoot.