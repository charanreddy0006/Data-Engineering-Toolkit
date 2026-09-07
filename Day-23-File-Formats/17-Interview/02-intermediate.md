# File Formats Interview — Intermediate

## Why can Parquet outperform CSV?

It is typed, columnar, compressed, and can carry metadata/statistics that enable optimizations.
The actual result depends on engine, layout, and workload.

## What is column pruning?

Reading only columns required by a query.

## What is predicate pushdown?

Applying filters closer to storage so unnecessary data may be skipped or filtered earlier.

## Why not partition by VIN?

VIN is high-cardinality and can produce too many partitions and tiny files.

## Why keep raw JSON after conversion?

Replay, audit, debugging, provenance, and recovery.

## Why explicit Spark schemas?

Inference can be unstable or expensive and can react differently as data changes.

## What is schema evolution?

Changing schema while preserving defined compatibility and business semantics.
