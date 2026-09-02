# Common Data Modeling Mistakes


## Mistake 1 — Starting With Columns

Bad approach:

```text
"I have these source columns, so I will create one table."
```

Better:

```text
Business process → grain → model
```

## Mistake 2 — No Grain

A fact without a clear grain is difficult to validate.

## Mistake 3 — Mixing Grains

Example:

```text
sale_amount
monthly_revenue
telemetry_distance
```

in one table.

## Mistake 4 — Directly Joining Facts

Sales and service facts can multiply each other.

Aggregate before combining.

## Mistake 5 — Treating VIN as the Only Warehouse Identity

VIN may be useful as a natural/business identifier, but warehouse history
may require surrogate keys.

## Mistake 6 — Overusing SCD Type 2

Not every attribute requires full history.

Type 2 increases rows and complexity.

## Mistake 7 — No Unknown Member

Late-arriving dimensions can cause fact loads to fail or create null foreign
keys.

## Mistake 8 — Too Many Tiny Dimensions

A schema with dozens of unnecessary dimensions becomes difficult to use.

## Mistake 9 — Over-Normalizing the BI Layer

Analysts often need simple access to business attributes.

## Mistake 10 — Over-Denormalizing OLTP

Large duplicated transactional tables can create update anomalies.

## Mistake 11 — Ambiguous Dates

Different definitions can exist:

```text
order_date
delivery_date
invoice_date
service_date
event_time
ingest_time
```

Use explicit names.

## Mistake 12 — Ignoring Time Zones

Connected vehicles can operate across regions.

Store timestamps with clear timezone semantics.

## Mistake 13 — No Source Identifier

Without source IDs, reconciliation becomes difficult.

## Mistake 14 — No Data Contract

A source change can silently break downstream models.

## Mistake 15 — Optimizing Without Measurement

An index or partition is not automatically beneficial.

## Mistake 16 — Ignoring Historical Meaning

A current dimension value may be incorrect for historical reports.

## Mistake 17 — No Documentation

If the grain and metric definitions are not documented, users will interpret
them differently.

## Mistake 18 — Treating the Warehouse as an OLTP Copy

A warehouse should be designed for analytical consumption, not necessarily as
a direct replica of source tables.

## Mistake 19 — Exposing Sensitive Data Everywhere

Only publish attributes required by each consumer.

## Mistake 20 — No Backfill Strategy

Every production model should have a plan for historical rebuilds and
corrections.

## Final Review

Before release, ask:

```text
Could two engineers interpret this model differently?
Could two analysts calculate different revenue?
Could a late event break the model?
Could a source change break consumers?
```

If yes, the model needs more definition.
