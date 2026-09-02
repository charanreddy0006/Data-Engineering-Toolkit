# End-to-End Project — Connected Vehicle Analytics Platform

## Business Goal

Build a production-inspired data model for connected vehicles.

The platform receives:

```text
Telemetry
Fault Events
Trips
Sales
Service Orders
Warranty Claims
```

## Architecture

```text
                    +----------------+
                    | Vehicle / IoT  |
                    +-------+--------+
                            |
                          Kafka
                            |
                            v
                    +---------------+
                    | Bronze / Raw  |
                    +-------+-------+
                            |
                   Cleaning / Dedup
                            |
                            v
                    +---------------+
                    | Silver Events |
                    +-------+-------+
                            |
                  Business Transform
                            |
                            v
                    +---------------+
                    | Gold Warehouse|
                    +-------+-------+
                            |
                 +----------+----------+
                 |                     |
                BI                    ML
```

## Core Facts

```text
FACT_SALES
FACT_SERVICE
FACT_TELEMETRY
FACT_TRIP
FACT_WARRANTY
```

## Shared Dimensions

```text
DIM_DATE
DIM_TIME
DIM_VEHICLE
DIM_CUSTOMER
DIM_DEALER
DIM_LOCATION
DIM_MODEL
```

## Grain

```text
FACT_SALES
one row per completed sale

FACT_SERVICE
one row per service order

FACT_TELEMETRY
one row per telemetry event

FACT_TRIP
one row per completed trip

FACT_WARRANTY
one row per warranty claim
```

## Design Requirements

### Identity

Create canonical vehicle identity across:

```text
Dealer vehicle ID
Service asset ID
IoT vehicle ID
VIN
```

### History

Use SCD Type 2 for selected descriptive attributes.

### Quality

Implement:

```text
deduplication
referential checks
range checks
required fields
schema validation
```

### Streaming

Model:

```text
event_time
ingest_time
event_id
schema_version
```

### Analytics

Support:

```text
Revenue
Service Cost
Fault Frequency
Vehicle Utilization
Average Daily Distance
Warranty Rate
Dealer Performance
```

## Project Deliverables

```text
1. Conceptual model
2. Logical model
3. Physical SQL
4. Star schema
5. SCD strategy
6. Telemetry event model
7. Quality checks
8. Analytical SQL
9. Architecture diagram
10. Documentation
```
