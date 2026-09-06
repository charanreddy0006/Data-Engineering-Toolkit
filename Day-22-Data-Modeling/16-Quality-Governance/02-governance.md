# Governance and Data Modeling

A governed model records:

- owner;
- steward;
- source;
- definition;
- sensitivity;
- retention;
- lineage;
- quality;
- approved usage.

## Customer data

Broad analytical models should avoid exposing unnecessary raw contact information.

A curated model can use:

```text
customer_key
```

rather than repeatedly exposing sensitive fields.

## Lineage

Example:

```text
Vehicle gateway
  -> raw telemetry
  -> canonical telemetry
  -> vehicle_daily_metrics
  -> fleet dashboard
```

## Ownership

Every important model should have a responsible team.

That owner should be able to answer:

- what the model means;
- what changed;
- who depends on it;
- how to recover it.
