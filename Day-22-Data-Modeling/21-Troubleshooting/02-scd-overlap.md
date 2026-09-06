# Troubleshooting SCD Overlap

## Symptom

One fact event matches two dimension versions.

## Example

```text
Version A: Jan 1 -> Apr 1
Version B: Mar 15 -> Jun 1
```

An event in March matches both.

## Detection

```sql
SELECT a.vehicle_id, a.vehicle_key, b.vehicle_key
FROM dim_vehicle a
JOIN dim_vehicle b
  ON a.vehicle_id = b.vehicle_id
 AND a.vehicle_key <> b.vehicle_key
 AND a.valid_from < b.valid_to
 AND b.valid_from < a.valid_to;
```

## Recovery

1. identify affected business keys;
2. reconstruct correct history;
3. correct intervals;
4. reprocess impacted facts;
5. reconcile metrics;
6. document the incident.
