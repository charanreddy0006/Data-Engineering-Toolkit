# Relationships That Change Over Time

Relationships can themselves be historical facts.

A simple field:

```text
vehicle.customer_id
```

usually represents current state.

It cannot answer:

> Who owned this vehicle during March?

Use a history table:

```text
vehicle_ownership
-----------------
vehicle_id
customer_id
valid_from
valid_to
ownership_type
```

## Temporal lookup

```sql
SELECT *
FROM vehicle_ownership
WHERE vehicle_id = 'V100'
  AND TIMESTAMP '2026-03-15'
      >= valid_from
  AND TIMESTAMP '2026-03-15'
      < valid_to;
```

The half-open interval `[valid_from, valid_to)` avoids boundary ambiguity.

## Automobile example

A warranty claim from April should use the ownership/dealer relationship that was valid in April,
not necessarily today's relationship.

## Design insight

A foreign key describes a relationship.

A relationship table is needed when the relationship itself has:

- attributes;
- history;
- multiple participants;
- lifecycle.
