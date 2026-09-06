# Automobile Model Runbook

## Incident: trip totals doubled

### 1. Check fact uniqueness

```sql
SELECT trip_id, COUNT(*)
FROM fact_trip
GROUP BY trip_id
HAVING COUNT(*) > 1;
```

### 2. Inspect joins

Look for raw telemetry or service tables joined directly to trip grain.

### 3. Compare row counts

Capture row counts before and after every join.

### 4. Fix

Aggregate child data to the required grain.

### 5. Reprocess

Rebuild affected date ranges.

### 6. Reconcile

Compare against a trusted source.

## Incident: unknown vehicles increase

Investigate:

- master-data freshness;
- onboarding;
- ID mapping;
- source changes;
- ingestion lag.

## Incident: SCD overlap

Run the overlap query in `quality_checks.sql`, repair intervals, then reprocess impacted facts.
