# Automobile Service Data Quality

Service records may contain work orders, technicians, labor, parts, vehicles, and dealers.

Checks:

```text
work_order_id unique
vehicle_id exists
dealer_id exists
opened_at required
closed_at >= opened_at
labor_hours >= 0
parts_cost >= 0
status valid
```

Reconcile work-order headers with line items and parts/labor totals.

A closed order should normally have a completion timestamp and final state. Keep exceptions explicit rather than encoding assumptions silently.
