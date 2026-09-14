# Impact Analysis

## Purpose
Use lineage to reason about changes and incidents.

## Question

If `battery_soc` changes type from integer to decimal, which datasets, models,
dashboards, APIs, and consumers are affected?

## Process

1. Identify changed asset/column.
2. Traverse downstream lineage.
3. Classify consumers by criticality.
4. Notify owners.
5. Validate compatibility.
6. Release or rollback.
7. Update metadata and evidence.
