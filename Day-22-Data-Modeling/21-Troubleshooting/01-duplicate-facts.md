# Troubleshooting Duplicate Facts

## Symptom

A dashboard reports:

```text
distance = 120,000 km
```

while the expected value is:

```text
distance = 40,000 km
```

## Investigation

Check fact uniqueness:

```sql
SELECT trip_id, COUNT(*)
FROM fact_trip
GROUP BY trip_id
HAVING COUNT(*) > 1;
```

Then inspect joins.

A common cause:

```text
trip
  × telemetry
  × service
```

without reducing each child to the target grain.

## Fix

1. Identify target grain.
2. Aggregate children to that grain.
3. Join aggregated datasets.
4. Reconcile with trusted totals.

## Prevention

- grain statement;
- uniqueness tests;
- relationship tests;
- metric reconciliation.
