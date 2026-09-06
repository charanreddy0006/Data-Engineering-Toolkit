# Fact Table Types

## Transaction fact

One row per business transaction.

Example:

```text
one row per service order line
```

## Periodic snapshot

One row per entity per fixed interval.

Example:

```text
one row per vehicle per day
```

## Accumulating snapshot

One row tracks process milestones.

Service:

```text
opened
diagnosed
repair_started
repair_completed
closed
```

## Factless fact

Records an event without numeric measures.

Example:

```text
vehicle_feature_activation
```

The existence of the row is the fact.

## Automobile mapping

```text
Trip               -> transaction fact
Vehicle-day        -> periodic snapshot
Service lifecycle  -> accumulating snapshot
Feature activation -> factless fact
```
