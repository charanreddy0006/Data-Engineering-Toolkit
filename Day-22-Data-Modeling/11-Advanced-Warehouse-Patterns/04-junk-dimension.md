# Junk Dimensions

A junk dimension groups low-cardinality flags.

Example:

```text
warranty_flag
urgent_flag
roadside_assistance_flag
customer_wait_flag
```

Instead of creating many tiny dimensions, combinations can be represented by one compact key.

Example:

```text
junk_key = 17
```

meaning:

```text
warranty = Y
urgent = N
roadside = Y
```

## Use only low-cardinality attributes

Do not put:

```text
VIN
customer_id
telemetry_event_id
```

into a junk dimension.

## Automobile use

Operational flags on a service fact can be good candidates.
