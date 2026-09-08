# Streaming Quality Anomaly Signals

Useful signals:

```text
events_per_second
invalid_events_per_second
duplicate_rate
null_rate
event_lag
DLQ_rate
```

Example policy:

```text
IF invalid_rate > 1%
FOR 5 consecutive minutes
THEN create high-severity incident
```

Avoid paging on one bad record. Use windows, thresholds, cooldowns, suppression, and source-specific baselines.

Automobile example: one vehicle sending an invalid SOC is a row-level problem; 40% of the fleet doing it at once is likely a producer, firmware, or contract problem.
