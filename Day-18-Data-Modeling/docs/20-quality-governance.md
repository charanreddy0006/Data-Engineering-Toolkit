# Data Quality, Governance and Security in Modeling


## Data Quality

A data model should make invalid data detectable.

Core dimensions:

```text
Completeness
Uniqueness
Validity
Consistency
Accuracy
Timeliness
```

## Completeness

```sql
SELECT COUNT(*)
FROM vehicle
WHERE vin IS NULL;
```

## Uniqueness

```sql
SELECT vin, COUNT(*)
FROM vehicle
GROUP BY vin
HAVING COUNT(*) > 1;
```

## Validity

```sql
SELECT COUNT(*)
FROM vehicle
WHERE manufacture_year < 1900;
```

## Referential Integrity

```sql
SELECT v.vehicle_id
FROM vehicle v
LEFT JOIN customer c
  ON v.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
```

## Business Rules

Example:

```text
sales_amount >= 0
service_cost >= 0
VIN length = 17
battery_level between 0 and 100
```

## Governance

Every important dataset should have metadata such as:

```text
Owner
Business definition
Source
Refresh frequency
SLA
Sensitivity
Retention
Quality expectations
```

## Data Dictionary

Example:

| Column | Definition |
|---|---|
| net_amount | Sale value after discount |
| vehicle_key | Warehouse surrogate key |
| event_time | Time event occurred on vehicle |
| current_flag | Whether dimension version is current |

## Security

Data models should consider:

```text
PII
Access control
Encryption
Masking
Retention
Audit logging
```

Customer data may contain:

```text
name
phone
email
address
```

Only necessary attributes should be exposed to every consumer.

## Data Contracts

A data contract can define:

```text
Schema
Required columns
Allowed values
Owner
Change process
Delivery expectations
```

## Schema Evolution

A new field can be safe:

```text
new optional column
```

A breaking change can be:

```text
rename customer_id
change numeric to string
remove required field
```

The model and contract should classify changes.

## Lineage

Document:

```text
Source
   ↓
Transformation
   ↓
Model
   ↓
Dashboard
```

Lineage makes incident investigation easier.

## Retention

Not every raw event needs indefinite storage.

Define:

```text
Operational retention
Raw retention
Curated retention
Regulatory retention
```

## Quality as Code

Automate important checks in pipelines.

```text
Build
 ↓
Transform
 ↓
Test
 ↓
Publish
```

Do not depend only on manual validation.

## Key Principle

A model is not production-ready merely because its SQL runs. It also needs
quality, ownership, governance, security, and operational expectations.
