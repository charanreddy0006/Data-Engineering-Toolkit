# Data Modeling Comparisons


## 3NF vs Star Schema

| 3NF | Star |
|---|---|
| Operational consistency | Analytical simplicity |
| More normalized | More denormalized |
| Many relationships | Central facts |
| OLTP-oriented | OLAP-oriented |

## Star vs Snowflake

```text
Star:
FACT → DIM

Snowflake:
FACT → DIM → DIM
```

Choose star when simplicity and BI usability dominate. Consider snowflake when
dimension normalization provides a clear benefit.

## Natural Key vs Surrogate Key

Natural:

```text
VIN
```

Surrogate:

```text
vehicle_key
```

A warehouse often uses both:

```text
vehicle_key = warehouse identity
vehicle_id / VIN = source/business identity
```

## Type 1 vs Type 2 SCD

| Type 1 | Type 2 |
|---|---|
| Overwrite | New row |
| No history | Full tracked history |
| Simpler | More complex |
| Fewer rows | More rows |

## Transaction Fact vs Snapshot

Transaction:

```text
One row per event
```

Snapshot:

```text
One row per entity per period
```

## Data Vault vs Dimensional

Data Vault:

```text
Integration + history
```

Dimensional:

```text
Consumption + analytics
```

They can coexist.

## Wide Table vs Star

Wide:

```text
Many attributes in one table
```

Star:

```text
Fact + dimensions
```

Wide tables can be convenient for a specific consumer; star schemas provide
more reusable dimensional structure.

## Batch vs Streaming Modeling

Batch can often rely on:

```text
daily/hourly partitions
scheduled transformations
```

Streaming must additionally consider:

```text
event time
late events
deduplication
state
replay
schema evolution
```

## Normalization vs Denormalization

Normalization optimizes for consistency and reduced redundancy.

Denormalization intentionally accepts redundancy for read-oriented access.

## Kimball vs Inmon — High Level

Kimball emphasizes dimensional marts and business-process-oriented models.

Inmon traditionally emphasizes an integrated enterprise warehouse before
downstream dimensional marts.

Modern platforms often combine ideas from both rather than following one
approach rigidly.

## Decision Framework

Ask:

```text
What is the workload?
Who consumes the data?
How much history is needed?
How frequently does it change?
How large is it?
What are the query patterns?
What governance is required?
```
