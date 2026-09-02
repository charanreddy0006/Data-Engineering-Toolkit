# Fact Table Grain


## Grain Definition

Grain is the precise meaning of one row.

Examples:

```text
One row per sale
One row per service order
One row per vehicle per day
One row per telemetry event
One row per warranty claim
```

## Why Grain Is So Important

If grain is unclear, you cannot reliably answer:

```text
What does COUNT(*) mean?
What does SUM(amount) mean?
Can I join this fact to another fact?
Can I aggregate by month?
```

## Example

Suppose:

```text
FACT_SALES
```

contains:

```text
invoice_number
vehicle_key
quantity
amount
```

Grain:

> One row per invoice line for a vehicle sale.

This is different from:

> One row per invoice.

## Grain and Measures

If the grain is one row per invoice line:

```text
quantity
line_amount
discount
```

are valid.

If you add:

```text
monthly_customer_revenue
```

you are mixing an aggregate into a transaction-level table.

## Mixed Grain Problem

Bad:

```text
FACT_ACTIVITY
sale_amount
service_cost
daily_distance
```

These belong to different processes.

Better:

```text
FACT_SALES
FACT_SERVICE
FACT_VEHICLE_DAILY
```

## Grain and Joins

Two facts should not automatically be joined directly.

Example:

```text
FACT_SALES
one row per sale

FACT_SERVICE
one row per service order
```

Joining them by vehicle can multiply records.

If a vehicle has:

```text
5 sales records
3 service records
```

a direct join can produce 15 rows.

This can inflate measures.

## Correct Approach

Aggregate each fact to the required analytical grain before combining them.

```sql
WITH sales AS (
    SELECT
        vehicle_key,
        SUM(net_amount) AS revenue
    FROM fact_sales
    GROUP BY vehicle_key
),
service AS (
    SELECT
        vehicle_key,
        SUM(service_cost) AS service_cost
    FROM fact_service
    GROUP BY vehicle_key
)
SELECT
    s.vehicle_key,
    s.revenue,
    COALESCE(v.service_cost, 0) AS service_cost
FROM sales s
LEFT JOIN service v
    ON s.vehicle_key = v.vehicle_key;
```

## Grain Checklist

Before approving a fact:

```text
[ ] One-row meaning written
[ ] All measures match grain
[ ] Keys match grain
[ ] Duplicate business events understood
[ ] Aggregation behavior tested
[ ] Join behavior tested
```

## Golden Interview Answer

If asked "What is the most important step in dimensional modeling?"

A strong answer is:

> Declaring the grain of each fact table before choosing dimensions and
> measures.
