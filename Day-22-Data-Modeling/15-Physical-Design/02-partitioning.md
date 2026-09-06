# Partitioning

Partitioning divides large data into storage sections.

Telemetry is naturally time-oriented.

Possible partition:

```text
event_date
```

```text
2026-09-01
2026-09-02
2026-09-03
```

## Benefits

A query for one date can avoid unrelated partitions when pruning works.

## Risks

Too many tiny partitions create metadata and management overhead.

High-cardinality partitioning such as one partition per vehicle can also create fragmentation.

## Practical idea

For large telemetry:

```text
partition by event_date
cluster/order by vehicle_id
```

when the platform supports it.

## Questions

- How much data arrives per day?
- What are common filters?
- How long is retention?
- How are late records handled?
- Does the engine actually prune partitions?

Partition only for a demonstrated workload.
