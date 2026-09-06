# Surrogate vs Natural Keys

VIN is meaningful:

```text
DEMO-VIN-001
```

A warehouse surrogate key is not:

```text
vehicle_key = 120934
```

## Why surrogate keys help

SCD Type 2 needs multiple historical versions.

```text
vehicle_key | vehicle_id | color | valid_from | valid_to
101         | V100       | White | Jan 1      | Mar 10
205         | V100       | Blue  | Mar 10     | current
```

The business key remains `V100`, while each version has a distinct warehouse key.

## Do not discard business keys

A surrogate key does not replace the source identifier.

Store both when appropriate:

```text
vehicle_key
vehicle_id
```

## Practical warehouse recommendation

Use:

```text
surrogate key for fact joins
business key for identity/reconciliation
```

This makes history explicit and makes source reconciliation easier.
