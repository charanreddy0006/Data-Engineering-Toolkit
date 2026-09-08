# Accuracy

Accuracy describes whether data represents the real-world value correctly.

It usually requires a trusted reference or reconciliation.

## Example

A vehicle master says model year 2025 while another system says 2024. A format test cannot determine which is correct.

## Reference comparison

```sql
SELECT COUNT(*) AS mismatches
FROM telemetry t
JOIN vehicle_master v ON v.vehicle_id = t.vehicle_id
WHERE t.model_year <> v.model_year;
```

## Accuracy vs validity

`speed_kmh = 120` can be valid because it is within a permitted range but inaccurate if the real vehicle speed was 80.

## Accuracy techniques

- authoritative reference data
- source reconciliation
- transformation verification
- physical measurements
- business-owner review
- lineage tracing

Preserve raw data so accuracy problems can be investigated instead of reconstructed from transformed output.
