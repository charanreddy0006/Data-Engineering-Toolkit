# Associative and Weak Entities

## Associative entity

Many-to-many relationships require an intermediate structure.

Example:

```text
Service Order N:M Part
```

becomes:

```text
Service Order 1:N ServiceOrderPart N:1 Part
```

Example:

```sql
CREATE TABLE service_order_part (
    service_order_id BIGINT NOT NULL,
    line_number INTEGER NOT NULL CHECK (line_number > 0),
    part_id BIGINT NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC(12,2) NOT NULL CHECK (unit_price >= 0),
    PRIMARY KEY (service_order_id, line_number)
);
```

## Weak entity idea

A service-order line has little meaning without its order.

A composite business identity can be:

```text
service_order_id + line_number
```

A surrogate line key can also be used when downstream systems need it.

Preserve business uniqueness:

```sql
UNIQUE (service_order_id, line_number)
```

## Why this matters

A proper associative model prevents:

- comma-separated lists;
- duplicate parts;
- orphan records;
- arbitrary limits;
- inconsistent quantities.
