# Consistency

Consistency means related representations do not contradict each other.

Examples:

```text
vehicle_master.powertrain = EV
telemetry.powertrain      = ICE
```

or:

```text
service_status = CLOSED
service_end_time = NULL
```

## Cross-table consistency

```sql
SELECT COUNT(*)
FROM service_order
WHERE service_status = 'CLOSED'
  AND service_end_time IS NULL;
```

## Types

- syntactic consistency
- semantic consistency
- referential consistency
- temporal consistency

## Best practices

Use controlled domains, canonical definitions, reference tables, and constraints where practical.

A data lake may not physically enforce every relationship, so pipeline-level tests become important.
