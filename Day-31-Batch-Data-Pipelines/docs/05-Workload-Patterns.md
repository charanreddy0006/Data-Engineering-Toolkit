# 5. Batch Workload Patterns

## Snapshot
Store a point-in-time state.

Useful for:
- inventory
- vehicle status
- customer state

## Increment
Process new or changed records.

## Rolling Window
Recalculate recent history, such as the previous 30 days.

## Periodic Aggregation
Build weekly or monthly summaries from lower-grain data.

## Rebuild
Recreate the complete target when history is small or correctness requires a full rebuild.

## Automobile examples

```text
Vehicle inventory → Snapshot
Service orders → Incremental
Vehicle health → Rolling window
Monthly sales → Aggregation
```
