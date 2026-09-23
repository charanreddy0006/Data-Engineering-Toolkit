# 19. Partitioning

Partitioning divides large data into manageable logical sections.

## Common keys

- date
- month
- region
- tenant

## Example

```text
service_orders/
  service_date=2026-09-21/
  service_date=2026-09-22/
  service_date=2026-09-23/
```

## Benefits

- partition pruning
- smaller scans
- easier backfills
- parallel processing

## Risks

Bad partition choices can create tiny files or unbalanced partitions.

For large automobile telemetry data, date partitions are usually more useful than vehicle-ID partitions.
