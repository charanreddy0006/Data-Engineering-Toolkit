# Spark Quality at Scale

For large datasets, avoid pulling records to the driver.

## Prefer

```python
df.select("event_id", "vehicle_id", "speed_kmh")
```

and filter early:

```python
df.filter(F.col("event_date") == "2026-09-08")
```

Aggregate quality metrics in the cluster.

## Avoid

```python
df.collect()
```

for huge datasets.

## Partition-aware quality

If data is partitioned by date/hour, validate the incoming partition rather than repeatedly scanning all history.

## Performance considerations

- read only required columns
- push filters early
- avoid unnecessary shuffles
- combine metrics where practical
- use approximate statistics when acceptable
- validate schema before expensive transformations
- store quality metrics separately
