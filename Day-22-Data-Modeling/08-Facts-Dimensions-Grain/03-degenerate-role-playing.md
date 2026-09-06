# Degenerate and Role-Playing Dimensions

## Degenerate dimension

A business identifier stored directly in a fact when a separate descriptive dimension is not needed.

Examples:

```text
invoice_number
service_order_number
```

## Role-playing dimension

One dimension is used in multiple semantic roles.

Example:

```text
dim_date
  ├── opened_date_key
  ├── diagnosed_date_key
  └── closed_date_key
```

All reference the same date dimension.

## Why roles matter

A generic `date_key` can become ambiguous.

Use explicit names:

```text
opened_date_key
closed_date_key
```

## Automobile example

A trip can have:

```text
start_date_key
end_date_key
```

The dimension is shared; the semantic role differs.
