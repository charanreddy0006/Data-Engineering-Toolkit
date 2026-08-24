# ETL with SQL

## 1. Introduction

SQL is the primary transformation language in many analytical platforms.

This is a core part of Day 09 — ETL and ELT. The purpose of this document is
to understand the concept from first principles and then connect it to a
practical data-engineering workflow.

## 2. Why It Exists

SQL is strong for filtering, joining, aggregating and modeling relational data.

Data engineering is not only about moving records. A production pipeline must
also handle changing schemas, invalid records, duplicates, failures, retries,
large volumes, security and operational monitoring.

## 3. Core Components

### SELECT

SELECT is an important part of this concept. Understand its responsibility,
inputs, outputs and failure conditions before implementing it in a production
pipeline.

### JOIN

JOIN is an important part of this concept. Understand its responsibility,
inputs, outputs and failure conditions before implementing it in a production
pipeline.

### CASE

CASE is an important part of this concept. Understand its responsibility,
inputs, outputs and failure conditions before implementing it in a production
pipeline.

### GROUP BY

GROUP BY is an important part of this concept. Understand its responsibility,
inputs, outputs and failure conditions before implementing it in a production
pipeline.

### CTE

CTE is an important part of this concept. Understand its responsibility,
inputs, outputs and failure conditions before implementing it in a production
pipeline.

### MERGE

MERGE is an important part of this concept. Understand its responsibility,
inputs, outputs and failure conditions before implementing it in a production
pipeline.

## 4. Architecture

```text
Raw Tables -> SQL Transformations -> Curated Tables
```

The flow should be treated as a sequence of controlled stages. Each stage
should have a clear input and output contract.

## 5. Detailed Engineering View

### Source

A source is the system that owns the original information. It may be a
database, API, CSV file, event stream or application.

### Processing

Processing applies technical and business rules to source information.
Processing can happen in Python, SQL, Spark or another execution engine.

### Destination

The destination is normally a data lake, warehouse, lakehouse, database or
other analytical system.

### Quality

Quality checks prevent obviously incorrect data from becoming trusted data.

### Operations

Production pipelines require logs, metrics, alerts, retries and clear
ownership.

## 6. Automobile Industry Example

Automobile example: calculate service cost and service frequency per vehicle.

A connected-car platform may receive millions of events. The same engineering
principles apply to service history, warranty claims, dealer records and
manufacturing data.

## 7. Example Workflow

```text
1. Identify source
2. Read or receive records
3. Validate schema
4. Validate business rules
5. Clean values
6. Remove duplicates
7. Transform records
8. Write trusted output
9. Record metrics
10. Publish status
```

## 8. Python Example

```python
def validate_vehicle(record):
    vehicle_id = record.get("vehicle_id")
    battery = record.get("battery_pct")

    if not vehicle_id:
        return False

    if battery is None:
        return False

    if not 0 <= battery <= 100:
        return False

    return True


records = [
    {"vehicle_id": "V001", "battery_pct": 82},
    {"vehicle_id": "V002", "battery_pct": 95},
    {"vehicle_id": "V003", "battery_pct": 105},
]

valid_records = [
    record for record in records
    if validate_vehicle(record)
]

print(valid_records)
```

## 9. SQL Example

```sql
SELECT
    vehicle_id,
    COUNT(*) AS event_count,
    AVG(battery_pct) AS average_battery
FROM vehicle_events
WHERE battery_pct BETWEEN 0 AND 100
GROUP BY vehicle_id;
```

## 10. Production Considerations

### Idempotency

The same input should be safe to process again.

### Incremental Processing

Large datasets should not be scanned unnecessarily.

### Failure Handling

Temporary failures should be retried; permanent bad records should be
quarantined or rejected with useful diagnostics.

### Security

Credentials should be stored in a secret manager or environment configuration.

### Observability

Record row counts, duration, errors, freshness and data-quality results.

### Documentation

Every important transformation should have an understandable business
definition.

## 11. Common Failure Scenario

Suppose a pipeline successfully extracts 1,000,000 records but fails while
writing the destination.

A weak implementation starts from the beginning and may create duplicates.

A stronger implementation uses staging, checkpoints and idempotent writes so
the failed stage can be safely retried.

## 12. Testing

Test at least:

- normal records
- empty input
- missing fields
- invalid types
- boundary values
- duplicates
- reruns
- partial failures
- schema changes

Example:

```python
assert validate_vehicle(
    {"vehicle_id": "V100", "battery_pct": 50}
)

assert not validate_vehicle(
    {"vehicle_id": "V101", "battery_pct": 150}
)

assert not validate_vehicle(
    {"vehicle_id": "", "battery_pct": 50}
)
```

## 13. Practice

Use explicit column lists, readable CTEs and tested business logic instead of deeply nested unreadable queries.

## 14. Interview Focus

Be able to explain:

1. What the concept means.
2. Why it is needed.
3. Where it belongs in a pipeline.
4. What can go wrong.
5. How it scales.
6. How it affects cost.
7. How it affects reliability.
8. How you would implement it using Python and SQL.

## 15. Key Takeaways

- Design data movement as a repeatable software process.
- Separate raw, validated and curated data where appropriate.
- Make failures visible.
- Make retries safe.
- Measure pipeline behavior.
- Protect source and destination systems.
- Prefer clear designs over unnecessary complexity.
- Use realistic automobile data to practice the concepts.

## 16. Next Step

Use the runnable files in `examples/` and then implement the Day 09 mini
project. After the local version works, consider PostgreSQL, Spark, Airflow,
dbt, Kafka and cloud storage as progressive extensions.
