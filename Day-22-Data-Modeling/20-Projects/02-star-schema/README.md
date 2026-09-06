# Project 2 — Vehicle Trip Star Schema

## Fact grain

> One row in `fact_trip` represents one completed vehicle trip.

## Dimensions

- date;
- vehicle;
- customer;
- model.

## Measures

- distance_km;
- energy_kwh;
- duration_minutes.

## Questions

1. Distance by model and month.
2. Efficiency by powertrain.
3. Trips per vehicle.
4. Monthly active vehicles.
5. Average trip duration.

## Critical exercise

Demonstrate why joining raw telemetry directly to trips can double-count trip measures.
