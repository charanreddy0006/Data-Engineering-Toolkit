# 6. Data Validation

Validation prevents bad data from reaching training or inference.

## Structural checks

- required columns
- data types
- schema compatibility

## Value checks

```text
battery_soc ∈ [0,100]
distance_km >= 0
vehicle_id != null
```

## Statistical checks

- row count
- missing rate
- cardinality
- distribution
- unusual spikes

## Example

```python
assert "vehicle_id" in df.columns
assert df["vehicle_id"].notna().all()
assert (df["distance_km"] >= 0).all()
```

## Automobile scenario

If most telemetry records suddenly lose `vehicle_id`, fail the critical pipeline stage instead of training on corrupted data.
