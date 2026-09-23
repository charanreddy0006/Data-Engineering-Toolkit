# 33. Comparisons

## Full vs Incremental

| Full | Incremental |
|---|---|
| Simple | More complex |
| Reads all data | Reads changes |
| Higher cost at scale | Lower movement |
| Easy rebuild | Needs change logic |

## Batch vs Streaming

| Batch | Streaming |
|---|---|
| Scheduled/windowed | Continuous |
| Higher latency | Lower latency |
| Simpler for many workloads | More operational complexity |

## Snapshot vs Incremental

A snapshot stores state at a point in time. Incremental processing captures changes between boundaries.

## ETL vs ELT

ETL transforms before loading. ELT loads first and transforms in the analytical environment.
