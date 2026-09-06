# Practical Normalization

Normalize when correctness and transaction consistency are priorities.

Good candidates:

- customer master;
- vehicle master;
- dealer master;
- inventory;
- service orders;
- warranty transactions.

## When denormalization may be better

Consider it when:

- reads dominate;
- analytics are repetitive;
- joins are expensive;
- a serving layer needs simple access;
- the duplicated value is stable and governed.

## Common architecture

```text
Normalized OLTP
      ↓
CDC / batch ingestion
      ↓
Raw / staging
      ↓
Analytical dimensional model
```

This is not contradictory.

The same business domain can legitimately have multiple models optimized for different workloads.

## Review question

Do not ask:

> Is this normalized enough?

Ask:

> Does this model preserve the required business invariants for this workload?
