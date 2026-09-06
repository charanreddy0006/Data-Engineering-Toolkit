# Data Quality in the Model

Quality rules should come from business meaning.

## Completeness

```text
vehicle_id IS NOT NULL
```

## Uniqueness

```text
event_id unique
```

## Validity

```text
battery_soc between 0 and 100
```

## Consistency

```text
closed_at >= opened_at
```

## Referential integrity

```text
trip.vehicle_id exists in vehicle
```

## Timeliness

```text
events arrive within expected latency
```

## Rule catalog

Each critical rule should specify:

```text
rule
owner
severity
action
```

Example:

```text
Rule: one current SCD row per vehicle
Severity: Critical
Action: fail publish
```

Quality is part of model design, not an afterthought.
