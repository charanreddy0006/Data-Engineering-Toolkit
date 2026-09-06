# Project 3 — SCD Type 2 Vehicle Dimension

## Requirement

Preserve history for:

- dealer;
- exterior color;
- customer segment.

## Invariants

```text
one current row per vehicle
valid_from < valid_to
no overlapping intervals
```

## Scenarios

- new vehicle;
- unchanged source;
- changed color;
- changed dealer;
- late update;
- duplicate source row.

Implement the model and validation queries.
