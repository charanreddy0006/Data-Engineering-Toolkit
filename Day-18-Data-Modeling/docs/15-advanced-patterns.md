# Advanced Dimensional Modeling Patterns


## Conformed Dimensions

A conformed dimension is shared across multiple business processes.

Example:

```text
DIM_DATE
   |
   +── FACT_SALES
   +── FACT_SERVICE
   +── FACT_WARRANTY
```

If `DIM_DATE.year` means calendar year in one mart and fiscal year in another,
the platform can become inconsistent. Business definitions must be explicit.

## Role-Playing Dimension

One dimension can have multiple roles.

```text
DIM_DATE
  ├── order_date_key
  ├── delivery_date_key
  └── service_date_key
```

The physical table can remain one dimension.

## Degenerate Dimension

A transaction identifier can remain directly in a fact:

```text
invoice_number
service_order_number
```

It is useful when there are no additional dimension attributes.

## Junk Dimension

Small flags can be grouped:

```text
DIM_JUNK
online_flag
priority_flag
warranty_flag
```

This avoids creating many tiny dimensions.

## Bridge Table

Used for many-to-many relationships.

```text
Vehicle
   |
Vehicle_Feature
   |
Feature
```

Example:

```sql
CREATE TABLE bridge_vehicle_feature (
    vehicle_key BIGINT,
    feature_key BIGINT,
    allocation_weight DECIMAL(9,6)
);
```

Allocation weights can help prevent double-counting in some analytical
scenarios.

## Hierarchies

A geographic hierarchy:

```text
Country
 ↓
State
 ↓
City
 ↓
Dealer
```

A vehicle hierarchy:

```text
Manufacturer
 ↓
Brand
 ↓
Model
 ↓
Variant
 ↓
Vehicle
```

## Mini-Dimension

Rapidly changing or frequently analyzed customer attributes may be separated.

Example:

```text
Customer Dimension
Mini Customer Profile Dimension
```

This is a specialized pattern and should be justified by workload.

## Factless Facts

A row itself represents an event.

Example:

```text
Vehicle qualified for warranty campaign
```

No amount is required.

## Accumulating Snapshot

Useful for lifecycle analysis:

```text
Service Order
created_at
scheduled_at
checkin_at
repair_start_at
completed_at
```

This allows cycle-time metrics.

## Outrigger

An attribute group can sometimes be separated from a dimension, but overuse
can turn a star into an unnecessarily complex snowflake.

## Practical Design Rule

Advanced patterns should solve a real business or technical problem. They
should not be added simply to make a schema look sophisticated.
