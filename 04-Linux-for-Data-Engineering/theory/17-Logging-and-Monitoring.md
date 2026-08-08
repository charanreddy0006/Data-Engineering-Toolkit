# Logging and Monitoring

## Introduction

Logging records what happens during the execution of an application or data pipeline.

Monitoring helps engineers understand the health and performance of systems.

Both are essential in production Data Engineering.

## Why Logging Matters

Without logs, debugging a failed pipeline can be difficult.

A pipeline log may contain:

```text
Pipeline started
Input file detected
Records processed: 15000
Database load completed
Pipeline completed
```

## Basic Logging

```bash
echo "$(date) - Pipeline started" >> pipeline.log
```

Add another message:

```bash
echo "$(date) - Processing completed" >> pipeline.log
```

View logs:

```bash
cat pipeline.log
```

Follow logs:

```bash
tail -f pipeline.log
```

## Log Levels

Common levels include:

| Level | Purpose |
|---|---|
| DEBUG | Detailed information |
| INFO | Normal operation |
| WARNING | Potential problem |
| ERROR | Operation failed |
| CRITICAL | Serious failure |

## Example

```text
INFO: Pipeline started
INFO: File received
INFO: 5000 records processed
WARNING: 10 invalid records
ERROR: Database connection failed
```

## Error Handling

A Bash pipeline should stop when an important operation fails.

```bash
set -e
```

A stricter option is:

```bash
set -euo pipefail
```

## Monitoring

Useful Linux commands include:

```bash
top
```

```bash
df -h
```

```bash
free -h
```

```bash
uptime
```

These provide information about system resources.

## Disk Monitoring

```bash
df -h
```

can identify filesystems approaching capacity.

This is important because a pipeline may fail if there is insufficient disk space.

## Memory Monitoring

```bash
free -h
```

shows memory usage.

## Process Monitoring

```bash
ps aux
```

or:

```bash
top
```

can identify processes consuming excessive resources.

## 🚗 Vehicle Data Example

A vehicle telemetry pipeline may process millions of records.

```text
Vehicle Data
     |
     v
Ingestion
     |
     +--> Logs
     |
     v
Transformation
     |
     +--> Monitoring
     |
     v
Database
```

The engineer should monitor:

- Records processed
- Failed records
- Pipeline duration
- CPU usage
- Memory usage
- Disk usage

## Simple Monitoring Script

```bash
#!/bin/bash

echo "System Status"
echo "-------------"

echo "Disk:"
df -h

echo "Memory:"
free -h

echo "Uptime:"
uptime
```

## Best Practices

- Log important pipeline events.
- Include timestamps.
- Record errors clearly.
- Monitor disk space.
- Monitor long-running processes.
- Avoid logging passwords or secrets.
- Rotate large log files.

## Interview Questions

1. Why is logging important?
2. Difference between logging and monitoring?
3. How do you monitor disk usage?
4. How do you monitor memory?
5. Why should secrets never be written to logs?

## Summary

Logging and monitoring allow Data Engineers to detect failures, investigate problems, and maintain reliable production pipelines.
```

---

