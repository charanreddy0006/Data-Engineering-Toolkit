# Predicate Pushdown

Predicate pushdown means applying a filter as close to the data source as possible.

Query:

```sql
SELECT vehicle_id, battery_soc
FROM telemetry
WHERE event_date = DATE '2026-09-06'
  AND battery_soc < 20;
```

Potential optimization layers:

```text
partition pruning
      ↓
file/row-group skipping
      ↓
column pruning
      ↓
predicate evaluation
```

## Why it matters

Reading 50 TB and returning 10 MB is wasteful if the storage/query engine can eliminate most
of the data before decoding it.

## Requirements

Benefits depend on:

- partition layout;
- file statistics;
- data distribution;
- filter expression;
- engine;
- format.

## Automobile example

If telemetry is partitioned by event date, a one-day dashboard query can avoid unrelated dates.

If battery SOC statistics exist for row groups, additional filtering may avoid some row groups.

## Key distinction

Predicate pushdown is an engine/reader optimization enabled by the storage representation and
metadata. It is not simply a SQL keyword.
