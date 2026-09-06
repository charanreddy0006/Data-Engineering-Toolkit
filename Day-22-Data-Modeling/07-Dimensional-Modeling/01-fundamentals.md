# Dimensional Modeling

Dimensional modeling organizes analytical data around business processes.

```text
Fact       = event / measurement
Dimension  = descriptive context
Grain      = exact row meaning
```

Example:

```text
dim_vehicle ─┐
dim_date ────┼── fact_trip
dim_customer ┘
```

## Facts

Examples:

- distance_km;
- energy_kwh;
- service_cost;
- labor_hours;
- quantity.

## Dimensions

Examples:

- vehicle;
- customer;
- dealer;
- model;
- date;
- geography.

## Business question

"Distance by model by month" becomes:

```text
fact_trip
 -> dim_vehicle
 -> dim_model
 -> dim_date
```

## Design from business process

Start with:

```text
Trip
Service
Warranty
Charging
Manufacturing
Fault
```

Then define the grain, dimensions, and measures.

Never start by copying a source table into a fact table.
