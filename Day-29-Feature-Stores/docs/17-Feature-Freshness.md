# 17. Feature Freshness

## Definition

Freshness measures how recently a feature value was updated relative to its expected schedule.

## Example

Requirement:
```text
fault_count_24h must be no more than 15 minutes stale.
```

If it is 2 hours old, the feature may no longer be suitable for real-time decisions.

## Freshness Metrics

- last successful update
- age of latest feature value
- percentage within SLA
- late materialization rate

## Alert Example

```text
Feature: battery_temperature_latest
Expected: ≤ 5 min stale
Observed: 22 min stale
Status: Breach
```

## Automobile Importance

A stale feature may lead to outdated vehicle-health predictions.

## Best Practice

Attach an explicit freshness contract to important online features.
