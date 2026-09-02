# dbt Modeling Layout

```text
models/
├── staging/
│   ├── stg_vehicle.sql
│   ├── stg_customer.sql
│   ├── stg_sales.sql
│   └── stg_telemetry.sql
├── intermediate/
│   ├── int_vehicle_identity.sql
│   └── int_clean_telemetry.sql
└── marts/
    ├── dimensions/
    │   ├── dim_date.sql
    │   ├── dim_vehicle.sql
    │   ├── dim_customer.sql
    │   └── dim_dealer.sql
    └── facts/
        ├── fact_sales.sql
        ├── fact_service.sql
        └── fact_telemetry.sql
```

## Staging Responsibilities

```text
Rename
Cast
Standardize
Light cleaning
Source documentation
```

## Intermediate Responsibilities

```text
Identity resolution
Deduplication
Cross-source joins
Business preparation
```

## Mart Responsibilities

```text
Facts
Dimensions
Business metrics
Consumer-facing models
```

## Tests

Recommended:

```text
unique
not_null
relationships
accepted_values
```

For telemetry also test:

```text
event_time not null
event_id unique
battery range 0..100
temperature plausible range
```

## Documentation

Every important model should state:

```text
Purpose
Grain
Sources
Owner
Business definitions
Refresh behavior
Known limitations
```
