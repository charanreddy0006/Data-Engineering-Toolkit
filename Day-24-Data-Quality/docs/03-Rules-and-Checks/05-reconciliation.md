# Reconciliation

Reconciliation compares source and target representations.

## Count

```text
source = 1,000,000
target =   999,800
difference = 200
```

## Aggregate

Compare totals such as:

```text
SUM(sales_amount)
event counts
energy_kwh
distance_km
```

Use explicit tolerances where transformations introduce expected differences.

## Partition-level reconciliation

Compare by:

- date
- hour
- region
- source
- vehicle type

This localizes failures better than comparing all history.

Common causes include filtering, duplicates, late data, timezone conversion, failed partitions, join multiplication, and rounding.
