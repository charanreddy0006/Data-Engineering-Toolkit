# Production Data Modeling Architecture


## Production View

A mature platform separates ingestion, integration, modeling, serving, and
governance.

```text
Sources
  |
  +--> Batch
  +--> CDC
  +--> Streaming
          |
          v
      Landing / Raw
          |
          v
      Standardized Layer
          |
          v
      Integration Layer
          |
          v
    Dimensional / Gold
          |
     +----+----+
     |         |
    BI        ML
```

## Source Layer

Examples:

```text
PostgreSQL
ERP
CRM
Dealer API
Kafka
IoT gateway
```

## Raw Layer

Preserve source information for:

- replay
- debugging
- audit
- historical reconstruction

## Standardized Layer

Convert:

```text
types
timestamps
identifiers
units
codes
```

Example:

```text
miles → kilometers
Fahrenheit → Celsius
source VIN field → canonical VIN
```

## Integration Layer

Resolve cross-source identity.

Example:

```text
Dealer vehicle_id
IoT vehicle_id
Service asset_id
        ↓
Canonical vehicle_id
```

## Gold Layer

Expose business-friendly models:

```text
fact_sales
fact_service
fact_telemetry
dim_vehicle
dim_customer
dim_dealer
dim_date
```

## Semantic Layer

Business users should see definitions such as:

```text
Revenue
Units Sold
Service Cost
Warranty Rate
Average Daily Distance
```

The semantic layer should not redefine metrics inconsistently across dashboards.

## Operational Requirements

Production models need:

```text
Version control
Testing
Deployment
Monitoring
Lineage
Ownership
Documentation
Rollback strategy
```

## Model Change Process

```text
Requirement
   ↓
Impact Analysis
   ↓
Model Change
   ↓
Tests
   ↓
Backfill / Migration
   ↓
Deploy
   ↓
Monitor
```

## Backward Compatibility

If consumers expect:

```text
customer_id
```

do not silently rename it.

Use:

```text
versioned contract
deprecation period
migration communication
```

## Scalability

Estimate:

```text
Daily rows
Peak events/sec
Storage growth
Query concurrency
Retention
```

For telemetry, a small number of vehicles can still produce enormous event
volume over time.

## Production Principle

A data model is an operational asset. Treat schema changes with the same care
as application API changes.
