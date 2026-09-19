# 13. Batch Features

## Definition

Batch features are calculated periodically from historical or accumulated data.

Examples:
- service_count_90d
- average_distance_30d
- monthly_service_spend
- warranty_claim_count_365d

## Pipeline

```text
Warehouse
   ↓
SQL Transformation
   ↓
Feature Table
   ↓
Offline Store
   ↓
Materialization
```

## Advantages

- simple operational model
- suitable for large-scale aggregation
- efficient for historical data

## Limitations

- not ideal for very low-latency signals
- feature freshness depends on schedule

## Automobile Example

Every night calculate:
```text
distance_km_30d
service_count_90d
average_energy_per_100km_30d
```

These can support next-day maintenance scoring.
