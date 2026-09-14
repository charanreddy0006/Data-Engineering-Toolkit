# Lakehouse Governance

## Purpose
Apply governance to large analytical storage platforms.

## Layers

```text
Bronze / Raw
   -> Silver / Validated
   -> Gold / Business Data Products
```

Governance metadata should identify owners, classifications, retention, quality,
lineage, and approved use across layers.

## Key Controls

- table/column permissions
- catalog integration
- schema evolution rules
- retention
- lineage
- quality checks
- environment separation
- audit logging
