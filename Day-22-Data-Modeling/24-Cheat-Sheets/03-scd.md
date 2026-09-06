# SCD Cheat Sheet

## Type 0

```text
Never change
```

## Type 1

```text
Overwrite
```

## Type 2

```text
Expire old
Insert new
```

Typical columns:

```text
business_key
surrogate_key
valid_from
valid_to
is_current
```

Type 2 tests:

```text
one current row
valid_from < valid_to
no interval overlap
```

Late dimension:

```text
unknown
inferred
delay
reconcile
```
