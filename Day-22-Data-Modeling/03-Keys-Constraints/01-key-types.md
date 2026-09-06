# Key Types

## Primary key

Uniquely identifies a row.

```sql
PRIMARY KEY (vehicle_id)
```

## Candidate key

Any minimal set of attributes that can uniquely identify a record.

A vehicle may have:

```text
vehicle_id
VIN
```

as candidate keys.

## Natural/business key

Has business meaning.

Example:

```text
VIN
```

## Surrogate key

Generated without business meaning.

Example:

```text
vehicle_key = 48291
```

## Composite key

Uses multiple columns:

```text
(service_order_id, line_number)
```

## Foreign key

References another table's key.

```sql
vehicle.model_id REFERENCES vehicle_model(model_id)
```

## Warehouse pattern

```text
surrogate_key -> joins to fact
business_key  -> durable source identity
```

## Rule

Choose keys from business uniqueness and stability, not merely convenience.
