# 9. Feature Entities

## Definition

An entity identifies the subject for which a feature is calculated.

Examples:
- customer
- account
- vehicle
- driver
- device
- dealer

## Automobile Entity

```text
vehicle_id
```

Feature examples:
```text
vehicle_age_days
service_count_90d
fault_count_24h
distance_km_30d
```

## Composite Entity

Some features depend on more than one entity.

Example:
```text
vehicle_id + dealer_id
```

This may represent vehicle/dealer interactions.

## Entity Design Rule

The entity key should be:
- stable enough for the business use
- unique within the intended scope
- consistently represented across sources

## Timestamp

Feature values also need time semantics.

```text
vehicle_id = V1
event_time = 2026-09-19 12:00
feature = battery_soc = 58
```

Without the time dimension, historical correctness becomes difficult.
