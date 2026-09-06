# Data Modeling Scenario Questions

## Scenario 1 — Trip totals doubled

Telemetry has many rows per trip.

Answer:

The query crossed grains. Aggregate telemetry to trip grain before combining with trip measures.

## Scenario 2 — Vehicle changes owner

Historical warranty reports must show the owner at claim time.

Answer:

Use a history-aware ownership model, commonly SCD Type 2, and perform a temporal lookup.

## Scenario 3 — New telemetry field

A producer adds an optional sensor.

Answer:

Evaluate compatibility, preserve raw data, update canonical schema if appropriate, add tests, and
communicate downstream impact.

## Scenario 4 — Billions of telemetry rows

A dashboard needs daily fleet metrics.

Answer:

Create a vehicle-day aggregate/snapshot and optimize physical storage for actual access patterns.

## Scenario 5 — Two technicians

Use a bridge and define allocation if service cost must be attributed.
