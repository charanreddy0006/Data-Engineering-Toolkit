# 21. Feature Lineage

## What Is Lineage?

Lineage describes where a feature comes from and how it was produced.

```text
vehicle_events
      ↓
clean_telemetry
      ↓
trip_aggregates
      ↓
avg_distance_30d
      ↓
maintenance_model
```

## Useful Metadata

- source tables
- source columns
- transformation code
- upstream jobs
- downstream models
- owner
- version

## Why Lineage Matters

When a source column changes, teams can identify affected features.

## Automobile Example

If `odometer_km` changes definition, identify features depending on it:
- distance_since_service
- mileage_30d
- utilization_rate

## Best Practice

Treat lineage as part of the feature product, not optional documentation.
