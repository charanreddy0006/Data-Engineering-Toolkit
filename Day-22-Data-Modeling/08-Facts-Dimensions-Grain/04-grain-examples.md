# Fact Grain Examples

## Trip fact

> One row per completed vehicle trip.

Possible measures:

```text
distance_km
energy_kwh
duration_minutes
```

## Telemetry fact

> One row per measurement event.

Possible measures:

```text
speed_kph
battery_soc
engine_temp_c
odometer_km
```

## Service line fact

> One row per service order line.

Measures:

```text
quantity
unit_price
discount
cost
```

## Vehicle-day snapshot

> One row per vehicle per calendar day.

Measures:

```text
end_odometer_km
end_battery_soc
daily_distance_km
fault_count
```

## Warning

Do not put all four grains into one fact.

Separate business processes and combine them only at a common reporting grain.
