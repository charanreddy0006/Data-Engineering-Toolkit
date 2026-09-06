# Cost-Aware Data Modeling

Scale changes modeling economics.

Telemetry can produce billions of rows.

## Cost drivers

- storage;
- scans;
- compute;
- repeated transformations;
- unnecessary joins;
- excessive retention;
- small files/partitions.

## Modeling choices

Use:

```text
raw events -> authoritative history
daily aggregates -> dashboard serving
```

Do not make every dashboard scan raw events if the metric can safely be served from a curated
aggregate.

## Retention tiers

Conceptually:

```text
hot -> frequent access
warm -> occasional access
cold -> archive
```

Actual implementation depends on platform.

## Key principle

Optimize total cost of ownership, not just query speed.
