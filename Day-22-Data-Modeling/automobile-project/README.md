# Automobile Data Modeling Project 🚗

A complete practice model for a connected automotive analytics platform.

## Source domains

```text
Vehicle Gateway
Dealer Systems
Warranty Systems
Manufacturing
Customer Systems
Charging Network
```

## Target models

Dimensions:

```text
dim_date
dim_vehicle
dim_customer
dim_dealer
dim_model
```

Facts:

```text
fact_trip
fact_telemetry_event
fact_service
fact_warranty
fact_charging
fact_manufacturing_event
```

Snapshot:

```text
vehicle_daily_snapshot
```

## Architecture

```text
Sources
   ↓
Raw / Bronze
   ↓
Canonical / Silver
   ↓
Business Models
   ↓
Gold Warehouse
   ↓
BI / ML / APIs
```

## Quality

- duplicate event IDs;
- invalid SOC;
- negative distance;
- orphan vehicle IDs;
- SCD overlaps;
- invalid timestamps.

## Portfolio goal

Explain every table's grain, key, relationship, history strategy, quality rules, and physical design.
