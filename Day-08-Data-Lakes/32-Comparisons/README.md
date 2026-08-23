# 32 — Comparisons

## Lake vs Warehouse

```text
Lake      -> flexible, diverse, raw data
Warehouse -> structured, governed analytics
```

## Lake vs Database

```text
Database -> transactional workloads
Lake     -> large-scale analytical storage
```

## Lake vs Lakehouse

```text
Lake      -> files/object storage
Lakehouse -> lake storage + table semantics
```

## Kafka vs Lake

Kafka is primarily an event streaming platform.

A lake is primarily a persistent analytical storage platform.

They often work together:

```text
Kafka
 |
 v
Processing
 |
 v
Data Lake
```

## Spark vs Lake

Spark is a compute engine.

A lake is storage architecture.

They are complementary rather than direct replacements.
