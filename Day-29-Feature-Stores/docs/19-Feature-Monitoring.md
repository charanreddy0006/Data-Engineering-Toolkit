# 19. Feature Monitoring

## What to Monitor

```text
Availability
Freshness
Quality
Distribution
Volume
Lineage
Serving Latency
```

## Drift vs Quality

**Data drift:** input distribution changes over time.

**Data quality issue:** values violate correctness or completeness expectations.

They may occur independently.

## Example

A new vehicle model causes average battery capacity to increase. That may be legitimate drift, not an error.

## Dashboard Metrics

- feature freshness SLA
- null percentage
- invalid percentage
- p95 serving latency
- feature update failures
- distribution shift indicators

## Alerting

Alert on actionable thresholds, not every small fluctuation.

## Automobile Example

Watch:
```text
distance_km_7d
fault_count_24h
battery_soc
energy_per_100km_30d
```

for unusual changes and pipeline failures.
