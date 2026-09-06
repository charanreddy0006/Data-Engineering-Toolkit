# Data Modeling Interview — Intermediate

## Why use surrogate keys?

They support warehouse history and isolate joins from changing source identifiers.

## How do you model many-to-many?

Use an associative or bridge table and define measure allocation when needed.

## How prevent double counting?

Define grain, test uniqueness, and aggregate child datasets before joining.

## Periodic snapshot?

State captured at a regular interval, such as vehicle per day.

## Accumulating snapshot?

One row representing process milestones.

## Conformed dimension?

A dimension with consistent enterprise meaning across facts.

## Late-arriving dimension?

Handle with unknown member, inferred member, delayed facts, or reconciliation.

## Degenerate dimension?

A business identifier stored in the fact without a separate descriptive dimension.
