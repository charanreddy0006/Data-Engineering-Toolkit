# Constraints

Constraints convert assumptions into enforceable rules.

## NOT NULL

```sql
vin VARCHAR(17) NOT NULL
```

Use when absence is invalid.

## UNIQUE

```sql
UNIQUE (vin)
```

Protects business uniqueness.

## CHECK

```sql
CHECK (battery_soc BETWEEN 0 AND 100)
CHECK (distance_km >= 0)
```

## FOREIGN KEY

```sql
FOREIGN KEY (vehicle_id)
REFERENCES vehicle(vehicle_id)
```

## Why database constraints matter

Application validation can be bypassed by:

- another application;
- bulk imports;
- scripts;
- race conditions.

Constraints provide a strong integrity boundary.

## Analytical platforms

Some warehouses do not physically enforce all relational constraints. In that case, implement
equivalent quality tests.

## Rule

Use constraints for true invariants, not temporary business assumptions.
