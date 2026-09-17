# 5. Star Schema

## Definition
A star schema contains a central fact table connected directly to descriptive dimension tables.

```text
             dim_vehicle
                  |
dim_date — fact_trip — dim_location
                  |
             dim_customer
```

## Example
Fact:
`fact_trip`

Dimensions:
- `dim_date`
- `dim_vehicle`
- `dim_customer`
- `dim_location`

## Advantages
- Simple for BI users
- Efficient analytical joins
- Clear business meaning
- Good dashboard usability
- Easy aggregation

## Star vs Snowflake
Star schema keeps dimensions relatively wide and directly connected to facts. Snowflake schema normalizes dimensions into additional related tables.

## Practical Guidance
Use a star schema when usability and predictable BI querying are priorities. Normalize dimensions only when there is a clear reason.

## Automobile Model
```text
dim_date
    |
dim_vehicle — fact_service — dim_dealer
    |              |
dim_model       dim_customer
```
