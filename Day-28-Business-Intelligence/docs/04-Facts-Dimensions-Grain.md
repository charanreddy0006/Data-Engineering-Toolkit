# 4. Facts, Dimensions and Grain

## Fact Table
Stores measurable business events.

Examples:
- Vehicle sale
- Service order
- Warranty claim
- Charging session
- Trip

## Dimension Table
Stores descriptive context.

Examples:
- Vehicle
- Customer
- Dealer
- Date
- Location
- Vehicle model

## Grain
Grain states exactly what one row represents.

Example:
> One row = one completed vehicle trip.

## Why Grain Matters
Incorrect grain can cause:
- Double counting
- Incorrect joins
- Inflated revenue
- Wrong averages

## Example
A trip fact might contain:
```text
trip_key
vehicle_key
date_key
distance_km
energy_kwh
duration_min
```

A service fact might contain:
```text
service_key
vehicle_key
dealer_key
date_key
labor_amount
parts_amount
```

## Rule
Declare grain before creating the fact table.

## Automobile Example
For a charging fact:
> One row represents one charging session.

This lets you safely calculate total energy, session count and average energy per session.
