# Fact Tables


## What Is a Fact Table?

A fact table stores measurable business events, measurements, or periodic
states.

Examples:

```text
FACT_SALES
FACT_SERVICE
FACT_TELEMETRY
FACT_WARRANTY
```

## Transaction Fact

One row per business transaction.

```text
FACT_SALES
sale_date_key
vehicle_key
customer_key
dealer_key
invoice_number
quantity
sales_amount
```

## Periodic Snapshot

One row per entity per period.

Example:

```text
FACT_VEHICLE_DAILY
date_key
vehicle_key
distance_km
fuel_used_l
fault_count
```

Grain:

> One row per vehicle per day.

## Accumulating Snapshot

Tracks a process through milestones.

```text
service_order
created_at
scheduled_at
checkin_at
repair_start_at
completed_at
```

This is useful for process-cycle analysis.

## Factless Fact

Some events have no numeric measure.

Example:

```text
FACT_WARRANTY_INSPECTION
date_key
vehicle_key
dealer_key
inspection_type_key
```

The existence of the row represents the event.

## Degenerate Dimensions

A transaction identifier can remain directly in the fact.

```text
invoice_number
service_order_number
```

No separate dimension is required if there is no additional descriptive
attribute.

## Foreign Keys

Facts usually contain keys to dimensions:

```text
date_key
vehicle_key
dealer_key
customer_key
```

## Measures

Before adding a measure, ask:

```text
What does it mean?
At what grain was it captured?
Can it be summed?
Is it derived?
```

## Fact Table Design

Example:

```sql
CREATE TABLE fact_sales (
    date_key INT NOT NULL,
    vehicle_key BIGINT NOT NULL,
    customer_key BIGINT NOT NULL,
    dealer_key BIGINT NOT NULL,
    invoice_number VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    gross_amount DECIMAL(18,2) NOT NULL,
    discount_amount DECIMAL(18,2) NOT NULL,
    net_amount DECIMAL(18,2) NOT NULL
);
```

## Common Mistake

A fact table is not simply a "big table of numbers".

It represents a clearly defined business process at a declared grain.

## Performance Considerations

Fact tables are often the largest tables, so consider:

- partitioning by event date
- clustering by frequent filters
- appropriate numeric types
- compression
- avoiding unnecessary columns
- incremental loading

## Practical Exercise

Create:

```text
FACT_SALES
FACT_SERVICE
FACT_TELEMETRY
```

Write a one-sentence grain statement for each.
