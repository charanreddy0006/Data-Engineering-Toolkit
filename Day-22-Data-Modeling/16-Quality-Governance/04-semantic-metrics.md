# Semantic Metrics

A structurally correct model can still produce conflicting metrics.

Example:

Team A:

```text
Active vehicle = at least one telemetry event in 24 hours
```

Team B:

```text
Active vehicle = at least one completed trip in 24 hours
```

Both queries can be valid SQL.

## Metric contract

Document:

```text
metric_name
definition
grain
filters
calculation
owner
refresh
```

Example:

```text
Fleet efficiency
= SUM(distance_km) / SUM(energy_kwh)

Scope: completed trips
Exclusion: test vehicles
Refresh: daily
```

## Key lesson

Business semantics are part of data modeling.
