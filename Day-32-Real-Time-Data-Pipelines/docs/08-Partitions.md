# 8. Partitions

Partitions divide a topic so work can be processed in parallel.

```text
Topic
 ├── P0
 ├── P1
 └── P2
```

Ordering is maintained within a partition, not as a single global order across all partitions.

## Key
Using `vehicle_id` as a key can keep a vehicle's events together when key-based partitioning is used.

## Trade-offs
More partitions can increase parallelism, but also increase operational overhead.

Watch for hot keys that overload one partition.
