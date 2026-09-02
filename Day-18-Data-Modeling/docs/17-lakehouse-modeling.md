# Lakehouse and Medallion Modeling


## Lakehouse Modeling

A lakehouse combines data-lake flexibility with warehouse-style analytical
management.

A common organization is:

```text
Bronze
  ↓
Silver
  ↓
Gold
```

These are logical layers, not universal technical requirements.

## Bronze

Purpose:

- preserve source data
- support replay
- maintain ingestion history
- minimize transformation

Example:

```text
vehicle_events_raw
```

Typical fields:

```text
ingest_time
source_system
raw_payload
source_event_id
```

## Silver

Purpose:

- clean data
- standardize types
- deduplicate
- validate
- integrate sources

Example:

```text
vehicle_events_clean
```

## Gold

Purpose:

- business-ready data
- reporting
- analytics
- ML features
- semantic models

Example:

```text
vehicle_daily_metrics
monthly_model_sales
dealer_service_performance
```

## Important Design Question

Do not assume every Bronze, Silver and Gold table has the same schema.

Each layer has a different purpose.

## Example Flow

```text
IoT JSON
   ↓
Bronze raw event
   ↓
Parse + validate
   ↓
Silver telemetry event
   ↓
Aggregate
   ↓
Gold daily vehicle metrics
```

## Gold Modeling

Gold can use:

```text
Star schema
Wide tables
Aggregations
Feature tables
Semantic-layer datasets
```

## Slowly Changing Data in Lakehouses

History can be represented through:

```text
effective timestamps
change records
version columns
merge operations
snapshot tables
```

The exact implementation depends on the storage technology.

## Data Quality

Silver is often a strong location for:

```text
schema validation
duplicate detection
null checks
range checks
standardized identifiers
```

But critical quality checks should exist at multiple layers.

## Schema Evolution

Source systems change.

Examples:

```text
New JSON field
Renamed field
Changed type
New event type
```

The model should define how changes are handled rather than silently breaking
downstream consumers.

## Automobile Example

```text
Bronze:
raw_vehicle_telemetry

Silver:
vehicle_telemetry_clean

Gold:
vehicle_daily_health
vehicle_fault_summary
vehicle_utilization
```

## Key Principle

Layering is about responsibility:

```text
Bronze = preserve
Silver = refine
Gold = serve
```
