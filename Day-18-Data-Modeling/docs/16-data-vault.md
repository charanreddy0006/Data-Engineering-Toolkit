# Data Vault Modeling


## What Is Data Vault?

Data Vault is an approach for integrating data from multiple sources while
preserving historical information and source traceability.

The major structures are:

```text
Hub
Link
Satellite
```

## Hub

Represents a core business key.

Example:

```text
HUB_VEHICLE
vehicle_hk
vehicle_id
load_datetime
record_source
```

The hub is about identity, not descriptive attributes.

## Link

Represents a relationship.

```text
LINK_VEHICLE_CUSTOMER
link_hk
vehicle_hk
customer_hk
load_datetime
record_source
```

## Satellite

Stores descriptive attributes and their history.

```text
SAT_VEHICLE
vehicle_hk
model
color
fuel_type
load_datetime
record_source
hash_diff
```

## Automobile Example

Sources:

```text
Dealer System
IoT Platform
Service System
CRM
```

Each source may have different structures.

A Data Vault layer can preserve source-specific history before business-facing
dimensional marts are built.

## Architecture

```text
Sources
  ↓
Landing
  ↓
Raw Vault
  ├── Hubs
  ├── Links
  └── Satellites
        ↓
Business Vault
        ↓
Dimensional Marts
        ↓
BI
```

## Hash Keys

Data Vault implementations often use deterministic hash keys for scalable
integration.

Conceptually:

```text
vehicle_hk = HASH(vehicle_business_key)
```

The exact algorithm and canonicalization rules must be standardized.

## Record Source

A satellite often records:

```text
record_source
load_datetime
```

This supports lineage and auditability.

## Benefits

- historical tracking
- source traceability
- flexible integration
- scalable ingestion
- separation of identity and attributes

## Costs

- many tables
- complex querying
- additional transformations
- requires strong modeling discipline

## Data Vault vs Star

| Data Vault | Star |
|---|---|
| Integration layer | Consumption layer |
| History-focused | Analytics-focused |
| More tables | Simpler query shape |
| Source traceability | BI usability |

## Important

Data Vault and dimensional modeling are not mutually exclusive.

A platform can use:

```text
Raw Vault → Business Vault → Star Marts
```

## Practical Exercise

Create:

```text
HUB_CUSTOMER
HUB_VEHICLE
LINK_VEHICLE_CUSTOMER
SAT_VEHICLE
SAT_CUSTOMER
```

Then explain which attributes belong in each structure.
