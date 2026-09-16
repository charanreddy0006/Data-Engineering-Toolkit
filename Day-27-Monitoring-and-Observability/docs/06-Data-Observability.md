# Data Observability

Infrastructure observability asks whether systems work.
Data observability also asks whether the **data itself behaves as expected**.

## Freshness

```text
freshness = current_time - newest_expected_data_time
```

## Volume

Monitor rows, events, bytes, partitions, and files against expected behavior.

## Schema

Detect:
- added fields
- removed fields
- type changes
- nullability changes
- renamed fields

## Distribution

Watch:
- null percentage
- ranges
- categorical proportions
- statistical shifts

## Quality

Monitor:
- validity
- completeness
- uniqueness
- consistency
- referential integrity

## Lineage

```text
Source → Transform → Curated Dataset → Data Product → Dashboard
```

Lineage lets engineers determine which downstream consumers may be affected by an
upstream problem.
