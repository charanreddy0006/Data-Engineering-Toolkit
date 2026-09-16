# Alerting

## Good Alert

```text
Signal + Condition + Severity + Impact + Owner + Runbook
```

Example:

```text
CRITICAL: vehicle telemetry freshness breached.
Dataset: curated.vehicle_telemetry
Owner: connected-vehicle
Runbook: automobile-project/incident-runbook.md
```

## Thresholds

Good for clear boundaries.

## Anomaly Detection

Useful when normal behavior changes with traffic, time, season, or fleet size.

## Alert Fatigue

Causes:
- too many alerts
- duplicate alerts
- poor thresholds
- no ownership
- no runbook

Fix by grouping related symptoms, tuning thresholds, assigning owners, and reviewing
alert quality.

## Routing

```text
Alert → Classify → Route → On-call → Runbook → Resolve
```
