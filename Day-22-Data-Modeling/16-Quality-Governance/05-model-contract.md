# Model Contract

A published model should behave like an API.

Document:

```text
Model: fact_trip
Grain: one completed trip
Primary business key: trip_id
Required dimensions: vehicle, date
Measures: distance_km, energy_kwh
Null policy: energy may be null
Freshness: defined by pipeline SLA
Breaking-change policy: version and migration
Owner: Trip Analytics
```

## Why?

Downstream users depend on schemas.

A column rename can break:

- dashboards;
- ETL jobs;
- notebooks;
- APIs;
- ML features.

Treat published schemas as contracts and communicate breaking changes.
