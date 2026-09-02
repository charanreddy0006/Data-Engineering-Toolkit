# Keys and Constraints


## Why Keys Matter

Keys provide identity and relationships.

Without reliable keys, pipelines cannot safely:

- join records
- detect duplicates
- update entities
- track history
- enforce referential integrity

## Primary Key

Uniquely identifies a row.

```sql
CREATE TABLE dealer (
    dealer_id BIGINT PRIMARY KEY,
    dealer_name VARCHAR(150) NOT NULL
);
```

## Candidate Key

A candidate key is any minimal set of attributes capable of uniquely
identifying a row.

Example:

```text
customer_id
email
```

may both be candidates, depending on business rules.

## Natural Key

A natural key has business meaning.

Automobile example:

```text
VIN
```

## Surrogate Key

A surrogate key is generated for the data platform.

```text
vehicle_key = 105203
```

It is useful when:

- source identifiers differ
- source identifiers can change
- SCD Type 2 is required
- multiple source systems are integrated

## Foreign Key

A foreign key establishes a relationship.

```sql
FOREIGN KEY (customer_id)
REFERENCES customer(customer_id)
```

## Composite Key

Several columns form uniqueness.

```text
(vehicle_id, event_date)
```

or:

```text
(vehicle_id, feature_id)
```

## Unique Constraint

```sql
vin VARCHAR(17) UNIQUE
```

## NOT NULL

Use it when a value is required.

## CHECK

Example:

```sql
CHECK (sales_amount >= 0)
```

## Referential Integrity

If:

```text
vehicle.customer_id = 10
```

then customer 10 should exist in the referenced table.

## Natural vs Surrogate

| Natural | Surrogate |
|---|---|
| Business meaning | No business meaning |
| Source-derived | Generated |
| Can change | Usually stable |
| Useful for source integration | Useful for warehouse identity |

## Warehouse Pattern

```text
DIM_VEHICLE

vehicle_key     PK
vehicle_id      source ID
vin             business identifier
model_key       FK
valid_from
valid_to
current_flag
```

## Unknown Member

Analytical systems sometimes need an "unknown" dimension row.

Example:

```text
vehicle_key = 0
vehicle_id  = UNKNOWN
```

This prevents fact rows from disappearing when a dimension arrives late.

## Late-Arriving Dimensions

A sale may arrive before its customer dimension.

A pipeline can temporarily use an unknown key and later correct the relationship.

## Key Design Questions

```text
Is the key unique?
Is it stable?
Can it change?
Does it cross systems?
Is it compact?
Will it work with historical versions?
```

## Common Mistake

Using a mutable business value as a warehouse primary key can make history
and integration unnecessarily difficult.

## Practical Exercise

Choose keys for:

```text
Customer
Vehicle
Model
Dealer
Sale
Telemetry Event
```

For each, explain why the chosen key is natural, surrogate, composite, or
generated.
