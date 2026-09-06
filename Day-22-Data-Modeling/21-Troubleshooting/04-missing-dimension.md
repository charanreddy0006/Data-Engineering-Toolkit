# Troubleshooting Unknown Dimension Members

## Symptom

The number of facts assigned to `vehicle_key = -1` increases.

## Investigate

- vehicle master freshness;
- onboarding process;
- identifier mapping;
- schema changes;
- ingestion lag;
- source data quality.

## Useful metric

```text
unknown_vehicle_rate
=
facts_with_unknown_vehicle
/
total_facts
```

Trend this metric over time.

## Recovery

When the dimension arrives:

1. reconcile business key;
2. enrich inferred/unknown record;
3. update affected facts if required;
4. verify historical metrics.
