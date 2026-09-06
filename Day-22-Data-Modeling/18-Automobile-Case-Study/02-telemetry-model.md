# Connected Vehicle Telemetry Model

## Grain

> One row represents one measurement event produced by one vehicle at one event timestamp.

Suggested fields:

```text
event_id
vehicle_id
event_time
ingestion_time
sequence_number
latitude
longitude
speed_kph
battery_soc
battery_temperature_c
engine_temp_c
odometer_km
schema_version
```

## Canonical units

```text
speed -> km/h
distance -> km
temperature -> Celsius
energy -> kWh
SOC -> percentage
```

## Time

Keep both:

```text
event_time
ingestion_time
```

A network delay should not move the business event into a later reporting period.

## Quality

```text
battery_soc: 0..100
speed_kph: >= 0
odometer_km: >= 0
```

## Optional sensors

Different vehicle models may not support every sensor.

Model optionality deliberately rather than treating missing sensor support as bad data.

## Analytical derivative

Build:

```text
vehicle_daily_metrics
```

for dashboard workloads instead of repeatedly scanning raw telemetry.
