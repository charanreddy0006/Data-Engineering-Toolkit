# Snowflake Schema

A snowflake schema normalizes dimension hierarchies.

```text
fact_trip
   |
dim_vehicle
   |
dim_model
   |
manufacturer
```

## Benefits

- reduced repeated hierarchy attributes;
- explicit master-data relationships;
- potentially better governance of shared hierarchies.

## Costs

- more joins;
- more complex BI;
- more semantic navigation.

## Automobile hierarchy

```text
Manufacturer
    ↓
Brand
    ↓
Model
    ↓
Vehicle
```

## Decision

Use a star when simplicity and self-service are priorities.

Consider snowflaking when shared master-data hierarchies or storage/governance concerns justify it.

Do not snowflake automatically because normalization is theoretically cleaner.
