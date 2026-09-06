# Rebuildability and Recovery

Ask:

> If the target model disappears, can it be rebuilt from trusted upstream data?

## Rebuild chain

```text
Raw
 ↓
Canonical
 ↓
Business transformations
 ↓
Published model
```

## Requirements

- retained source data;
- version-controlled transformation code;
- schema versioning;
- deterministic transformations;
- backfill procedure.

## Automobile incident

If daily fleet metrics are corrupted, rebuild them from canonical telemetry instead of manually
editing thousands of rows.

## Runbook should contain

```text
symptom
validation query
root-cause checks
rebuild range
verification
rollback
```
