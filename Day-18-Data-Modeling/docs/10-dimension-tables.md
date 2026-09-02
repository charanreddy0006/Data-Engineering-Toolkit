# Dimension Tables


## Definition

Dimensions provide descriptive context for facts.

Examples:

```text
DIM_DATE
DIM_CUSTOMER
DIM_VEHICLE
DIM_DEALER
DIM_MODEL
DIM_LOCATION
```

## Dimension Example

```text
DIM_VEHICLE
-----------
vehicle_key
vehicle_id
vin
model_name
manufacturer
fuel_type
segment
```

## Dimension vs Fact

| Dimension | Fact |
|---|---|
| Describes | Measures |
| Usually wider | Usually taller |
| Attributes | Numeric events |
| Used for filtering | Used for aggregation |

## Date Dimension

A date dimension makes time analysis consistent.

```text
date_key
calendar_date
day
month
month_name
quarter
year
week
is_weekend
```

Instead of repeating date logic in every query, analysts can use one shared
calendar definition.

## Customer Dimension

Possible attributes:

```text
customer_key
customer_id
customer_segment
city
state
country
registration_date
```

## Vehicle Dimension

Possible attributes:

```text
vehicle_key
vehicle_id
vin
model
manufacturer
fuel_type
body_type
segment
```

## Dealer Dimension

```text
dealer_key
dealer_id
dealer_name
city
state
region
dealer_type
```

## Dimension History

If attributes change over time, choose an SCD strategy.

Example:

```text
customer_segment
dealer_region
vehicle_owner
```

## Unknown Member

A dimension may contain:

```text
key = 0
label = UNKNOWN
```

This helps handle late-arriving dimension data.

## Role-Playing Dimensions

The same date dimension can support:

```text
order_date_key
delivery_date_key
service_date_key
```

## Mini-Dimensions

Rapidly changing or high-cardinality attributes may sometimes be separated
into a mini-dimension.

The design depends on the workload and platform.

## Dimension Design Questions

```text
What attributes are useful for filtering?
Which attributes change?
Which changes require history?
Is the dimension shared by multiple facts?
What is the natural/business identifier?
```

## Practical Exercise

Design:

```text
DIM_DATE
DIM_VEHICLE
DIM_CUSTOMER
DIM_DEALER
```

Then list which attributes should be historical.
