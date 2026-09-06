# Bridge Tables

Bridge tables handle many-to-many analytical relationships.

Example:

```text
Service Order N:M Technician
```

Bridge:

```text
service_order_technician
service_order_id
technician_key
allocation_pct
```

## Why allocation matters

Suppose a service order costs $1,000 and two technicians worked on it.

Direct joining can show:

```text
Technician A -> $1,000
Technician B -> $1,000
```

which totals $2,000 incorrectly.

With allocation:

```text
A = 60%
B = 40%
```

then:

```text
A -> $600
B -> $400
```

## Rule

Whenever a many-to-many relationship meets additive measures, define how measures are allocated.
