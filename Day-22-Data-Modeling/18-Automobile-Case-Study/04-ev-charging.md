# EV Charging Model

## Charging session grain

> One row represents one charging session for one vehicle at one charging location.

Fields:

```text
charging_session_id
vehicle_id
charger_id
location_id
start_time
end_time
start_soc
end_soc
energy_kwh
cost
```

## Derived metrics

```text
duration_minutes
soc_gain
cost_per_kwh
```

## Important warning

Do not assume:

```text
SOC difference × nominal battery capacity
```

equals exact energy delivered.

Charging losses, measurement precision, battery conditions, and capacity assumptions matter.

## Analytics

- energy by model;
- charging cost by location;
- average duration;
- charging behavior;
- peak charging periods.

## Grain

A daily charging aggregate is a separate vehicle-day grain.
