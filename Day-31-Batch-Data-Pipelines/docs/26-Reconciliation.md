# 26. Reconciliation

Reconciliation compares source results with target results.

## Count

```text
Source rows = Target rows
```

## Amount

```text
Source service revenue = Target service revenue
```

## Keys

Compare distinct:
- service_order_id
- vehicle_id
- dealer_id

## Tolerance

Not every source-target difference is an error; define business-specific tolerances.

## Automobile

Reconcile daily service revenue before publishing the executive service dashboard.
