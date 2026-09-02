# Data Modeling Cheat Sheet


# Quick Reference

## Modeling Levels

```text
Conceptual → Logical → Physical
```

## Core Terms

```text
Entity       = Business object
Attribute    = Property
Relationship = Connection
PK           = Primary key
FK           = Foreign key
Grain        = Meaning of one row
```

## Normalization

```text
1NF → Atomic values
2NF → Full dependency on composite key
3NF → Remove inappropriate transitive dependency
```

## OLTP

```text
Transactions
Frequent writes
Current state
Normalized
```

## OLAP

```text
Analytics
Large reads
Historical
Dimensional / analytical
```

## Dimensional Modeling

```text
Fact      = Event / measurement
Dimension = Context
Measure   = Business number
Grain     = One-row definition
```

## Fact Types

```text
Transaction
Periodic Snapshot
Accumulating Snapshot
Factless Fact
```

## Dimension Patterns

```text
Conformed
Role-playing
Degenerate
Junk
Mini-dimension
```

## SCD

```text
0 = Never change
1 = Overwrite
2 = Historical row
3 = Previous/current values
4 = Separate history
6 = Hybrid
```

## Star

```text
        DIM
         |
DIM — FACT — DIM
         |
        DIM
```

## Snowflake

```text
FACT
 |
DIM
 |
DIM
```

## Data Vault

```text
Hub  = Business key
Link = Relationship
Sat  = Descriptive history
```

## Lakehouse

```text
Bronze = Preserve
Silver = Refine
Gold   = Serve
```

## Fact Design Checklist

```text
[ ] Business process
[ ] Grain
[ ] Dimensions
[ ] Measures
[ ] Keys
[ ] Additivity
[ ] History
[ ] Quality
[ ] Performance
```

## Golden Rule

> Grain first. Always.
