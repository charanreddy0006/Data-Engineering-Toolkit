# 20. Feature Versioning

## Why Version?

Changing transformation logic can change model behavior.

Example:
```text
avg_speed_7d_v1
avg_speed_7d_v2
```

This makes the change explicit.

## Versioning Questions

- Was the formula changed?
- Was the source changed?
- Was the time window changed?
- Was the missing-value rule changed?
- Do old models depend on the previous version?

## Safe Strategy

```text
Develop v2
 ↓
Validate v2
 ↓
Run side-by-side
 ↓
Migrate consumers
 ↓
Retire v1
```

## Automobile Example

A service-frequency feature changes from calendar-day logic to event-time logic. Treat that as a meaningful versioned change.
