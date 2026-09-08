# Data Quality Alerting

A useful alert is actionable.

Bad:

```text
DATA QUALITY FAILED
```

Better:

```text
Dataset: vehicle_telemetry
Rule: DQ-TEL-004
Metric: invalid SOC rate
Current: 7.2%
Threshold: 0.1%
Partition: 2026-09-08/19
Severity: Critical
Owner: connected-vehicle-platform
Action: inspect producer release
```

Alert levels:

- Informational
- Warning
- High
- Critical

Reduce alert fatigue using grouping, cooldowns, suppression, severity, and ownership.
