# Dimensional Modeling


## Definition

Dimensional modeling structures analytical data around measurable business
processes and descriptive dimensions.

The central ideas are:

```text
Business Process
Grain
Fact
Dimension
Measure
```

## Step 1 — Select the Business Process

Examples:

```text
Vehicle Sales
Vehicle Service
Warranty Claims
Telemetry
Charging
```

Do not start with a list of source tables.

## Step 2 — Declare Grain

For sales:

> One row represents one completed vehicle sale transaction.

For telemetry:

> One row represents one telemetry event emitted by one vehicle.

## Step 3 — Identify Dimensions

Sales may use:

```text
Date
Customer
Vehicle
Dealer
Location
```

## Step 4 — Identify Facts

Sales:

```text
quantity
gross_amount
discount_amount
tax_amount
net_amount
```

## Fact-Dimension Relationship

```text
             DIM_DATE
                |
DIM_CUSTOMER — FACT_SALES — DIM_VEHICLE
                |
             DIM_DEALER
```

## Why This Works

Analysts can answer:

```text
Revenue by month
Revenue by model
Revenue by dealer
Revenue by customer segment
```

without understanding every source-system table.

## Additivity

### Additive

```text
sales_amount
quantity
distance_km
```

can generally be summed across relevant dimensions.

### Semi-Additive

```text
inventory_balance
account_balance
```

can be summed across some dimensions but not meaningfully across time.

### Non-Additive

```text
margin_percentage
average_speed
```

should usually be recalculated from underlying components rather than summed.

## Conformed Dimensions

If sales and service both use:

```text
DIM_VEHICLE
DIM_DEALER
DIM_DATE
```

those dimensions should have consistent meanings.

## Grain Is Non-Negotiable

Do not put:

```text
sale_amount
service_cost
telemetry_distance
```

into one fact unless they genuinely share a common grain.

Usually they do not.

## Modeling Workflow

```text
Business process
→ Grain
→ Dimensions
→ Facts
→ Keys
→ History
→ Quality
→ Performance
```

## Practical Exercise

Design three marts:

```text
Sales Mart
Service Mart
Telemetry Mart
```

Identify their grain and shared conformed dimensions.
