# SCD Type 1

Type 1 overwrites the old value.

Before:

```text
V100 | White
```

After:

```text
V100 | Blue
```

## SQL

```sql
UPDATE dim_vehicle
SET color = 'Blue',
    updated_at = CURRENT_TIMESTAMP
WHERE vehicle_id = 'V100';
```

## Use cases

- correcting bad data;
- current-state reporting;
- attributes where history is irrelevant.

## Risk

Historical reports will see the new value even for old events.

That is acceptable only if current-state semantics are intended.

## Automobile example

A corrected spelling of a model name can be Type 1.

A dealer relationship often needs Type 2.
