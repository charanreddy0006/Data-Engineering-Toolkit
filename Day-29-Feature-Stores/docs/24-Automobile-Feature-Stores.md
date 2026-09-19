# 24. Automobile Feature Stores 🚗

## Common Entities

- vehicle
- driver
- dealer
- customer
- charging station

## Vehicle Health Features

```text
fault_count_24h
fault_count_7d
avg_battery_temperature_7d
battery_soc_latest
```

## Usage Features

```text
distance_km_7d
distance_km_30d
average_trip_duration_7d
harsh_braking_count_24h
high_speed_events_24h
```

## Service Features

```text
days_since_last_service
service_count_90d
service_spend_365d
days_until_recommended_service
```

## EV Features

```text
charging_sessions_30d
fast_charge_ratio_30d
energy_per_100km_30d
average_charge_duration_30d
```

## ML Use Cases

- Predictive maintenance
- Service recommendation
- Warranty risk modeling
- Driver safety scoring
- EV range estimation
- Battery health prediction

## Design Principle

A feature should have a clear business definition and a timestamp-aware calculation.
