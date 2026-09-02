# Snowflake Schema


## Definition

A snowflake schema normalizes some dimensions.

Star:

```text
FACT_SALES
    |
DIM_VEHICLE
```

Snowflake:

```text
FACT_SALES
    |
DIM_VEHICLE
    |
DIM_MODEL
    |
DIM_MANUFACTURER
```

## Why Normalize Dimensions?

Suppose many vehicle records repeat:

```text
manufacturer_name
manufacturer_country
manufacturer_group
```

A separate manufacturer entity can reduce duplication.

## Example

```text
DIM_VEHICLE
vehicle_key
model_key
fuel_type

DIM_MODEL
model_key
model_name
manufacturer_key

DIM_MANUFACTURER
manufacturer_key
manufacturer_name
country
```

## Query

```sql
SELECT
    m.manufacturer_name,
    SUM(f.net_amount) AS revenue
FROM fact_sales f
JOIN dim_vehicle v
    ON f.vehicle_key = v.vehicle_key
JOIN dim_model mo
    ON v.model_key = mo.model_key
JOIN dim_manufacturer m
    ON mo.manufacturer_key = m.manufacturer_key
GROUP BY m.manufacturer_name;
```

## Advantages

- reduced dimension redundancy
- explicit hierarchy
- centralized attributes
- useful for complex shared hierarchies

## Disadvantages

- more joins
- more complex SQL
- harder for casual BI users
- potentially more complex semantic modeling

## Star vs Snowflake

| Question | Star | Snowflake |
|---|---|---|
| Simplicity | Strong | Moderate |
| Joins | Fewer | More |
| Dimension redundancy | Higher | Lower |
| BI usability | Strong | Depends |
| Hierarchies | Simple | Explicit |

## Decision Rule

Use a snowflake structure when normalization solves a real requirement.

Do not normalize dimensions mechanically.

## Hybrid

Real systems can combine both:

```text
Core warehouse:
more normalized

Business marts:
star schemas
```

## Practical Exercise

Take a vehicle star schema and split:

```text
manufacturer
model
variant
```

into a snowflake hierarchy. Compare the number of joins needed for common
queries.
