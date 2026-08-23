# 27 — Data Lake Performance

## 1. Use Columnar Formats

Parquet allows engines to read only required columns.

## 2. Partition Carefully

Partition according to common filters.

Good:

```text
year/month/day
```

Potentially bad:

```text
one partition for every vehicle
```

when millions of vehicles create too many partitions.

## 3. Compact Small Files

Too many small files increase metadata and scheduling overhead.

## 4. Compress Data

Compression reduces storage and I/O.

## 5. Predicate Pushdown

Push filters toward the storage layer when supported.

## 6. Column Pruning

Read only the columns required by the query.

## 7. Incremental Processing

Avoid scanning the entire history when only new data changed.

## 8. Avoid Unnecessary Shuffles

Distributed joins and aggregations can become expensive.

## Rule

Measure before optimizing. Optimize based on actual workload characteristics.
