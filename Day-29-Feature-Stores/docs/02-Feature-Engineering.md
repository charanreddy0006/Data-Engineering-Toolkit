# 2. Feature Engineering

## Definition

Feature engineering transforms raw data into useful model inputs.

Example:

Raw:
```text
service_date
vehicle_id
odometer_km
```

Derived:
```text
days_since_last_service
mileage_since_last_service
service_count_90d
```

## Common Transformations

### Aggregation
```text
mean(speed) over 7 days
sum(energy_kwh) over 30 days
count(fault_event) over 24 hours
```

### Ratios
```text
energy_per_100km = energy_kwh / distance_km * 100
```

### Recency
```text
days_since_last_service
```

### Frequency
```text
fault_count_30d
```

### Categorical Transformation
Examples:
- fuel_type
- vehicle_segment
- region
- transmission_type

## Leakage Warning

A training feature must not contain information that would only become available after the prediction time.

Example:
If predicting whether a vehicle will require service next week, a feature based on next week's completed service order is leakage.

## Good Feature Engineering

A good feature is:
- relevant
- measurable
- reproducible
- time-aware
- testable
- explainable
