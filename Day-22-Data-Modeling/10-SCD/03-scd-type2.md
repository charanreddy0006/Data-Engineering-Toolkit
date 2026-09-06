# SCD Type 2

Type 2 creates a new row for each historical version.

Typical columns:

```text
vehicle_key
vehicle_id
color
valid_from
valid_to
is_current
```

Example:

```text
101 | V100 | White | 2026-01-01 | 2026-03-10 | false
205 | V100 | Blue  | 2026-03-10 | 9999-12-31 | true
```

## Temporal join

```sql
SELECT f.trip_id, d.vehicle_key
FROM fact_trip_source f
JOIN dim_vehicle d
  ON d.vehicle_id = f.vehicle_id
 AND f.trip_date >= d.valid_from
 AND f.trip_date < d.valid_to;
```

## Invariants

- one current row per business key;
- valid_from < valid_to;
- intervals do not overlap;
- each version has a unique surrogate key.

## Change detection

A tracked-attribute hash can help:

```text
hash(color, dealer_id, segment)
```

If the hash changes, create a new version.

## Common mistake

Updating the current row destroys history.

## Tests

Check:

```text
one current version
no overlaps
valid intervals
no duplicate version keys
```
