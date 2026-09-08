# Data Quality SLOs

An SLO defines a target level of reliability.

Example:

```text
99.9% of daily telemetry rows
must have valid vehicle_id.
```

Freshness example:

```text
99% of hourly partitions arrive within 10 minutes.
```

The remaining percentage forms an error budget.

SLOs should reflect business requirements rather than arbitrary numbers. A 99.999% target is not useful if the business does not need it and the source cannot realistically provide it.
