# Star Schema


## Definition

A star schema has a central fact table connected directly to dimensions.

```text
                  DIM_DATE
                     |
DIM_CUSTOMER — FACT_SALES — DIM_VEHICLE
                     |
                  DIM_DEALER
```

The visual shape resembles a star.

## Why It Is Popular

It is easy for:

- analysts
- BI tools
- dashboard developers
- data scientists
- data engineers

to understand.

## Example

```sql
CREATE TABLE dim_vehicle (
    vehicle_key BIGINT PRIMARY KEY,
    vehicle_id VARCHAR(50),
    model_name VARCHAR(100),
    manufacturer VARCHAR(100),
    fuel_type VARCHAR(30),
    segment VARCHAR(50)
);

CREATE TABLE fact_sales (
    date_key INT,
    vehicle_key BIGINT,
    dealer_key BIGINT,
    customer_key BIGINT,
    quantity INT,
    net_amount DECIMAL(18,2)
);
```

## Query

```sql
SELECT
    v.manufacturer,
    d.year,
    SUM(f.net_amount) AS revenue
FROM fact_sales f
JOIN dim_vehicle v
    ON f.vehicle_key = v.vehicle_key
JOIN dim_date d
    ON f.date_key = d.date_key
GROUP BY
    v.manufacturer,
    d.year;
```

## Star Characteristics

Dimensions often contain repeated descriptive attributes:

```text
manufacturer
region
segment
fuel_type
```

This reduces the number of joins required for common queries.

## Advantages

- simple mental model
- BI-friendly
- fewer joins
- predictable reporting
- reusable dimensions

## Disadvantages

- dimension redundancy
- potentially larger dimension tables
- hierarchy duplication

## When to Use

A star schema is a strong default for many analytical marts when the
workload is primarily reporting and BI.

## Multiple Facts

A warehouse can have:

```text
FACT_SALES
FACT_SERVICE
FACT_WARRANTY
FACT_TELEMETRY
```

with shared dimensions.

```text
             DIM_DATE
             /             FACT_SALES  FACT_SERVICE
             \      /
             DIM_VEHICLE
```

## Important

Shared dimensions must have consistent definitions.

## Practical Exercise

Build a sales star schema and write five queries:

```text
Revenue by month
Revenue by model
Revenue by dealer
Units by fuel type
Revenue by customer segment
```
