# SQL, Schema and Data-Quality Testing

## SQL

Validate:

- syntax,
- joins,
- aggregation,
- constraints,
- expected columns.

## Schema

Check:

```text
required fields
data types
field compatibility
```

## Data quality

Automated rules can include:

```text
vehicle_id NOT NULL
event_id UNIQUE
speed_kph >= 0
battery_pct BETWEEN 0 AND 100
timestamp valid
```

## CI gate

```text
build
 ↓
test dataset
 ↓
quality rules
 ↓
pass/fail
```

The goal is to catch unsafe transformation changes before production.
