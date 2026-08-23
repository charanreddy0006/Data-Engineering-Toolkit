# 08 — Data Lake File Formats

## CSV

Easy to inspect but inefficient for large analytical workloads.

## JSON

Flexible and useful for APIs and event data, but can be expensive to process.

## Parquet

Columnar format optimized for analytical workloads.

```text
Query needs:
vehicle_id
battery_level

Parquet can read only relevant columns.
```

## Avro

A row-oriented format frequently used for event and serialization workflows.

## ORC

A columnar format designed for efficient analytical processing.

## Comparison

| Format | Type | Common Use |
|---|---|---|
| CSV | Row/text | Simple exchange |
| JSON | Document/text | APIs/events |
| Parquet | Columnar | Analytics |
| Avro | Row/binary | Serialization |
| ORC | Columnar | Analytics |

## Recommendation

Use raw formats when preserving source data is important, then convert to
Parquet or another optimized format for analytical processing.
