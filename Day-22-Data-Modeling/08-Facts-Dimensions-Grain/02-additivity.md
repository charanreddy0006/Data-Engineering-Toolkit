# Additive, Semi-Additive, and Non-Additive Measures

## Additive

Usually safe to sum across relevant dimensions.

Examples:

```text
trip_distance_km
service_cost
part_quantity
```

## Semi-additive

Can be summed across some dimensions but not time.

Example:

```text
end_of_day_battery_soc
```

Summing SOC over days is meaningless.

## Non-additive

Ratios and percentages are usually not directly additive.

Example:

```text
efficiency = distance / energy
```

Correct fleet efficiency:

```sql
SUM(distance_km) / SUM(energy_kwh)
```

may differ from:

```sql
AVG(efficiency)
```

## Example

Vehicle A:

```text
100 km / 10 kWh = 10 km/kWh
```

Vehicle B:

```text
10 km / 2 kWh = 5 km/kWh
```

Simple average:

```text
7.5
```

Fleet ratio:

```text
110 / 12 = 9.17
```

The denominator matters.

## Rule

Document measure semantics, not only their data type.
