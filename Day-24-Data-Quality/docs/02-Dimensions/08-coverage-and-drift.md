# Coverage and Distribution Drift

## Coverage

Coverage asks whether expected entities or periods are represented.

```text
active vehicles = 50,000
vehicles reporting = 49,200
coverage = 98.4%
```

## Distribution drift

Every value can be valid while the overall distribution changes unexpectedly.

Track:

- mean
- median
- percentiles
- min/max
- null rate
- category frequency
- distinct count
- histograms

Example: if normal SOC has 10% of events in the 0–20% range but today's data has only 1%, investigate before assuming the change is a bug.

Use historical baselines and business context to avoid alerting on legitimate seasonal changes.
