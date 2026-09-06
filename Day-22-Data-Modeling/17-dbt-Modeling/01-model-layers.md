# dbt-Oriented Model Layers

A common transformation structure:

```text
sources
  ↓
staging
  ↓
intermediate
  ↓
marts
```

## Staging

Standardize source fields:

```text
raw_vehicle -> stg_vehicle
```

Typical work:

- rename;
- cast;
- standardize;
- light cleanup.

## Intermediate

Reusable business logic:

```text
int_vehicle_trip_enriched
```

## Marts

Consumer-facing models:

```text
dim_vehicle
fct_trip
mart_fleet_daily
```

## Why layers?

Avoid one enormous SQL model mixing source cleanup, business logic, aggregation, and presentation.

Each layer should have a clear responsibility.
