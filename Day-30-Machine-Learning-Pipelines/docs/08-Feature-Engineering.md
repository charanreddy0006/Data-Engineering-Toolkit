# 8. Feature Engineering

Transform raw fields into useful model inputs.

## Examples

```text
fault_count_24h
distance_km_30d
service_count_90d
days_since_last_service
energy_per_100km_30d
```

## Categories

### Aggregations
Count, sum, mean, min, max.

### Recency
Days since an event.

### Ratios
Energy per distance, cost per order.

### Windows
24-hour, 7-day, 30-day and 90-day features.

## Leakage

Do not use information that was unavailable at the prediction timestamp.

## Automobile example

For a September 20 prediction, a feature must not depend on a September 21 service event.
