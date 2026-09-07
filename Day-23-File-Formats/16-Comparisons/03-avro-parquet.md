# Avro vs Parquet

## Avro

Primary mental model:

```text
schema + record -> serialized message
```

Useful for:

- event serialization;
- schema-driven transport;
- compatibility.

## Parquet

Primary mental model:

```text
large typed dataset -> columnar analytical file
```

Useful for:

- data lakes;
- analytical scans;
- column pruning;
- compression.

## Combined architecture

```text
producer
   ↓
Avro event
   ↓
stream processing
   ↓
Parquet analytical dataset
```

They are complementary rather than direct replacements.
