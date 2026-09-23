# 23. Query Optimization

## Techniques

- filter early
- select only required columns
- use partitions
- avoid unnecessary joins
- aggregate at the correct grain
- inspect execution plans
- avoid repeated scans

## Example

Instead of:

```sql
SELECT *
FROM service_orders;
```

Prefer:

```sql
SELECT service_order_id, vehicle_id, service_date, amount
FROM service_orders
WHERE service_date >= :start_date;
```

## Automobile

A daily service job should scan only the required date range rather than years of historical records.
