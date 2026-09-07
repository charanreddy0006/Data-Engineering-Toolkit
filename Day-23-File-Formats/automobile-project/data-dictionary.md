# Automobile Data Dictionary

| Field | Meaning | Grain | Unit |
|---|---|---|---|
| vehicle_key | Historical warehouse version | vehicle version | key |
| vehicle_id | Business/source identifier | vehicle version | identifier |
| event_id | Unique telemetry event | telemetry event | identifier |
| event_time | When measurement happened | telemetry event | timestamp |
| ingestion_time | When platform received it | telemetry event | timestamp |
| speed_kph | Vehicle speed | telemetry event | km/h |
| battery_soc | State of charge | telemetry event | % |
| odometer_km | Odometer measurement | telemetry event | km |
| distance_km | Trip distance | trip | km |
| energy_kwh | Trip energy | trip | kWh |
| daily_distance_km | Distance in snapshot day | vehicle-day | km |

## Contract

Every field should additionally have:

```text
source
owner
nullable
quality rule
schema version
sensitivity
retention
```
