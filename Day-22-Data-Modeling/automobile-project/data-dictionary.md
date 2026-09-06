# Automobile Model Data Dictionary

| Model | Field | Meaning | Grain |
|---|---|---|---|
| dim_vehicle | vehicle_key | Historical warehouse version key | one version |
| dim_vehicle | vehicle_id | Durable business/source ID | one version |
| dim_vehicle | vin | Vehicle identifier | one version |
| fact_trip | trip_id | Completed trip identifier | one trip |
| fact_trip | distance_km | Trip distance | one trip |
| fact_trip | energy_kwh | Trip energy | one trip |
| fact_telemetry_event | event_id | Unique telemetry event | one event |
| fact_telemetry_event | event_time | Measurement time | one event |
| fact_telemetry_event | battery_soc | Battery state of charge | one event |
| vehicle_daily_snapshot | snapshot_date | State observation date | one vehicle-day |

Every new field should document:

- definition;
- unit;
- source;
- nullability;
- quality rule;
- owner;
- sensitivity.
