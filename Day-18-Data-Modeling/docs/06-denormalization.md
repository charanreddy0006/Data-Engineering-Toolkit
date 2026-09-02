# Denormalization


## Definition

Denormalization intentionally introduces redundancy or combines structures
to make specific workloads simpler or faster.

It is not "bad normalization". It is a deliberate design decision.

## Why Analytical Systems Denormalize

Analytical workloads often perform:

```text
Large scans
Aggregations
Joins across billions of rows
Repeated dimensional lookups
```

A well-designed star schema keeps common analytical joins predictable.

## Example

Normalized:

```text
SALE → VEHICLE → MODEL → MANUFACTURER
```

A reporting model might expose:

```text
FACT_SALES
+
DIM_VEHICLE
    model_name
    manufacturer
    fuel_type
```

## Wide Table

```text
vehicle_daily_metrics
---------------------
date
vehicle_id
model
manufacturer
region
distance_km
fuel_used_l
service_cost
fault_count
```

This can be convenient for downstream consumers.

## Advantages

- fewer joins
- simpler SQL
- easier BI consumption
- potentially better read performance
- predictable reporting

## Disadvantages

- duplicated values
- additional storage
- refresh complexity
- consistency risks
- more difficult corrections

## Intentional Redundancy

If a gold table contains:

```text
manufacturer
```

even though it exists elsewhere, document:

```text
Source of truth
Transformation
Refresh frequency
Expected consistency
Owner
```

## Materialized Aggregation

Another form of denormalization is a summary table.

```sql
CREATE TABLE monthly_model_sales AS
SELECT
    model_key,
    DATE_TRUNC('month', sale_date) AS month,
    SUM(amount) AS revenue,
    COUNT(*) AS units
FROM sales
GROUP BY
    model_key,
    DATE_TRUNC('month', sale_date);
```

## When to Use

Use denormalization when measurements show that it solves a real access
problem.

Do not duplicate data just because joins look inconvenient.

## OLTP vs Warehouse

A common pattern is:

```text
Normalized OLTP
      ↓
ETL / ELT
      ↓
Dimensional Warehouse
```

Both models are correct for their respective workloads.

## Review Questions

Before denormalizing:

```text
What query becomes faster?
How often is it executed?
How much duplicate data is introduced?
How will it stay consistent?
Who owns the derived dataset?
```
