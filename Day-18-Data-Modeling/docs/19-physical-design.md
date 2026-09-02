# Physical Data Modeling and Performance


## Logical vs Physical

Logical modeling asks:

```text
What data exists?
How is it related?
```

Physical modeling asks:

```text
How will it be stored and queried?
```

## Data Types

Choose appropriate types.

Examples:

```text
ID             → BIGINT / appropriate integer
Date           → DATE
Timestamp      → TIMESTAMP with timezone where supported
Amount         → DECIMAL / NUMERIC
Flag           → BOOLEAN
```

Avoid using strings for everything.

## Indexes

In OLTP systems, indexes can accelerate selective lookups.

```sql
CREATE INDEX idx_vehicle_customer
ON vehicle(customer_id);
```

But indexes have costs:

- storage
- write overhead
- maintenance
- memory usage

## Composite Index

If queries commonly filter by:

```text
vehicle_id
event_time
```

a composite index may be appropriate:

```sql
CREATE INDEX idx_vehicle_event_time
ON telemetry(vehicle_id, event_time);
```

Index design must follow real query patterns.

## Partitioning

Large fact tables can be partitioned by time.

Conceptually:

```text
FACT_TELEMETRY
├── 2026-08-31
├── 2026-09-01
└── 2026-09-02
```

Time is often useful because analytics commonly filters by date.

## Partition Pitfall

Too many tiny partitions can hurt performance and operational simplicity.

Partition only when it provides a meaningful benefit.

## Clustering

Some analytical platforms support clustering or data organization based on
frequently filtered columns.

Potential automobile example:

```text
event_date
vehicle_id
region
```

The correct choice depends on the engine.

## Columnar Storage

Analytical systems often benefit from column-oriented storage because queries
frequently read a subset of columns over many rows.

## Compression

Repeated values such as:

```text
manufacturer
fuel_type
region
```

can often compress efficiently in analytical storage.

## Query Pruning

A good physical design lets the engine avoid reading irrelevant data.

Example:

```sql
WHERE event_date >= DATE '2026-09-01'
  AND event_date < DATE '2026-09-02'
```

can be useful when data is organized by date.

## Performance Workflow

```text
Measure
  ↓
Inspect Query Plan
  ↓
Identify Bottleneck
  ↓
Change One Thing
  ↓
Measure Again
```

Do not optimize by guessing.

## Physical Design Checklist

```text
[ ] Correct data types
[ ] Appropriate indexes
[ ] Partition strategy
[ ] Clustering strategy
[ ] Statistics
[ ] Compression
[ ] Retention
[ ] Query patterns
[ ] Growth forecast
```
