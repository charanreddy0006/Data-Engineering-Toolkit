# Apache Parquet — Deep Dive

Parquet is a column-oriented file format for analytical workloads.

## Logical structure

```text
Parquet file
│
├── Row Group 1
│   ├── vehicle_id column chunk
│   ├── event_time column chunk
│   ├── speed column chunk
│   └── battery_soc column chunk
│
├── Row Group 2
│   └── ...
│
└── File metadata/footer
```

## Why columnar?

Consider:

```sql
SELECT vehicle_id, AVG(battery_soc)
FROM telemetry
GROUP BY vehicle_id;
```

A columnar reader can often avoid reading unrelated columns.

## Python

```python
import pyarrow as pa
import pyarrow.parquet as pq

table = pa.table({
    "vehicle_id": ["V100", "V101"],
    "battery_soc": [81.5, 62.4],
})

pq.write_table(
    table,
    "telemetry.parquet",
    compression="zstd",
)
```

## Reading selected columns

```python
table = pq.read_table(
    "telemetry.parquet",
    columns=["vehicle_id", "battery_soc"],
)
```

## What Parquet does not solve automatically

It does not automatically provide:

- primary keys;
- business quality;
- exactly-once ingestion;
- correct partitioning;
- governance;
- table lifecycle.

Those are responsibilities of the surrounding data platform.

## Automobile architecture

```text
JSONL telemetry
      ↓
validation
      ↓
canonical typed dataset
      ↓
Parquet
      ↓
vehicle/day partitions
      ↓
analytics
```
