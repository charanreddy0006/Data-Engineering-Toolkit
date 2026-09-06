# Late-Arriving Dimensions

A fact can arrive before its dimension.

Example:

```text
Telemetry at 10:00
Vehicle master at 12:00
```

## Strategies

### Unknown member

```text
vehicle_key = -1
```

### Inferred member

Create a minimal dimension row from identifiers available in the fact.

### Delay fact

Wait until the dimension exists.

## Decision

```text
Need low latency?
  yes -> unknown/inferred
  no  -> delay may be acceptable
```

## Automobile example

Do not drop telemetry because vehicle registration is delayed.

Preserve the event, then reconcile the dimension later.

## Operational requirement

Track how many facts currently use the unknown member. A rising number is a useful quality signal.
