# 21. File Formats

## CSV
Simple and portable, but larger and slower for analytical scans.

## JSON
Good for flexible and nested API data.

## Parquet
Columnar and efficient for analytical batch workloads.

## Avro
Schema-oriented row format used in many data platforms.

## Example

```text
Raw API → JSON
       ↓
Curated Lake → Parquet
       ↓
Warehouse → Tables
```

## Automobile

Store raw charging-session exports as JSON and convert them into Parquet for analytical processing.
