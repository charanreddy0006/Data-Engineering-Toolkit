# Integrity

Integrity means data relationships and constraints remain logically valid.

## Referential integrity

```sql
SELECT COUNT(*)
FROM telemetry t
LEFT JOIN vehicle_master v
  ON v.vehicle_id = t.vehicle_id
WHERE v.vehicle_id IS NULL;
```

## Entity integrity

Identifiers should be:

- present
- unique
- stable

## Temporal integrity

```sql
SELECT COUNT(*)
FROM service_order
WHERE service_end_time < service_start_time;
```

## Domain integrity

Values satisfy domain constraints.

Integrity is especially important when telemetry is combined with vehicle master, service, dealer, parts, warranty, and customer data.
