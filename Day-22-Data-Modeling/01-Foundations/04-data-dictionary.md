# Data Dictionary

A data dictionary defines fields precisely.

| Field | Meaning | Type | Nullable | Key | Example |
|---|---|---|---|---|---|
| vehicle_id | Internal vehicle identifier | BIGINT | No | PK | 1001 |
| vin | Vehicle identifier | VARCHAR(17) | No | UK | DEMO... |
| model_year | Model year | SMALLINT | No | No | 2026 |
| powertrain_type | ICE/HEV/PHEV/BEV | VARCHAR | No | No | BEV |
| created_at | Creation timestamp | TIMESTAMP | No | No | 2026-01-01 |

## Measure definitions

A metric should include:

- definition;
- unit;
- grain;
- source;
- calculation;
- exclusions;
- owner.

Example:

```text
distance_km
Definition: distance traveled by one completed trip.
Unit: kilometers.
Grain: trip.
Source: trip calculation.
Additive: across trips.
```

## Why dictionaries matter

`vehicle_age` could mean:

- age since manufacturing;
- age since registration;
- age since purchase.

Those are different metrics.

## Naming

Prefer:

```text
vehicle_id
service_order_id
opened_at
closed_at
created_at
updated_at
```

Avoid vague fields:

```text
id
date
value
data
info
status1
```

## Governance

A production dictionary should also record:

- owner;
- source;
- sensitivity;
- retention;
- quality rules;
- lineage.

Documentation is part of the model.
