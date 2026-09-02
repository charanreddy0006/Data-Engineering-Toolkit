# Data Modeling Interview Questions


## Beginner

### 1. What is data modeling?

Designing data structures, relationships, rules and representations to support
business and technical requirements.

### 2. What is a primary key?

A unique identifier for a row.

### 3. What is a foreign key?

A column or set of columns referencing another table's key.

### 4. What is normalization?

Structuring relational data to reduce redundancy and anomalies.

### 5. What is denormalization?

Intentional redundancy or combination for specific read workloads.

## Intermediate

### 6. OLTP vs OLAP?

OLTP supports transactions; OLAP supports analytical workloads.

### 7. What is a fact?

A measurable business event, transaction, or snapshot.

### 8. What is a dimension?

Descriptive context used to analyze facts.

### 9. What is grain?

The exact meaning of one row in a fact table.

### 10. Star vs snowflake?

Star uses relatively denormalized dimensions. Snowflake normalizes parts of
dimensions.

### 11. What is SCD Type 2?

A technique that preserves historical dimension versions by creating new rows.

### 12. What is a surrogate key?

An artificial identifier used independently of business meaning.

## Advanced

### 13. How do you choose grain?

Start with the business process and write one precise sentence describing one
fact row.

### 14. How do you prevent double-counting?

Validate grain and join cardinality. Aggregate facts to a common grain before
combining them.

### 15. How would you model telemetry?

Use an event-grain fact with event ID, vehicle identity, event time, ingestion
time and measured values. Create separate aggregates for daily analytics.

### 16. How do you handle vehicle ownership changes?

Use an explicit historical strategy, such as SCD Type 2, if historical
ownership context is required.

### 17. What is a conformed dimension?

A shared dimension with consistent definitions across multiple facts.

### 18. What is a degenerate dimension?

A transaction identifier stored directly in a fact without a separate
dimension.

### 19. What is a bridge table?

A structure used to represent many-to-many relationships in analytical models.

### 20. Why separate OLTP and OLAP?

They have different workload and optimization requirements.

## Scenario Questions

### Scenario A

> Revenue doubled after adding a dimension join.

Investigate:

```text
Join cardinality
Duplicate dimension keys
SCD current-row logic
Many-to-many relationships
Fact grain
```

### Scenario B

> A customer changes region and old reports change unexpectedly.

Likely issue:

```text
Type 1 overwrite
```

If history is required, consider Type 2.

### Scenario C

> Telemetry arrives twice.

Use:

```text
event_id
deduplication
idempotent processing
```

### Scenario D

> A source adds a column.

Determine whether the change is:

```text
Backward-compatible
Potentially breaking
```

Update contracts and downstream models accordingly.

## Interview Framework

When given a modeling problem, answer in this order:

```text
1. Requirements
2. Business process
3. Grain
4. Dimensions
5. Facts
6. Keys
7. History
8. Quality
9. Performance
10. Trade-offs
```
