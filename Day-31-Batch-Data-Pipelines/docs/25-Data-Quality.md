# 25. Batch Data Quality

## Main checks

### Completeness
Expected records arrived.

### Validity
Values satisfy business rules.

### Uniqueness
No unexpected duplicate keys.

### Referential Integrity
Foreign keys resolve.

### Freshness
Data arrived before the deadline.

## Automobile rules

```text
service_order_id != null
amount >= 0
vehicle_id != null
distance_km >= 0
```

## Principle

A technically successful pipeline can still produce incorrect business data. Quality checks belong inside the workflow.
