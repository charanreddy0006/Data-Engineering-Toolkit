# Denormalization

Denormalization intentionally introduces redundancy or precomputed values.

## Why?

- fewer joins;
- simpler BI queries;
- lower repeated computation;
- predictable serving latency.

Example:

```text
dim_vehicle
dim_model
fact_trip
```

may be transformed into a curated daily table containing selected model attributes.

## Risks

- stale copies;
- larger storage;
- refresh complexity;
- inconsistent definitions.

## Safe pattern

Document:

```text
Source of truth: dim_vehicle
Derived copy: mart_vehicle_daily
Refresh: daily
Validation: reconciliation
```

## Rule

Denormalize because you understand the workload and have measured or justified the benefit, not
because joins look inconvenient.
