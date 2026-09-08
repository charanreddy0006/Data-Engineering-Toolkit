# What Is Data Quality?

Data quality is the degree to which data is fit for its intended use. It is broader than checking whether a file can be opened or whether a table contains the expected columns.

## Why it matters

Poor data can create:

- incorrect dashboards
- bad joins
- inflated metrics from duplicates
- broken ML features
- incorrect service decisions
- unreliable operational alerts
- failed regulatory or audit processes

## Validation vs quality

Validation evaluates an explicit rule:

```sql
SELECT COUNT(*)
FROM telemetry
WHERE speed_kmh < 0;
```

Data quality considers whether the dataset as a whole is trustworthy for its purpose.

A telemetry table can have valid speed values while being stale, incomplete, or linked to the wrong vehicles.

## Quality lifecycle

```text
Define expectations
       |
       v
Ingest --> Validate --> Measure --> Publish
              |           |
              v           v
         Quarantine     Monitor
              |           |
              +------> Remediate
```

## Context matters

`battery_soc` may be mandatory for an EV telemetry event but irrelevant for a pure ICE event.

Therefore a quality rule should include business context rather than treating every null as an error.

## Quality rule anatomy

A useful rule contains:

- rule_id
- dataset
- field
- dimension
- expectation
- threshold
- severity
- owner
- action

Example:

```text
DQ-TEL-001
Dataset: vehicle_telemetry
Field: vehicle_id
Expectation: must not be null
Threshold: 99.99%
Severity: Critical
Action: quarantine
```
