# 28. Spark Structured Streaming

Spark Structured Streaming provides a structured API for continuous or incremental processing.

## Concept
```text
Streaming Source
 ↓
DataFrame-style transformations
 ↓
Sink
```

Example:
```python
events = (
    spark.readStream
    .format("kafka")
    .option("subscribe", "vehicle.faults")
    .load()
)
```

Production design must define checkpoint location, trigger, output mode and sink semantics.

## Automobile
Read fault events, parse them and calculate windowed fleet metrics.
