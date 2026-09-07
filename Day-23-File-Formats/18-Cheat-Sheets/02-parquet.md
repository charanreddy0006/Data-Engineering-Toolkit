# Parquet Cheat Sheet

```text
columnar
typed
compressed
row groups
column chunks
metadata
statistics
column pruning
predicate pushdown opportunities
```

Python:

```python
df.to_parquet(
    "data.parquet",
    compression="zstd",
    index=False,
)

df = pd.read_parquet(
    "data.parquet",
    columns=["vehicle_id", "battery_soc"],
)
```

Inspect:

```python
pq.read_metadata("data.parquet")
```

Remember:

```text
format != table
format != governance
format != quality
format != partitioning
```
