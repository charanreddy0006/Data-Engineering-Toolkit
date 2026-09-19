# 6. Offline Feature Store

## What Is It?

The offline store contains historical feature values, generally associated with timestamps.

Typical uses:
- model training
- backtesting
- feature analysis
- historical reporting
- dataset generation

## Example

```text
vehicle_id | event_time  | avg_speed_7d
V001       | 2026-08-01  | 48.2
V001       | 2026-08-02  | 47.8
V002       | 2026-08-02  | 51.4
```

## Important Properties

- Historical records
- Event timestamps
- Reproducibility
- Large-scale storage
- Analytical querying

## Common Technologies

A feature platform may use:
- data warehouses
- cloud object storage
- columnar analytical stores

## Automobile Example

Store two years of:
- daily vehicle mileage
- rolling fault counts
- service history features
- energy efficiency features

These datasets can support retraining and model evaluation.
